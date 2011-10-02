jC = require '../coffee_src/johaComponents'
editBtnBase = jC.editBtnBase

describe 'johaComponents', ->
  describe 'editBtnBase', ->
    beforeEach ->
      @editBtn = editBtnBase('dom-id')

    it 'should do something', ->
        expect( @editBtn.tagName ).toEqual 'bar'
