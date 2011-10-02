(function() {
  var isBlank, isJSON;
  isBlank = function(str) {
    return !str || /^\s*$/.test(str);
  };
  isJSON = function(val) {
    var str;
    if (typeof val !== 'string') {
      return false;
    }
    str = val;
    if (isBlank(str)) {
      return false;
    }
    str = str.replace(/\\(?:["\\\/bfnrt]|u[0-9a-fA-F]{4})/g, '@');
    str = str.replace(/"[^"\\\n\r]*"|true|false|null|-?\d+(?:\.\d*)?(?:[eE][+\-]?\d+)?/g, ']');
    str = str.replace(/(?:^|:|,)(?:\s*\[)+/g, '');
    return /^[\],:{}\s]*$/.test(str);
  };
}).call(this);
