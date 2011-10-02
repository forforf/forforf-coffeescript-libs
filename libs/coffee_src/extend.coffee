#NOTE!!
#MOVED TO forf.coffee

root = exports ? this
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


