import 'package:flutter/material.dart';
import 'package:guiver_client/models/guiver_response.dart';
import 'package:guiver_client/ui/guiver_obj/guiver.dart';

class GuiverWeather extends Guiver {
  final Stream<GuiverResponse> stream;
  final Color color;
  final String cmd;

  const GuiverWeather({
    required this.stream,
    required this.color,
    required this.cmd,
    Key? key, 
  }) : super(stream:stream, color:color, cmd:cmd, key: key);

  @override
  Widget createObject(snapshot)
  { 
    var weather_status = "...";
    var temperature = "...";

    if(snapshot.data != null)
    {
      weather_status = snapshot.data.payload["weather"][0]["main"];
      temperature = snapshot.data.payload["main"]["temp"].toString();
    }

    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8.0),
        side: const BorderSide(
          color: Colors.blueAccent,
          width: 2.0,
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
             Text(
              '$temperature°',
              style: TextStyle(
                color: color,
                fontSize: 12.0,
                fontWeight: FontWeight.normal,
              ),
            ),
            Text(
              weather_status,
              style: TextStyle(
                color: color,
                fontSize: 12.0,
                fontWeight: FontWeight.normal,
              ),
            ),
            Text(
              'Weather',
              style: TextStyle(
                color: color,
                fontSize: 10.0,
                fontWeight: FontWeight.bold,
              ),
            ),   
          ],
        ),
      ),
    );
  }
}
