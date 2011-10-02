# http://stackoverflow.com/questions/4214731/coffeescript-global-variables
root = exports ? this 

# The publicly accessible Singleton fetcher
class root.IdBinder
  _instance = undefined # Must be declared here to force the closure on the class

  @get: (args) -> # Must be a static method
    _instance ?= new _SingletonBinder args

# The actual Singleton class
class _SingletonBinder
  constructor: (@args) ->
    #singleton constructors

  #singleton methods

  #testing
  echo: ->
    @args
