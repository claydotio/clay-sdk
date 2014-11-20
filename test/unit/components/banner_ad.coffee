should = require('clay-chai').should()

BannerAd = require 'components/banner_ad'
Clay = require 'clay-sdk-base'

describe 'banner ad', ->
  it 'renders iframe bottom', ->
    banner = new BannerAd {gameId: '1'}, {position: 'bottom'}
    dom = banner.render()
    dom.tag.should.be 'iframe'
    dom.attrs.className.should.be 'c-banner-ad-bottom'

  it 'renders iframe top', ->
    banner = new BannerAd {gameId: '1'}, {position: 'top'}
    dom = banner.render()
    dom.tag.should.be 'iframe'
    dom.attrs.className.should.be 'c-banner-ad-top'

  it 'errors if missing position', (done) ->
    try
      new BannerAd()
      done new Error 'Expected error'
    catch e
      e.message.should.be 'Invalid or missing position'
      done()

  it 'errors if invalid position', (done) ->
    try
      new BannerAd position: 'INVALID'
      done new Error 'Expected error'
    catch e
      e.message.should.be 'Invalid or missing position'
      done()
