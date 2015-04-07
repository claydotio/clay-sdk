z = require 'zorium'

iconStyle = require './icon.styl'
iconStyle.use()

VERSION = 'v1.1.6'

components =
  'ads.banner': require './components/banner_ad'
  'ads.page': require './components/page_ad'

ui = (config) ->
  (componentName, [options], cb) ->
    options ?= {}

    if componentName is 'version'
      return cb null, VERSION

    config.then (config) ->
      unless components[componentName]
        throw new Error 'Component not found' + componentName

      unless Object::toString.call(options) is '[object Object]'
        throw new Error 'options must be an object'

      ComponentClass = components[componentName]

      component = new ComponentClass config, options

      component.redraw()

      return component
    .then (x) -> cb null, x
    .catch cb

module.exports = ui
