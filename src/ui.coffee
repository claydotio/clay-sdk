z = require 'zorium'

components =
  ad: require './components/ad'

ui = (componentName, options) ->
  unless components[componentName]
    throw new Error 'Component not found', componentName

  ComponentClass = components[componentName]

  component = new ComponentClass options

  component.$el = document.createElement 'div'
  component.redraw = ->
    z.render component.$el, component.render()

  component.redraw()

  return component

window.Clay?.ui = ui
module.exports = ui
