TiUIWebView extend module for iOS with Titanium 3.2 +
-----

http://www.youtube.com/watch?v=LvcJ70F9DSM&feature=youtu.be

![](tiextendweb.png)

**This module is no support.**

## Usage

See `example/app.js`.

## Feature

* Change scroll speed (Same Ti.UI.TableView / Ti.UI.ScrollView)
* Remove scroll bounce shadow (iOS 6)
* Remove scroll delay
* Communication between WebView and Titanium app (Code base is [TiCordova](https://github.com/yagitoshiro/TiCordova))
* Change UserAgent (Create only)

```javascript
var webView = Ti.UI.createWebView({
    normalScrollSpeed: true,
    removeShadow: true,
    removeScrollDelay: true,
    userAgentForiOS: 'My Awesome Application UserAgent'
    url: 'index.html'
});
webView.addEventListener('fromWebView', function () {
    alert('Firing from WebView!');
});
```

```html
<a href="extendwebview://fromWebView">View Alert</a>
```

## License

See `LICENSE` file.