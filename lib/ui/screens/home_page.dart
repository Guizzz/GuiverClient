import 'package:guiver_client/providers/guiver_provider.dart';
import 'package:guiver_client/ui/widgets/refresh_buttons.dart';
import 'package:guiver_client/ui/widgets/guiver_display.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key, required this.provider}) : super(key: key);

  final GuiverLib provider;

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white.withOpacity(
        0.9,
      ),
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Expanded(
                child: GuiverDisplay(
                  guiverLib: widget.provider,
                ),
                flex: 4,
              ),
              Expanded(
                flex: 1,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: RefreshButtons(
                    title: "Get Weather",
                    backgroundColor: Colors.blue,
                    onTap: widget.provider.getWeather,
                  ),
                ),
              ),
              Expanded(
                flex: 1,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: RefreshButtons(
                    title: "Get Led status",
                    backgroundColor: Colors.purple,
                    onTap: widget.provider.getLedStatus,
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
