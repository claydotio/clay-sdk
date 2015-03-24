z = require 'zorium'
Clay = require 'clay-sdk-base'

styles = require './index.styl'

UIComponent = require '../ui_component'
config = require '../../config'
url = require '../../util/url'
environment = require '../../util/environment'

isPortrait = ->
  window.innerHeight > window.innerWidth

module.exports = class PageAd extends UIComponent
  constructor: ({gameId} = {}) ->
    super()
    styles.use()

    # Leadbolt params
    lang = if window.navigator.language \
           then window.navigator.language
           else window.navigator.browserLanguage
    scr_w = window.screen.width
    scr_h = window.screen.height
    referer = window.location.href.substr(0, 255)

    @iframeClass = if isPortrait() \
                    then '.c-page-ad-full-portrait'
                    else '.c-page-ad-full-landscape'


    queryParams = {
      gameId
      style: if isPortrait() then 'pagePortrait' else 'pageLandscape'
      redirect: true

      # Leadbolt params
      lang
      scr_w
      scr_h
      referer
    }

    unless environment.isMobile()
      queryParams.isMobile = false

    @iframeUrl = url.queryPath config.PUBLIC_CLAY_API_URL + '/ads', queryParams

  render: =>
    z '.c-page-ad-background',
      z '.c-page-ad-close', {onclick: @remove},
        z 'i.clay-icon.clay-icon-close'
      z "iframe.#{@iframeClass}",
        src: @iframeUrl
        scrolling: 'no'
