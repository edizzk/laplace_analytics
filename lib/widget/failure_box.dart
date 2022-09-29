import 'package:flutter/material.dart';

class FailureBox extends StatelessWidget {
  final String? text;

  const FailureBox({super.key, this.text = ""});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        padding: const EdgeInsets.all(20),
        child: Text(
          text!,
          style: const TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}