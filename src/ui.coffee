z = require 'zorium'
Clay = require 'clay-sdk-base'

iconStyle = require './icon.styl'
iconStyle.use()

components =
  bannerAd: require './components/banner_ad'
  pageAd: require './components/page_ad'

ui = (componentName, options = {}) ->
  Clay.config.then (config) ->
    unless components[componentName]
      throw new Error 'Component not found' + componentName

    if Object::toString.call(options) isnt '[object Object]'
      throw new Error 'options must be an object'

    ComponentClass = components[componentName]

    component = new ComponentClass config, options

    component.redraw()

    return component

ui.version = 'v0.0.7'


module.exports = ui
