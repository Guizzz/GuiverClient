import 'package:flutter/material.dart';

/// Coin Buttons
///
/// Either show a button to open sockets for ETH and BTC
/// or shows a button to close the socket connections

class RefreshButtons extends StatelessWidget {
  final String title;
  final Function() onTap;
  final Color backgroundColor;

  const RefreshButtons({
    required this.title,
    required this.onTap,
    required this.backgroundColor,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      onPressed: () => onTap(),
      color: backgroundColor,
      child: Row(
        children: [
          Text(title),
        ],
      ),
    );
  }
}