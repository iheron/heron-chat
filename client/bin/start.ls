require! '../lib/app'
port = 3000
server = app.listen port, !-> console.log "api server listening on port #{server.address().port}"