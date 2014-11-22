Clay = require './index'

Clay 'init', {gameId: '1', debug: true}

Clay 'ui.ads.banner', {position: 'bottom'}, (err, ad) ->
  document.body.appendChild(ad.$el)
