var io = require('socket.io').listen(5001),
    redis = require('redis').createClient();

redis.subscribe('new_message');

io.on('connection', function(socket){
  redis.on('message', function(channel, message){
  	new_message = JSON.parse(message);
    // console.log(new_message);
  	if(new_message.resource == "messages")
    	socket.emit(new_message.to, new_message);
    else if(new_message.resource == "friends"){
    	if(new_message.action == "create"){
    		socket.emit(new_message.suser, new_message);
    	}
    	else if(new_message.action == "update"){
        if(new_message.status != 1)
			    socket.emit(new_message.user, new_message);
        else
          socket.emit(new_message.suser, new_message);
    	}
    }
    else if(new_message.resource == "games"){
      socket.emit(new_message.to, new_message);
    }
  });
});
