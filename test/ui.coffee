ui = require 'ui'

describe 'ui', ->
  it 'ui() throws if component name not found', (done) ->
    try
      ui 'INVALID'
      done new Error 'expected error'
    catch e
      done()
