import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:guiver_client/models/guiver_response.dart';
import 'package:guiver_client/ui/guiver_obj/guiver.dart';
import 'dart:math' as math;

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

    var wind = {}
    ;

    if(snapshot.data != null)
    {
      weather_status = snapshot.data.payload["weather"][0]["main"];
      temperature = snapshot.data.payload["main"]["temp"].toString();
      wind = snapshot.data.payload["wind"];
    }

    return Row(
      children: [
        Expanded(
          child: Card(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8.0),
              side: BorderSide(
                color: color,
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
          ),
        ),
        Expanded(
          child: Card(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8.0),
              side: BorderSide(
                color: color,
                width: 2.0,
              ),
            ),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: [
                  Expanded(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                         Text(
                          'speed: ${wind["speed"] ?? "--"} kmh',
                          style: TextStyle(
                            color: color,
                            fontSize: 12.0,
                            fontWeight: FontWeight.normal,
                          ),
                        ),
                        Text(
                          'gust: ${wind["gust"] ?? "--"} kmh',
                          style: TextStyle(
                            color: color,
                            fontSize: 12.0,
                            fontWeight: FontWeight.normal,
                          ),
                        ),
                        Text(
                          'Wind',
                          style: TextStyle(
                            color: color,
                            fontSize: 10.0,
                            fontWeight: FontWeight.bold,
                          ),
                        ), 
                        
                      ],
                    ),
                  ),
                  Expanded(
                    child: Transform.rotate(
                      angle: -deg2rad(wind["deg"]) + math.pi,
                      child: SvgPicture.asset( 
                                      'assets/compass.svg', 
                                      semanticsLabel: 'My SVG Image',
                                      color: color,
                                      height: 50,
                                      width: 50, 
                                    ),
                    ),
                  )  
                ],
              ),
            ),
          ),
        ),
      
      ],
    );
  }

  double deg2rad(int deg) {
  return deg / 180.0 * math.pi;
}
}
