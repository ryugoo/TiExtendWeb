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
    removeShadow: true
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
    removeShadow: false
});
win2.add(web2);
var tab2 = Ti.UI.createTab({
    window: win2,
    title: "Disable"
});
tabGroup.addTab(tab2);

tabGroup.open();