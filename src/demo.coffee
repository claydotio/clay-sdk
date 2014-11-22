Clay = require './index'

Clay 'init', {gameId: '1', debug: true}, (err) -> console.log err

Clay 'ui.ads.page', (err, adTop) ->
  document.body.appendChild adTop.$el
Clay 'ui.ads.banner', position: 'bottom', (err, adBottom) ->
  document.body.appendChild adBottom.$el
Clay 'ui.ads.banner', position: 'top', (err, adFull) ->
  document.body.appendChild adFull.$el
