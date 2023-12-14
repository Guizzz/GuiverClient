import 'dart:async';
import 'dart:convert';
import 'package:guiver_client/models/guiver_response.dart';
import 'package:web_socket_channel/web_socket_channel.dart';
import 'package:web_socket_channel/status.dart' as status;

class GuiverLib {
  late final WebSocketChannel _guiverWebSocket; 
  var controllers = Map<StreamController<String>, String>(); // <StreamController<String>, <String>();

  GuiverLib()
  { 
    _guiverWebSocket = WebSocketChannel.connect(Uri.parse("ws://localhost:7777"));
    
    _guiverWebSocket.stream.listen(
      (event) {
        Iterable<MapEntry<StreamController<String>, String>> entries = controllers.entries;
        for (final entry in entries) {
          print("GUIVER STREAM: " + event);
          print('(${entry.key}, ${entry.value})');
          var jEvent = GuiverResponse.fromJson(jsonDecode(event));
          if (entry.value == jEvent.command) {
            entry.key.add(event);
          }
        }
      },
      onError: (error) {
        print("Error " + error.toString());
      },
      onDone: () {
        print("Connectin Lost");
      }
     );

     
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
