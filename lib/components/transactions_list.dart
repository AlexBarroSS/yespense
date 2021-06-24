import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:yespense/model/transactions.dart';

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
                SizedBox(height: 20),
                Text(
                  "Nenhuma transação cadastrada",
                  style: Theme.of(context).textTheme.headline6,
                ),
                SizedBox(height: 20),
                Container(
                  height: constraints.maxHeight * 0.6,
                  child: Image.asset('assets/images/waiting.png',
                      fit: BoxFit.cover),
                )
              ],
            );
          })
        : ListView.builder(
            itemCount: transactionList.length,
            itemBuilder: (itens, index) {
              final transaction = transactionList[index];

              return Card(
                elevation: 5,
                margin: EdgeInsets.symmetric(
                  vertical: 8,
                  horizontal: 5,
                ),
                child: ListTile(
                  leading: CircleAvatar(
                    radius: 30,
                    child: Padding(
                      padding: const EdgeInsets.all(6),
                      child: FittedBox(
                        child: Text("R\$ ${transaction.value}"),
                      ),
                    ),
                  ),
                  title: Text(
                    transaction.title,
                    style: Theme.of(context).textTheme.headline6,
                  ),
                  subtitle: Text(
                    DateFormat('d MMM y').format(transaction.date),
                  ),
                  trailing: MediaQuery.of(context).size.width > 480
                      ? TextButton.icon(
                          onPressed: () => onDelete(transaction.id),
                          icon: Icon(
                            Icons.delete,
                            color: Theme.of(context).errorColor,
                          ),
                          label: Text(
                            "Excluir",
                            style: TextStyle(
                              color: Theme.of(context).errorColor,
                            ),
                          ),
                        )
                      : IconButton(
                          onPressed: () => onDelete(transaction.id),
                          icon: Icon(Icons.delete),
                          color: Theme.of(context).errorColor,
                        ),
                ),
              );
            },
          );
  }
}
