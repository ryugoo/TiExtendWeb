// This is a test harness for your module
// You should do something interesting in this harness
// to test out the module and to provide instructions
// to users on how to use it by example.

var TiExtendWeb = require("net.imthinker.modules.tiextendweb");
Ti.API.info("module is => " + TiExtendWeb);

var tabGroup = Ti.UI.createTabGroup();

// Tab 1
var win = Ti.UI.createWindow({
    backgroundColor: "#FFFFFF",
    title: "Enable"
});
var web = Ti.UI.createWebView({
    url: "http://blog.imthinker.net/",
    normalScrollSpeed: true,
    removeShadow: true,
    removeScrollDelay: true
});
win.add(web);
var tab = Ti.UI.createTab({
    window: win,
    title: "Enable"
});
tabGroup.addTab(tab);

// Tab 2
var win2 = Ti.UI.createWindow({
    backgroundColor: "#FFFFFF",
    title: "Disable"
});
var web2 = Ti.UI.createWebView({
    url: "http://blog.imthinker.net/",
    normalScrollSpeed: false,
    removeShadow: false,
    removeScrollDelay: false
});
win2.add(web2);
var tab2 = Ti.UI.createTab({
    window: win2,
    title: "Disable"
});
tabGroup.addTab(tab2);

// Tab 3
var win3 = Ti.UI.createWindow({
    backgroundColor: "#FFFFFF",
    title: "TiCordova"
});
var web3 = Ti.UI.createWebView({
    url: "index.html",
    normalScrollSpeed: true,
    removeShadow: true,
    removeScrollDelay: true
});
web3.addEventListener('fromWebView', function () {
    var dialog = Ti.UI.createAlertDialog({
        message: "This dialog is called from WebView.",
        ok: "ALL RIGHT!",
        title: "Calling Native Event"
    }).show();
});
win3.add(web3);
var tab3 = Ti.UI.createTab({
    window: win3,
    title: "TiCordova"
});
tabGroup.addTab(tab3);

// Tab 4
var win4 = Ti.UI.createWindow({
    backgroundColor: "#FFFFFF",
    title: "UserAgent"
});
var web4 = Ti.UI.createWebView({
    url: "http://imthinker.net/",
    normalScrollSpeed: true,
    removeShadow: true,
    removeScrollDelay: true,
    userAgentForiOS: "TiExtendWeb Demo Application"
});
win4.add(web4);
var tab4 = Ti.UI.createTab({
    window: win4,
    title: "UserAgent"
});
tabGroup.addTab(tab4);

tabGroup.open();