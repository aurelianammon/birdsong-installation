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

function do_publish(number) {

	switch (number) {
		case 1:
			var audio = new Audio('commong_nightingale_samples-001.wav');
			audio.play();
			break;
		case 2:
			var audio = new Audio('commong_nightingale_samples-002.wav');
			audio.play();
			break;
		case 3:
			var audio = new Audio('commong_nightingale_samples-003.wav');
			audio.play();
			break;
		case 4:
			var audio = new Audio('commong_nightingale_samples-003.wav');
			audio.play();
			break;
	}

	// client.publish('/hello', 'world');
}