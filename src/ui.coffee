z = require 'zorium'
Clay = require 'clay-javascript-sdk'

iconStyle = require './icon.styl'
iconStyle.use()

components =
  bannerAd: require './components/banner_ad'
  pageAd: require './components/page_ad'

ui = (componentName, options) ->
  unless components[componentName]
    throw new Error 'Component not found', componentName

  ComponentClass = components[componentName]

  component = new ComponentClass options

  component.redraw()

  return component


module.exports = ui
