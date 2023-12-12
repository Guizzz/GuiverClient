import 'package:guiver_client/providers/guiver_provider.dart';
import 'package:guiver_client/ui/screens/home_page.dart';
import 'package:flutter/material.dart';

class GuiverProApp extends StatelessWidget {
  late final GuiverLib _provider;

  GuiverProApp({Key? key})
      : _provider = GuiverLib(),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: HomePage(provider: _provider),
    );
  }
}
