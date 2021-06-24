import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart' show kIsWeb;
import 'dart:io' show Platform;

import 'package:flutter/material.dart';

class AdaptativeButton extends StatelessWidget {
  final bool _isIOS = !kIsWeb && Platform.isIOS;

  late final String label;
  late final Function onPressed;

  AdaptativeButton({
    required this.label,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    if (_isIOS) {
      return CupertinoButton(
        onPressed: () => onPressed(),
        color: Theme.of(context).primaryColor,
        child: Text(label),
        padding: EdgeInsets.symmetric(
          horizontal: 20,
        ),
      );
    } else {
      return ElevatedButton(
        onPressed: () => onPressed(),
        child: Text(
          label,
          style: TextStyle(
            color: Theme.of(context).primaryColorLight,
          ),
        ),
      );
    }
  }
}
