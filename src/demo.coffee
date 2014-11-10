Clay = require './index'

Clay.init({gameId: 1, debug: true}).then ->
  adTop = Clay.ui 'pageAd'
  adBottom = Clay.ui 'bannerAd', position: 'bottom'
  adFull = Clay.ui 'bannerAd', position: 'top'

  document.body.appendChild adTop.$el
  document.body.appendChild adBottom.$el
  document.body.appendChild adFull.$el
, (err) -> console.log err
