iJLib = require './isJson'

iJ = iJLib.isJSON

console.log(iJ)

console.log( iJ "Hello World" )
#     #=> false
#
console.log(  iJ "\"Hello World\"" )
#     #=> true
#
console.log(  iJ {a: 'A', b: [{c: 'C'}, 'd']} )
#     #=> false
#
console.log( iJ JSON.stringify {a: 'A', b: [{c: 'C'}, 'd']} )
#     #=> true

