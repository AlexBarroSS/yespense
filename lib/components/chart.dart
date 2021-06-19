import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:yespense/components/chart_bar.dart';
import 'package:yespense/model/transactions.dart';

class Chart extends StatelessWidget {
  late final List<Transaction> recentTransactions;

  Chart(this.recentTransactions);

  List<Map<String, Object>> get groupedTransactions {
    return List.generate(7, (index) {
      final weekly = DateTime.now().subtract(
        Duration(days: index),
      );

      double totalSoma = 0.0;

      for (var i = 0; i < recentTransactions.length; i++) {
        bool sameDay = recentTransactions[i].date.day == weekly.day;
        bool sameMonth = recentTransactions[i].date.month == weekly.month;
        bool sameYear = recentTransactions[i].date.year == weekly.year;

        if (sameDay && sameMonth && sameYear) {
          totalSoma += recentTransactions[i].value;
        }
      }

      return {
        'day': DateFormat.E().format(weekly)[0],
        'value': 9.95,
      };
    });
  }

  @override
  Widget build(BuildContext context) {
    groupedTransactions;
    return Card(
      elevation: 6,
      margin: EdgeInsets.all(20),
      child: Row(
        children: groupedTransactions
            .map(
              (tr) => ChartBar(
                label: (tr['day'] as String),
                value: (tr['value'] as double),
                percentage: 0,
              ),
            )
            .toList(),
      ),
    );
  }
}
