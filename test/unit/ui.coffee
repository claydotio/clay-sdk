rewire = require 'rewire'
Promise = require 'bluebird'

ui = rewire 'ui'
ui.__set__ 'Clay.config', Promise.resolve({gameId: '1'})

packageConfig = require '../../package.json'

describe 'ui()', ->

  it 'has a version', ->
    ui.version.should.be 'v' + packageConfig.version

  it 'returns banner ad components', ->
    ui('bannerAd', {position: 'top'})
    .then (banner) ->
      banner.$el.should.exist
    .then ->
      ui('bannerAd', {position: 'bottom'})
    .then (banner) ->
      banner.$el.should.exist

  it 'returns page ad components', ->
    ui('pageAd').then (ad) ->
      ad.$el.should.exist

  it 'fails to return invalid component', (done) ->
    ui('INVALID').then ->
      done new Error 'expected error'
    , ->
      done()

  it 'fails when options is array', (done) ->
    ui('bannerAd', []).then ->
      done new Error 'expected error'
    , ->
      done()

  it 'fails when options is a string', (done) ->
    ui('bannerAd', 'options').then ->
      done new Error 'expected error'
    , ->
      done()

  it 'fails when options is a number', (done) ->
    ui('bannerAd', 1).then ->
      done new Error 'expected error'
    , ->
      done()
