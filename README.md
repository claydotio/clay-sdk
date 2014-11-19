## Clay.io SDK

Clay.io SDK

### Install

Add to the top of `<body>`

```html
<script>
(function(ℭ,l,a,y,i,o,〆){ℭ[i]=ℭ[i]||function(){
(ℭ[i].q=ℭ[i].q||[]).push(arguments)},ℭ[i].l=1*new Date();o=l.createElement(a),
〆=l.getElementsByTagName(a)[0];o.async=1;o.src=y;〆.parentNode.insertBefore(o,〆)
})(window,document,'script','//cdn.wtf/sdk/v1/clay_sdk.js','Clay');

Clay('init', {gameId: 0000})
</script>
```

### Example

```js
Clay('init', {gameId: 0000})

Clay('client.share.any', {text: 'Come play a game with me!'})

Clay('ui.ads.banner', {position: 'top'}, function (err, ad) {
  document.body.appendChild(ad.$el)
})
```

### Usage

##### Init

```js
Clay('init', {gameId: 0000})
```

##### Full Page Ads

```js
Clay('ui.ads.page', function (err, ad) {
  document.body.appendChild(ad.$el)
})
```

##### Banner Ads

position: top|bottom

```js
Clay('ui.ads.banner', {position: 'top'}, function (err, ad) {
  document.body.appendChild(ad.$el)
})
```

##### Share Any

Share a message using the best available option.  
For example, if called from within the Clay.io Android application the native
share modal will appear.  
Otherwise, other services such as twitter will be used.

```js
Clay('client.share.any', {text: 'Hello World'})
```

##### Version

```js
Clay('version', function (err, version) {
  console.log(version);
})
```

### Contributing

##### Install pre-commit hook

`ln -s ../../pre-commit.sh .git/hooks/pre-commit`

```bash
npm install
npm test
```
