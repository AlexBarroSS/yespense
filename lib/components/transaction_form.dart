import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:yespense/components/adaptative_button.dart';
import 'package:yespense/components/adaptative_data_picker.dart';
import 'package:yespense/components/adaptative_text_field.dart';

class TransactionForm extends StatefulWidget {
  late final void Function(String, double, DateTime) onSubmit;

  TransactionForm(this.onSubmit);

  @override
  _TransactionFormState createState() => _TransactionFormState();
}

class _TransactionFormState extends State<TransactionForm> {
  final _titleController = TextEditingController();
  final _valueController = TextEditingController();
  late DateTime _selectedDate = DateTime.now();

  void submitForm() {
    final title = _titleController.text;
    final value = double.tryParse(_valueController.text) ?? 0;

    if (title.isEmpty || title.length == 0 || value <= 0) {
      return;
    }

    widget.onSubmit(title, value, _selectedDate);
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Card(
        elevation: 5,
        child: Padding(
          padding: EdgeInsets.only(
            top: 10,
            left: 10,
            right: 10,
            bottom: 10 + MediaQuery.of(context).viewInsets.bottom,
          ),
          child: Column(
            children: <Widget>[
              AdaptativeTextField(
                controller: _titleController,
                label: 'Título',
                onSubmitted: (_) => submitForm(),
              ),
              AdaptativeTextField(
                controller: _valueController,
                keyboardingType: TextInputType.numberWithOptions(decimal: true),
                onSubmitted: (_) => submitForm(),
                label: 'Valor (R\$)',
              ),
              AdaptativeDataPicker(
                selectedDate: _selectedDate,
                onDateChanged: (pickedDate) {
                  setState(() {
                    _selectedDate = pickedDate;
                  });
                },
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: <Widget>[
                  AdaptativeButton(
                    label: "Nova transação",
                    onPressed: submitForm,
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
