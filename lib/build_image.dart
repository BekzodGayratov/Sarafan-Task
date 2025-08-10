import 'package:flutter/material.dart';

class BuildImage extends StatelessWidget {
  final String url;
  const BuildImage({super.key, required this.url});

  @override
  Widget build(BuildContext context) {
    return Image.network(url);
  }
}
