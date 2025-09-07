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
    var rainbow_status = {};
    var led={};
    if(snapshot.data != null)
    {
      rainbow_status = snapshot.data.payload["rainbow_status"];
      led = snapshot.data.payload;
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
              child: Row(
                children: [
                  Expanded(
                    child: Column(
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
                            Container(
                              width: 10,
                              height: 10,
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: rainbow_status["rainbowRunning"] == true ?Colors.green:Colors.red,
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
                        Row(
                          children: [
                            Text(
                              'Rainbow brightnes:',
                              style: TextStyle(
                                color: color,
                                fontSize: 10.0,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Text(
                              '${snapshot.data?.payload["rainbow_status"]["brightnes"]}',
                              style: TextStyle(
                                color: color,
                                fontSize: 12.0,
                                fontWeight: FontWeight.normal,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  Expanded(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [ 
                        Row(
                          children: [
                            Text(
                              'redValue:',
                              style: TextStyle(
                                color: color,
                                fontSize: 10.0,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Text(
                              '${led["redValue"]}',
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
                                'greenValue:',
                                style: TextStyle(
                                  color: color,
                                  fontSize: 10.0,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              Text(
                                '${led["greenValue"]}',
                                style: TextStyle(
                                  color: color,
                                  fontSize: 12.0,
                                  fontWeight: FontWeight.normal,
                                ),
                              ),
                            ],
                          ),Row(
                          children: [
                            Text(
                              'blueValue:',
                              style: TextStyle(
                                color: color,
                                fontSize: 10.0,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Text(
                              '${led["blueValue"]}',
                              style: TextStyle(
                                color: color,
                                fontSize: 12.0,
                                fontWeight: FontWeight.normal,
                              ),
                            ),
                          ],
                        ),],
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
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Row(
                    children: [
                      Text(
                        'Relay status:',
                        style: TextStyle(
                          color: color,
                          fontSize: 10.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        '${led["redValue"]}',
                        style: TextStyle(
                          color: color,
                          fontSize: 12.0,
                          fontWeight: FontWeight.normal,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
         ],
    );
  }
}
