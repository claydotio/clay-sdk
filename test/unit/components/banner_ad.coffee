BannerAd = require 'components/banner_ad'
Clay = require 'clay-javascript-sdk'

describe 'banner ad', ->
  it 'renders iframe bottom', ->
    Clay.init(gameId: '1')
    banner = new BannerAd position: 'bottom'
    dom = banner.render()
    dom.tag.should.be 'iframe'
    dom.attrs.className.should.be 'c-banner-ad-bottom'

  it 'renders iframe top', ->
    Clay.init(gameId: '1')
    banner = new BannerAd position: 'top'
    dom = banner.render()
    dom.tag.should.be 'iframe'
    dom.attrs.className.should.be 'c-banner-ad-top'
