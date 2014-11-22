should = require('clay-chai').should()
rewire = require 'rewire'

PageAd = rewire 'components/page_ad'

describe 'page ad', ->
  it 'renders iframe portrait', ->
    PageAd.__set__ 'checkPortrait', -> true

    ad = new PageAd(gameId: '1')
    dom = ad.render()
    dom.tag.should.be 'div'
    dom.children[0].attrs.className.should.be 'c-page-ad-close'
    dom.children[1].attrs.className.should.be 'c-page-ad-full-portrait'

  it 'renders iframe landscape', ->
    PageAd.__set__ 'checkPortrait', -> false

    ad = new PageAd(gameId: '1')
    dom = ad.render()
    dom.tag.should.be 'div'
    dom.children[0].attrs.className.should.be 'c-page-ad-close'
    dom.children[1].attrs.className.should.be 'c-page-ad-full-landscape'
