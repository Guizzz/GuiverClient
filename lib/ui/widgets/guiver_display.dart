import 'package:guiver_client/providers/guiver_provider.dart';
import 'package:flutter/material.dart';
import 'package:guiver_client/ui/guiver_obj/guiver_led.dart';
import 'package:guiver_client/ui/guiver_obj/guiver_weather.dart';

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
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                GuiverWeather(
                  cmd: "get_weather",
                  color: Colors.blue,
                  stream: widget.guiverLib.guiverStream("get_weather"),
                ),
                GuiverLed(
                  cmd: "led_status",
                  color: Colors.orange,
                  stream: widget.guiverLib.guiverStream("led_status"),
                ),
              ],
            ),
          ),
        )
      ],
    );
  }
}
