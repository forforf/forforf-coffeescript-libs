root = exports ? this

getKeys = (obj) -> keys = key for own key of obj
root.getKeys = getKeys

getValues = (obj) -> 
  for own key,val of obj
    obj[key]
root.getValues = getValues

deepEquiv = (obj1, obj2) ->
  str_obj1 = JSON.stringify(obj1)
  str_obj2 = JSON.stringify(obj2)
  str_obj1 is str_obj2    
  
equiv = (obj1, obj2) ->
  if obj1 is obj2
    return true
  else 
    if deepEquiv(obj1, obj2)
      return true
  false
root.equiv = equiv

diff = (obj1, obj2) ->
  for own key, val of obj1
    memo = memo || {}
    unless equiv(obj1[key], obj2[key])
      memo[key] = [obj1[key], obj2[key]]
  memo
#=> result= {key:[obj1.key, obj2,key], etc} #when obj1[key] != obj2[key]
root.diff = diff
    
arrayContains = (a, obj) ->
  for item in a
    if equiv item,obj
      return true
  false
root.arrayContains = arrayContains

#returns (unique!) values that exist in both arrays
arrayIntersection = (a1, a2) ->
  intersects = []
  if a2.length > a1.length
    iter = a2
    compr = a1
  else
    iter = a1
    compr = a2

  for item in iter
    if arrayContains(compr, item)
      unless arrayContains(intersects, item)
        intersects.push(item)
    null #for loop ran for side effect

  intersects
root.arrayIntersection = arrayIntersection

arrayRemoveItem = (a, obj) ->
  for item in a
    if item is obj
     idx = a.indexOf obj
     a.splice idx, 1
  a
root.arrayRemoveItem = arrayRemoveItem

#destructive, duplicates are maintained
arrayRemoveSet = (a, objs) ->
  throw "arrayRemoveSet remove items from a non existent array" if a is undefined
  for obj in objs
    arrayRemoveItem(a, obj)
    null
  a
root.arrayRemoveSet = arrayRemoveSet

#non-destructive, duplicates are consolidated
arraySubtract = (srcAry, opAry) ->
  remaining = []
  for item in srcAry
    unless arrayContains(opAry, item)
      unless arrayContains(remaining, item)
        remaining.push(item)
    null
  remaining
root.arraySubtract = arraySubtract
  
arrayContainsAll = (a, subset) ->
  retVal = true
  for item in subset
    unless arrayContains a, item
      retVal = false
  retVal 
root.arrayContainsAll = arrayContainsAll

objKeyPosition = (obj, key) ->
  i = 0
  for k of obj
    if deepEquiv(k, key)
      return i
    i += 1
  return undefined  
root.objKeyPosition = objKeyPosition
  
objSize = (obj) ->
  size = 0
  for own key of obj
    size++
  size
root.objSize = objSize

#from sciberas @ http://stackoverflow.com/questions/332422/how-do-i-get-the-name-of-an-objects-type-in-javascript
getType = (obj) ->
  return '[object Null]' if obj is null #special case
  return Object.prototype.toString.call(obj)
root.getType = getType

#code from http://forrst.com/posts/Deep_Extend_an_Object_in_CoffeeScript-DWu

deepExtend = (object, extenders...) ->
  return {} if not object?
  for other in extenders
    for own key, val of other
      if not object[key]? or typeof val isnt "object"
        object[key] = val
      else
        object[key] = deepExtend object[key], val

  object
root.extend = deepExtend
  
