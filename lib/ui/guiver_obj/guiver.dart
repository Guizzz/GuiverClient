import 'package:flutter/material.dart';
import 'package:guiver_client/models/guiver_response.dart';

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
          
          if (snapshot.connectionState == ConnectionState.active) // && snapshot.hasData)
          {
            return createObject(snapshot);
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

  Widget createObject(snapshot)
  {
    return const Text("TEST");
  }
}