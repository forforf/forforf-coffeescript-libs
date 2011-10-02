root = exports ? this

#require extend
#require Singleton

class Binder extends Singleton
  
  constructor:  ->
  binderData = {}
  
  add: (bindKey, label, val) ->
    addData = {}
    addData[label] = val
    bindData = binderData[bindKey]||{}
    binderData[bindKey] = deepExtend(bindData, addData)

  getBindings: (commonKey) ->
    binderData[commonKey]

  getLabels: (commonKey) ->
    binderObj = binderData[commonKey]
    labels = (labels for labels of binderObj)
 
root.Binder = Binder
#test = new Binder("LabelA", "LabelB")

#test.addA("AB", "a")
#test.addB("AB", "b")

#newTest = new Binder
#console.log test.getBindings("AB")
#console.log newTest.getBindings("AB")
#console.log test.dataA
#console.log test.dataB
#console.log test.getBindings("AB")
