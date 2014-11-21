## Clay.io SDK

Clay.io SDK

### Install

Add to the top of `<body>`  
Replace `0000` with your gameId

```html
<script>
(function(C,l,a,y,_,i,o){C[_]=C[_]||function(){
(C[_].q=C[_].q||[]).push(arguments)},C[_].l=1*new Date();i=l.createElement(a),
o=l.getElementsByTagName(a)[0];i.async=1;i.src=y;o.parentNode.insertBefore(i,o)
})(window,document,'script','//cdn.wtf/sdk/v1/clay_sdk.js','Clay');

Clay('init', {gameId: 0000})
</script>
```

### Example

```js
Clay('init', {gameId: 0000})

Clay('client.share.any', {text: 'Think you can beat my score of 1,702 in Super Cool Game?'})

Clay('ui.ads.banner', {position: 'top'}, function (err, ad) {
  document.body.appendChild(ad.$el)
})
```

### SDK Base Usage

##### Init

```js
Clay('init', {gameId: 0000})
```

##### Share Any

Share a message using the best available option.  
For example, if called from within the Clay.io Android application, the native
share modal will appear.  
Otherwise, other services such as twitter will be used (if text is < 140 characters).

```js
// client.share.any
//
// @param {Object} params
// @param {String} params.text
Clay('client.share.any', {text: 'Hello World'})
```

##### Version

```js
Clay('version', function (err, version) {
  console.log(version);
})
```

### SDK UI Usage

SDK UI calls may return an SDK UI element, which has a DOM node ($el) that may
be appended to the DOM. E.g. `ad.$el`

##### Full Page Ads

Displays a full-page ad (480 x 320), including a close button.

**Note:** This is only for mobile devices

```js
Clay('ui.ads.page', function (err, ad) {
  document.body.appendChild(ad.$el)
})
```

##### Banner Ads

Displays a banner ad (320 x 50) at either the top or bottom of the screen.

**Note:** This is only for mobile devices

```js
// ui.ads.banner
//
// @param {Object} params
// @param {String} params.position - 'top' or 'bottom'
Clay('ui.ads.banner', {position: 'top'}, function (err, ad) {
  document.body.appendChild(ad.$el)
})
```

### Contributing

##### Install pre-commit hook

`ln -s ../../pre-commit.sh .git/hooks/pre-commit`

```bash
npm install
npm test
```
