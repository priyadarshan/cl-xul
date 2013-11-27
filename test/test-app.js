Components.utils.import('resource://gre/modules/devtools/dbg-server.jsm');
if (!DebuggerServer.initialized) {
  DebuggerServer.init();
  DebuggerServer.addBrowserActors();
}
DebuggerServer.openListener(6000);

dump('This is a test application!!');

var connection = new WebSocket('ws://localhost/echo', ['soap', 'xmpp']);

// When the connection is open, send some data to the server
connection.onopen = function () {
  connection.send('Ping'); // Send the message 'Ping' to the server
  dump('Opening connection');
};

// Log errors
connection.onerror = function (error) {
  dump('WebSocket Error ' + error.data);
  
};

// Log messages from the server
connection.onmessage = function (e) {
  dump('Server: ' + e.data);
};

connection.onclose = function (e) {
    dump('Close ' + e.code + ':' + e.reason);
};