Promise = require 'bluebird'
Clay = require './index'

Clay.init({gameId: '1', debug: true}).then null, (err) -> console.log err

Promise.all [
  Clay.ui 'pageAd'
  Clay.ui 'bannerAd', position: 'bottom'
  Clay.ui 'bannerAd', position: 'top'
]
.spread (adTop, adBottom, adFull) ->
  document.body.appendChild adTop.$el
  document.body.appendChild adBottom.$el
  document.body.appendChild adFull.$el
