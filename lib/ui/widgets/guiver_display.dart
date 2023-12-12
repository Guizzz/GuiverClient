import 'package:guiver_client/models/guiver_response.dart';
import 'package:guiver_client/providers/guiver_provider.dart';
import 'package:flutter/material.dart';

class GuiverDisplay extends StatefulWidget {
  final GuiverLib guiverLib;

  const GuiverDisplay({
    required this.guiverLib,
    Key? key,
  }) : super(key: key);

  @override
  State<GuiverDisplay> createState() => _GuiverDisplayState();
}

class _GuiverDisplayState extends State<GuiverDisplay> {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Expanded(
          child: Padding(
            padding: const EdgeInsets.all(12.0),
            child: Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8.0),
                side: const BorderSide(
                  color: Colors.blueAccent,
                  width: 2.0,
                ),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Guiver(
                    cmd: "get_weather",
                    color: Colors.blue,
                    stream: widget.guiverLib.guiverStream("get_weather"),
                  ),
                  Guiver(
                    cmd: "led_status",
                    color: Colors.orange,
                    stream: widget.guiverLib.guiverStream("led_status"),
                  ),
                ],
              ),
            ),
          ),
        )
      ],
    );
  }
}


class Guiver extends StatelessWidget {
  final Stream<GuiverResponse> stream;
  final Color color;
  final String cmd;

  const Guiver({
    required this.stream,
    required this.color,
    required this.cmd,
    Key? key, 
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(12.0),
      child: StreamBuilder<GuiverResponse>(
        stream: stream,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }

          if (snapshot.connectionState == ConnectionState.active 
                && snapshot.hasData)
                // && snapshot.data?.command == cmd) 
          {
            return Center(
              child: Text(
                '${snapshot.data?.payload.toString()}',
                style: TextStyle(
                  color: color,
                  fontSize: 10.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
            );
          }

          if (snapshot.connectionState == ConnectionState.done) {
            return const Center(
              child: Text('No more data'),
            );
          }

          return const Center(
            child: Text('No data'),
          );
        },
      ),
    );
  }
}
