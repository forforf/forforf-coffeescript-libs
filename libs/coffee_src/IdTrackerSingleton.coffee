#--- Singleton for Keeping Track of Value Container Entities ---
#
# http://stackoverflow.com/questions/4214731/coffeescript-global-variables

root = exports ? this 

#Libraries
extendLib = require './extend'
extend = extendLib.extend

# The publicly accessible Singleton fetcher
class IdBinder
  _instance = undefined # Must be declared here to force the closure on the class
  @get: (args) -> # Must be a static method
    _instance ?= new _SingletonBinder args

# The actual Singleton class
class _SingletonBinder

  constructor: (@args) ->
    defaults = {prefix: ""}
    @options = extend(defaults, @args)
    #console.log 'IdTracker: ', @options
    @ids = {}
    @nextId = 0
    @idPrefix = @options.prefix #'johaIdBinder-'

  assignId: (boundToThis) ->
    boundId = @idPrefix + @nextId 
    @nextId++
    @ids[boundId] = boundToThis
    boundId

  getBoundById: (id) ->
     @ids[id]

  echo: ->
    @args

root.IdBinder = IdBinder

#test
#a = root.IdBinder.get({prefix: "j-"})
#a.assignId("A")
#b = root.IdBinder.get()
#b.assignId("B")
#console.log a.ids
#console.log b.ids


 
