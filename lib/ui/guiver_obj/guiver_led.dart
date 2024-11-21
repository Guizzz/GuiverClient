import 'package:flutter/material.dart';
import 'package:guiver_client/models/guiver_response.dart';
import 'package:guiver_client/ui/guiver_obj/guiver.dart';

class GuiverLed extends Guiver {
  final Stream<GuiverResponse> stream;
  final Color color;
  final String cmd;

  const GuiverLed({
    required this.stream,
    required this.color,
    required this.cmd,
    Key? key, 
  }) : super(stream:stream, color:color, cmd:cmd, key: key);

  @override
  Widget createObject(snapshot)
  {
    print(snapshot.data?.payload);
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Row(
          children: [
            Text(
              'Rainbow Status:',
              style: TextStyle(
                color: color,
                fontSize: 10.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              '${snapshot.data?.payload["rainbow_status"]["rainbowRunning"]}',
              style: TextStyle(
                color: color,
                fontSize: 12.0,
                fontWeight: FontWeight.normal,
              ),
            ),
          ],
        ),
        Row(
          children: [
            Text(
              'Rainbow Frequency:',
              style: TextStyle(
                color: color,
                fontSize: 10.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              '${snapshot.data?.payload["rainbow_status"]["time"]}',
              style: TextStyle(
                color: color,
                fontSize: 12.0,
                fontWeight: FontWeight.normal,
              ),
            ),
          ],
        ),
      ],
    );
  }
}
