should = require('clay-chai').should()

UIComponent = require 'components/ui_component'

describe 'ui component', ->
  it 'sets $el on constructor', ->
    component = new UIComponent()
    component.$el.should.exist

  it 'redraws, calling render', ->
    component = new UIComponent()
    callCnt = 0
    component.render = ->
      callCnt += 1

    component.redraw()
    callCnt.should.be 1

  it 'removes', ->
    component = new UIComponent()
    root = document.createElement 'div'
    document.body.appendChild root
    root.appendChild component.$el
    component.remove()
    root.childNodes.length.should.be 0

  it 'has on() listener', ->
    component = new UIComponent()
    component.on.should.be.a.Function

  it 'emits', ->
    component = new UIComponent()
    callCnt = 0
    component.on 'remove', ->
      callCnt += 1
    component.emit 'remove'
    callCnt.should.be 1

  it 'emits on remove', ->
    component = new UIComponent()
    callCnt = 0
    component.on 'remove', ->
      callCnt += 1
    root = document.createElement 'div'
    root.appendChild component.$el
    component.remove()
    callCnt.should.be 1
