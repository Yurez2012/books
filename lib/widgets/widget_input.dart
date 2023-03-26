import 'package:flutter/material.dart';

class WidgetInput extends StatelessWidget {
  const WidgetInput({required this.title, required TextEditingController this.controller});

  final String title;
  final TextEditingController controller;

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      decoration: InputDecoration(
          labelText: title
      ),
    );
  }
}
