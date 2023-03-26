import 'package:flutter/material.dart';

class WidgetTitle extends StatelessWidget {
  const WidgetTitle({required this.title});

  final String title;

  @override
  Widget build(BuildContext context) {
    return Text(title);
  }
}
