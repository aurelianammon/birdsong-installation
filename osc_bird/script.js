// Note: This line is only required when running in node.js
// var mqtt = require('mqtt');

var client = mqtt.connect('mqtt://bird-devices:bird-password@broker.shiftr.io', {
  clientId: 'javascript'
});

client.on('connect', function(){
  console.log('client has connected!');

  client.subscribe('/example');
  // client.unsubscribe('/example');

  // setInterval(function(){
  //   client.publish('/hello', 'world');
  // }, 1000);
});

client.on('message', function(topic, message) {
  console.log('new message:', topic, message.toString());
});

function do_publish() {
	client.publish('/hello', 'world');
}