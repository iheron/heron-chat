require! '../src/app'
require! '../src/socket'
port = 4000
server = app.listen port, !->
  console.log "server listening on port #{server.address().port}"
  socket server
