emojiPath = (nconf.get('proxy_port') ? nconf.get('base_url') + ":" + nconf.get('proxy_port') : nconf.get('url') ) + '/plugins/nodebb-plugin-emoji-extended/images'

defaultConfig =
  maxCount: 8
  minChars: 0
  killSkype: 1
  completePrefix: "^|[^\\w\\d)\\]}+\\-]"
  zoom: 64

getConfig = (key) ->
  meta.config["emoji:extended:#{key}"] || defaultConfig[key]

getConfigInt = (key) ->
  parseInt getConfig key

resetConfigIfEmpty = (key) ->
  meta.configs.persistOnEmpty "emoji:extended:#{key}", defaultConfig[key], (->)

module.exports.configDefaults = (id) ->
  if id == 'nodebb-plugin-emoji-extended'
    resetConfigIfEmpty key for key of defaultConfig

appGet = (app, url, mw, cb) ->
  app.get url, mw, cb
  app.get "/api#{url}", cb
