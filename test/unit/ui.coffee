Promise = require 'bluebird'

ui = require 'ui'

packageConfig = require '../../package.json'

describe 'ui()', ->
  before ->
    ui = ui(Promise.resolve {gameId: '1'})

  it 'has a version', (done) ->
    ui 'version', [], (err, v) ->
      v.should.be 'v' + packageConfig.version
      done(err)

  it 'returns banner ad components', (done) ->
    ui 'ads.banner', [{position: 'top'}], (err, banner) ->
      if err
        return done err

      banner.$el.should.exist

      ui 'ads.banner', [{position: 'bottom'}], (err, banner) ->
        banner.$el.should.exist
        done err

  it 'returns page ad components', (done) ->
    ui 'ads.page', [], (err, ad) ->
      ad.$el.should.exist
      done(err)

  it 'fails to return invalid component', (done) ->
    ui 'INVALID', [], (err) ->
      err.should.exist
      done()

  it 'fails when options is array', (done) ->
    ui 'ads.banner', [[]], (err) ->
      err.should.exist
      done()

  it 'fails when options is a string', (done) ->
    ui 'ads.banner', ['options'], (err) ->
      err.should.exist
      done()

  it 'fails when options is a number', (done) ->
    ui 'ads.banner', [1], (err) ->
      err.should.exist
      done()
