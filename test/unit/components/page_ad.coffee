PageAd = require 'components/page_ad'
Clay = require 'clay-javascript-sdk'

describe 'page ad', ->
  it 'renders iframe', ->
    Clay.init(gameId: '1')
    ad = new PageAd()
    dom = ad.render()
    dom.tag.should.be 'div'
    dom.children[0].attrs.className.should.be 'c-page-ad-close'
    dom.children[1].attrs.className.should.be 'c-page-ad-full-portrait'
