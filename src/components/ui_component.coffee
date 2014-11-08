z = require 'zorium'

module.exports = class UIComponent
  constructor: ->
    @_events = {}
    @$el = document.createElement 'div'

  redraw: =>
    z.render @$el, @render()

  remove: =>
    @$el.parentElement.removeChild @$el
    @emit 'remove'

  on: (name, fn) =>
    (@_events[name] = @_events[name] or []).push(fn)

  emit: (name) =>
    list = @_events[name] or []
    i = list.length
    while i
      i -= 1
      list[i].apply(1, [].slice.call(arguments, 1))
