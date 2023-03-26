import 'package:flutter/material.dart';

class WidgetErrorMessage extends StatelessWidget {
  const WidgetErrorMessage({required this.message});

  final String? message;

  @override
  Widget build(BuildContext context) {
    return Text(message == '' ? '' : 'Upps ? $message');
  }
}
