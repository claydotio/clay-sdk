should = require('clay-chai').should()
rewire = require 'rewire'

PageAd = rewire 'components/page_ad'

describe 'page ad', ->
  it 'renders iframe portrait', ->
    PageAd.__set__ 'isPortrait', -> true
    ad = new PageAd gameId: '1'
    dom = ad.render()
    dom.tag.should.be 'div'
    dom.children[0].attrs.className.should.be 'c-page-ad-close'
    dom.children[1].attrs.className.should.be 'c-page-ad-full-portrait'

  it 'renders iframe landscape', ->
    PageAd.__set__ 'isPortrait', -> false
    ad = new PageAd gameId: '1'
    dom = ad.render()
    dom.tag.should.be 'div'
    dom.children[0].attrs.className.should.be 'c-page-ad-close'
    dom.children[1].attrs.className.should.be 'c-page-ad-full-landscape'

  it 'closes', (done) ->
    ad = new PageAd gameId: '1'

    ad.remove = ->
      done()

    ad.render().children[0].attrs.className.should.be 'c-page-ad-close'
    ad.render().children[0].attrs.onclick()
