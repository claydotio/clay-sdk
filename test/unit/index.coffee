Clay = require 'index'

describe 'Clay \'ui\'', ->
  it 'should be callable', (done) ->
    Clay 'ui.version', (err) ->
      done(err)
