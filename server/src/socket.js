// Generated by LiveScript 1.3.1
(function(){
  var socketIo, _session;
  socketIo = require('socket.io');
  _session = {};
  module.exports = function(server){
    var io;
    io = socketIo.listen(server);
    return io.on('connection', function(socket){
      _session[socket.id + ""] = socket;
      socket.on('join', function(data){
        var list, v, ref$, k;
        console.log(data);
        io.sockets.emit('system', data + " join the room.");
        _session[socket.id + ""].nickName = data;
        list = [];
        for (v in ref$ = _session) {
          k = ref$[v];
          list.push({
            id: v,
            nick: k.nickName
          });
        }
        return io.sockets.emit('join', list);
      });
      socket.on('message', function(data){
        var obj, to;
        obj = {};
        obj.from = socket.nickName || socket.id;
        obj.message = data.message;
        to = _session[data.to + ""];
        obj.to = to.nickName || to.id;
        if (!to) {
          return io.sockets.send(obj);
        } else {
          socket.send(obj);
          return to.send(obj);
        }
      });
      return socket.on('disconnect', function(){
        var key$, ref$;
        return ref$ = _session[key$ = socket.id + ""], delete _session[key$], ref$;
      });
    });
  };
}).call(this);
