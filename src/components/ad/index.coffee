z = require 'zorium'

require './index.styl'

module.exports = class Ad
  constructor: ({@type}) -> null
  render: =>
    return z 'div.green', "Hello World! #{@type}"
