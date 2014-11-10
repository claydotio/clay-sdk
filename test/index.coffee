# Make sure polyfill has been loaded
Clay = require 'index'

testsContext = require.context('./unit', true)
testsContext.keys().forEach testsContext
