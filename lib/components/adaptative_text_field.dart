import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart' show kIsWeb;
import 'dart:io' show Platform;

import 'package:flutter/material.dart';

class AdaptativeTextField extends StatelessWidget {
  final bool _isIOS = !kIsWeb && Platform.isIOS;

  late final String label;
  late final TextEditingController controller;
  late final TextInputType? keyboardingType;
  late final Function(String) onSubmitted;

  AdaptativeTextField({
    required this.controller,
    required this.onSubmitted,
    required this.label,
    this.keyboardingType,
  });

  @override
  Widget build(BuildContext context) {
    if (_isIOS) {
      return Padding(
        padding: const EdgeInsets.only(bottom: 10),
        child: CupertinoTextField(
          controller: controller,
          keyboardType: keyboardingType,
          onSubmitted: onSubmitted,
          placeholder: label,
          padding: EdgeInsets.symmetric(
            horizontal: 6,
            vertical: 12,
          ),
        ),
      );
    } else {
      return TextField(
        controller: controller,
        keyboardType: keyboardingType,
        onSubmitted: onSubmitted,
        decoration: InputDecoration(
          labelText: label,
        ),
      );
    }
  }
}
