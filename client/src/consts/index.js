// Generated by LiveScript 1.3.1
(function(){
  var path, koa, mvc, app, ref$;
  path = require('path');
  koa = require('koa');
  mvc = require('heron-mvc');
  app = koa();
  module.exports = {
    CONFIGURE: (ref$ = mvc.configure.load(path.join(__dirname, '../../configure')), ref$.env = mvc.configure.load(path.join(__dirname, '../../configure', app['env'])), ref$),
    WECHAT_TOKEN: "heron_wechat",
    FLASH_TIMEOUT: 10
  };
}).call(this);
