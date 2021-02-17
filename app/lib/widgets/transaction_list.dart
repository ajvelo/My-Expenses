import 'package:app/models/transaction.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class TransactionList extends StatelessWidget {
  final List<Transaction> transactions;
  final Function deleteTransaction;
  TransactionList(this.transactions, this.deleteTransaction);
  @override
  Widget build(BuildContext context) {
    return transactions.isEmpty
        ? LayoutBuilder(builder: (context, constraint) {
            return Column(
              children: [
                Text(
                  'No transactions added yet!',
                  style: Theme.of(context).textTheme.headline6,
                ),
                SizedBox(
                  height: 32,
                ),
                Container(
                    height: constraint.maxHeight * 0.3,
                    child: Image.asset(
                      'assets/images/waiting.png',
                      fit: BoxFit.cover,
                    )),
              ],
            );
          })
        : ListView.builder(
            itemBuilder: (context, index) {
              return Card(
                margin: EdgeInsets.symmetric(vertical: 8, horizontal: 4),
                elevation: 5.0,
                child: ListTile(
                  leading: CircleAvatar(
                    radius: 32.0,
                    child: Padding(
                      padding: EdgeInsets.all(8.0),
                      child: FittedBox(
                          child: Text(
                              '\$${transactions[index].amount.toStringAsFixed(2)}')),
                    ),
                  ),
                  title: Text(transactions[index].title,
                      style: Theme.of(context).textTheme.headline6),
                  subtitle: Text(DateFormat('MMMM dd, yyyy')
                      .format(transactions[index].date)),
                  trailing: MediaQuery.of(context).size.width > 360
                      ? TextButton.icon(
                          onPressed: () =>
                              deleteTransaction(transactions[index].id),
                          icon: Icon(Icons.delete),
                          label: Text('Delete'),
                          style: TextButton.styleFrom(
                              primary: Theme.of(context).errorColor),
                        )
                      : IconButton(
                          icon: Icon(Icons.delete),
                          color: Theme.of(context).errorColor,
                          onPressed: () {
                            deleteTransaction(transactions[index].id);
                          },
                        ),
                ),
              );
            },
            itemCount: transactions.length,
          );
  }
}
