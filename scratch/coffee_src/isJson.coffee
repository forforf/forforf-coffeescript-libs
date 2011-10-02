#### Overview
#
# isJSON detects whether a value is valid JSON or not
#
#     isJSON "Hello World"
#     #=> false
#
#     isJSON "\"Hello World\""
#     #=> true
#
#     isJSON {a: 'A', b: [{c: 'C'}, 'd']}
#     #=> false
#
#     isJSON JSON.stringify {a: 'A', b: [{c: 'C'}, 'd']}
#     #=> true
#
#
#  License: MIT

#### Code Documentation
root = exports ? this
#Helper function to detect blank data
isBlank = (str) ->
    return (!str || /^\s*$/.test(str))

#Main function accepts any type of data
#Based on Prototype's isJSON
#http://prototypejs.org/assets/2010/10/12/prototype.js
isJSON = (val) ->
  return false if typeof val != 'string'
  str = val
  return false if isBlank(str)
  str = str.replace(/\\(?:["\\\/bfnrt]|u[0-9a-fA-F]{4})/g, '@')
  str = str.replace(/"[^"\\\n\r]*"|true|false|null|-?\d+(?:\.\d*)?(?:[eE][+\-]?\d+)?/g,  ']')
  str = str.replace(/(?:^|:|,)(?:\s*\[)+/g, '')
  return (/^[\],:{}\s]*$/).test(str)

root.isJSON = isJSON
