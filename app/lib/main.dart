import 'package:flutter/material.dart';

import 'transaction.dart';
import 'package:intl/intl.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  final List<Transaction> transactions = [
    Transaction(
        id: 't1', title: 'New Shoes', amount: 69.99, date: DateTime.now()),
    Transaction(
        id: 't2',
        title: 'Weekly Groceries',
        amount: 18.53,
        date: DateTime.now()),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('My Flutter App'),
      ),
      body: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Container(
              width: double.infinity,
              child: Card(
                color: Colors.blue,
                child: Text('Chart!'),
                elevation: 5.0,
              ),
            ),
            Card(
              elevation: 5.0,
              child: Container(
                padding: EdgeInsets.all(8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: <Widget>[
                    TextField(
                      decoration: InputDecoration(labelText: "Title"),
                    ),
                    TextField(
                      decoration: InputDecoration(labelText: "Amount"),
                    ),
                    TextButton(
                      onPressed: () {
                        print("Done!");
                      },
                      child: Text('Add Transaction'),
                      style: TextButton.styleFrom(primary: Colors.purple),
                    )
                  ],
                ),
              ),
            ),
            Column(
              children: transactions.map((tx) {
                return Card(
                  child: Row(
                    children: <Widget>[
                      Container(
                        margin: EdgeInsets.symmetric(
                            vertical: 8.0, horizontal: 16.0),
                        decoration: BoxDecoration(
                            border:
                                Border.all(color: Colors.purple, width: 2.0)),
                        padding: EdgeInsets.all(8.0),
                        child: Text(
                          "\$${tx.amount.toString()}",
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 24.0,
                              color: Colors.purple),
                        ),
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            tx.title,
                            style: TextStyle(
                                fontSize: 16, fontWeight: FontWeight.bold),
                          ),
                          Text(
                            DateFormat('MMMM dd, yyyy').format(tx.date),
                            style: TextStyle(color: Colors.grey),
                          ),
                        ],
                      )
                    ],
                  ),
                );
              }).toList(),
            )
          ]),
    );
  }
}
