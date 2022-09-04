import 'package:flutter/material.dart';

class SizedBoxW extends StatelessWidget {
  const SizedBoxW({super.key, required this.heightSized});
  final double heightSized;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: heightSized,);
  }
}