require! '../src/app'
port = 3000
server = app.listen port, !-> console.log "client listening on port #{server.address().port}"