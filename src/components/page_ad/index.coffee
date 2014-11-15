z = require 'zorium'
Clay = require 'clay-sdk-base'

styles = require './index.styl'

UIComponent = require '../ui_component'
config = require '../../config'
url = require '../../util/url'

module.exports = class PageAd extends UIComponent
  constructor: ({gameId} = {}) ->
    super()
    styles.use()

    lang = if window.navigator.language \
           then window.navigator.language
           else window.navigator.browserLanguage
    scr_w = window.screen.width
    scr_h = window.screen.height
    referer = window.location.href.substr(0, 255)

    isPortrait = scr_h > scr_w

    @iframeClass = if isPortrait \
                    then '.c-page-ad-full-portrait'
                    else '.c-page-ad-full-portrait'


    @iframeUrl = url.queryPath config.API_URL + '/ads', {
      gameId
      style: if isPortrait then 'pagePortrait' else 'pageLandscape'
      redirect: true

      # Leadbolt params
      lang
      scr_w
      scr_h
      referer
    }

  render: =>
    z '.c-page-ad-background',
      z '.c-page-ad-close', {onclick: @remove},
        z 'i.icon.icon-close'
      z "iframe.#{@iframeClass}",
        frameborder: 0
        src: @iframeUrl
        allowtransparency: true
        scrolling: 'no'
