should = require('clay-chai').should()

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

  it 'errors if missing position', (done) ->
    Clay.init(gameId: '1')

    try
      new BannerAd()
      done new Error 'Expected error'
    catch e
      e.message.should.be 'Invalid or missing position'
      done()

  it 'errors if invalid position', (done) ->
    Clay.init(gameId: '1')

    try
      new BannerAd position: 'INVALID'
      done new Error 'Expected error'
    catch e
      e.message.should.be 'Invalid or missing position'
      done()
