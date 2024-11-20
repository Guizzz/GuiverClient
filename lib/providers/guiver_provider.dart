import 'dart:async';
import 'dart:convert';
import 'package:guiver_client/config/config.dart';
import 'package:guiver_client/models/guiver_response.dart';
import 'package:web_socket_channel/web_socket_channel.dart';

class GuiverLib {
  late final WebSocketChannel _guiverWebSocket; 
  var connection_status = false;
  var controllers = Map<StreamController<String>, String>();
  GuiverLib()
  { 
    _guiverWebSocket = WebSocketChannel.connect(Uri.parse("ws://${Config.GUIVER_SERVER_IP}:${Config.GUIVER_SERVER_PORT}"));
    startConnecton();
  }

  void startConnecton()
  {
      _guiverWebSocket.stream.listen(
      (event) {
        Iterable<MapEntry<StreamController<String>, String>> entries = controllers.entries;
        for (final entry in entries) {
          print("GUIVER STREAM: $event");
          print('(${entry.key}, ${entry.value})');
          var jEvent = GuiverResponse.fromJson(jsonDecode(event));
          if (entry.value == jEvent.command) {
            entry.key.add(event);
          }
        }
      },
      onError: (error) {
        print("Error ${error.toString()}");
        connection_status = false;
      },
      onDone: () {
        print("Connectin Lost");
        connection_status = false;
      }
     );
  
  }

  Stream<String> connectionStatusStream()
  {
    StreamController<String> cont = StreamController<String>();
    return cont.stream
            .map<String>((value){
                var resp = "Ciao";
                return resp;
              });
  }

  Stream<GuiverResponse> guiverStream(command)
  {
    StreamController<String> cont = StreamController<String>();
    controllers[cont] = command;
    return cont.stream
            .map<GuiverResponse>((value){
                var resp = GuiverResponse.fromJson(jsonDecode(value));
                return resp;
              });
  } 

  void getWeather()
  {
    print("INTO getWather");
    _guiverWebSocket.sink.add(
      jsonEncode(
            {
                "type": "request", 
                "command": "get_weather",
                "client_id": 123,
            }
      )
    );
  }

  void getLedStatus()
  {
    print("INTO getLedStatus");
    _guiverWebSocket.sink.add(
      jsonEncode(
            {
                "type": "request", 
                "command": "led_status",
                "client_id": 123,
            }
      )
    );
  }

}
