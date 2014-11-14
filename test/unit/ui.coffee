ui = require 'ui'

packageConfig = require '../../package.json'

describe 'ui()', ->
  it 'has a version', ->
    ui.version.should.be 'v' + packageConfig.version

  it 'returns banner ad components', ->
    banner = ui('bannerAd', {position: 'top'})
    banner.$el.should.exist

    banner = ui('bannerAd', {position: 'bottom'})
    banner.$el.should.exist

  it 'returns page ad components', ->
    ad = ui('pageAd')
    ad.$el.should.exist

  it 'fails to return invalid component', (done) ->
    try
      ui('INVALID')
      done new Error 'expected error'
    catch
      done()

  it 'fails when options is array', (done) ->
    try
      ui('bannerAd', [])
      done new Error 'expected error'
    catch
      done()

  it 'fails when options is a string', (done) ->
    try
      ui('bannerAd', 'options')
      done new Error 'expected error'
    catch
      done()

  it 'fails when options is a number', (done) ->
    try
      ui('bannerAd', 1)
      done new Error 'expected error'
    catch
      done()
