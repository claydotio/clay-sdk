require './polyfill'

Clay = require 'clay-sdk-base'

ui = require './ui'

Clay 'register', {method: 'ui', fn: ui}

module.exports = Clay
