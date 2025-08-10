import 'package:flutter/material.dart';

class BuildText extends StatelessWidget {
  final String text;
  const BuildText({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(color: Colors.lightBlueAccent),

      padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
      child: Center(child: Text(text)),
    );
  }
}
