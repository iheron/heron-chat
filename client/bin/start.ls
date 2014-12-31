require! '../lib/app'
port = process.env.VCAP_APP_PORT || 3000
server = app.listen port, !-> console.log "client listening on port #{server.address().port}"