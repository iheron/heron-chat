require! {
  'socket.io': socket-io
}

_session = {}

module.exports = (server) ->
  io = socket-io.listen server
  io.on 'connection', (socket) ->
    # 添加到session
    _session."#{socket.id}" = socket

    socket.on 'join', (data) ->
      io.sockets.emit 'system', "#{data} join the room."
      _session."#{socket.id}".nickName = data
      list = []
      for v, k of _session
        list.push {id:v, nick:k.nickName}
      io.sockets.emit 'join', list





    socket.on 'message', (data) ->
      obj = {}
      obj.from = socket.nickName || socket.id
      obj.message = data.message

      to = _session."#{data.to}"

      if !to
        obj.to = ''
        io.sockets.send obj
      else
        obj.to = to.nickName || to.id
        socket.send obj
        to.send obj

    socket.on 'disconnect', ->
      delete _session."#{socket.id}"