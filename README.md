TiExtendWeb module for iPhone
-----

http://www.youtube.com/watch?v=LvcJ70F9DSM&feature=youtu.be

![image](tiextendweb.png)

**This module is no support.**

## Usage

See `example/app.js`

## Feature

* Custom WebView scroll speed (Same TableView / ScrollView scroll speed)
* Remove scroll bounce shadow
* Remove scroll delay
* Communication between WebView and Titanium app (Code base is [TiCordova](https://github.com/yagitoshiro/TiCordova))
* Change UserAgent (Only **createWebView**)

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

The MIT License (MIT) Copyright (c) 2013 Ryutaro Miyashita

Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.

### TiCordova

[https://github.com/yagitoshiro/TiCordova/blob/master/LICENSE](https://github.com/yagitoshiro/TiCordova/blob/master/LICENSE)
> This program is distributed under MIT License. Grab it and you can go as far as you can go.
> http://opensource.org/licenses/MIT

### FastClick

[https://raw.github.com/ftlabs/fastclick/master/LICENSE.txt](https://raw.github.com/ftlabs/fastclick/master/LICENSE.txt)
> Copyright (C) 2012 The Financial Times Ltd.

> Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:

> The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.

> THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.