import 'package:flutter/material.dart';
import 'package:yespense/model/transactions.dart';

import 'transaction_item.dart';

class TransactionsList extends StatelessWidget {
  final List<Transaction> transactionList;
  late final void Function(String) onDelete;

  TransactionsList(this.transactionList, this.onDelete);

  @override
  Widget build(BuildContext context) {
    return transactionList.isEmpty
        ? LayoutBuilder(builder: (ctx, constraints) {
            return Column(
              children: <Widget>[
                const SizedBox(height: 20),
                Text(
                  "Nenhuma transação cadastrada",
                  style: Theme.of(context).textTheme.headline6,
                ),
                const SizedBox(height: 20),
                Container(
                  height: constraints.maxHeight * 0.6,
                  child: Image.asset('assets/images/waiting.png',
                      fit: BoxFit.cover),
                )
              ],
            );
          })
        : ListView(
            children: transactionList.map((e) {
              return TransactionItem(
                key: ValueKey(e.id),
                transaction: e,
                onDelete: onDelete,
              );
            }).toList(),
          );
    // ListView.builder(
    //     itemCount: transactionList.length,
    //     itemBuilder: (itens, index) {
    //       final transaction = transactionList[index];

    //       return TransactionItem(
    //         transaction: transaction,
    //         onDelete: onDelete,
    //       );
    //     },
    //   );
  }
}
