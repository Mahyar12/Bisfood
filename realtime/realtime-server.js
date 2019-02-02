var io = require('socket.io').listen(5001),
    redis = require('redis').createClient();

redis.subscribe('new_message');

io.on('connection', function(socket){
  redis.on('message', function(channel, message){
    socket.emit(JSON.parse(message).to, JSON.parse(message));
  });
});
