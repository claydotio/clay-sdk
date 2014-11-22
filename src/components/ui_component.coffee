z = require 'zorium'

module.exports = class UIComponent
  constructor: ->
    @_eventListeners = {}
    @$el = document.createElement 'div'

  redraw: =>
    z.render @$el, @render()

  remove: =>
    @$el.parentElement.removeChild @$el
    @emit 'remove'

  on: (name, fn) =>
    (@_eventListeners[name] = @_eventListeners[name] or []).push(fn)

  emit: (name) =>
    list = @_eventListeners[name] or []
    i = list.length
    while i
      i -= 1
      list[i].apply(null, [].slice.call(arguments, 1))
