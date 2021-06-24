import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart' show kIsWeb;
import 'dart:io' show Platform;

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

// ignore: must_be_immutable
class AdaptativeDataPicker extends StatelessWidget {
  final bool _isIOS = !kIsWeb && Platform.isIOS;

  late final DateTime selectedDate;
  late Function(DateTime) onDateChanged;

  AdaptativeDataPicker({
    required this.selectedDate,
    required this.onDateChanged,
  });

  _showDatePicker(BuildContext context) {
    showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2019),
      lastDate: DateTime.now(),
    ).then(
      (pickedDate) {
        if (pickedDate == null) return;

        onDateChanged(pickedDate);
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    if (_isIOS) {
      return Container(
        height: 180,
        child: CupertinoDatePicker(
          mode: CupertinoDatePickerMode.date,
          initialDateTime: DateTime.now(),
          minimumDate: DateTime(2019),
          maximumDate: DateTime.now(),
          onDateTimeChanged: onDateChanged,
        ),
      );
    } else {
      return Container(
        height: 70,
        child: Row(
          children: <Widget>[
            Expanded(
              child: Text(
                "Data selecionada: ${DateFormat('dd/MM/y').format(selectedDate)}",
              ),
            ),
            TextButton(
              child: Text(
                'Selecione a data',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Theme.of(context).primaryColor,
                ),
              ),
              onPressed: () => _showDatePicker(context),
            ),
          ],
        ),
      );
    }
  }
}
