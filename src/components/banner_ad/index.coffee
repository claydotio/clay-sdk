z = require 'zorium'
Clay = require 'clay-sdk-base'

styles = require './index.styl'

UIComponent = require '../ui_component'
config = require '../../config'
url = require '../../util/url'

module.exports = class BannerAd extends UIComponent
  constructor: ({gameId} = {}, {position} = {}) ->
    super()
    styles.use()

    if position not in ['top', 'bottom']
      throw new Error 'Invalid or missing position'

    lang = if window.navigator.language \
           then window.navigator.language
           else window.navigator.browserLanguage
    scr_w = window.screen.width
    scr_h = window.screen.height
    referer = window.location.href.substr(0, 255)

    @iframeClass = switch position
      when 'top' then '.c-banner-ad-top'
      when 'bottom' then '.c-banner-ad-bottom'

    @iframeUrl = url.queryPath config.API_URL + '/ads', {
      gameId
      style: 'banner'
      redirect: true

      # Leadbolt params
      lang
      scr_w
      scr_h
      referer
    }

  render: =>
    z "iframe.#{@iframeClass}",
      frameborder: 0
      src: @iframeUrl
      allowtransparency: true
      scrolling: 'no'
