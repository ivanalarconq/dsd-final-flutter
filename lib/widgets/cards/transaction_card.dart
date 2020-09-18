import 'package:flutter/material.dart';
import 'package:pago_servicios/models/transaction.dart';

class TransactionCard extends StatelessWidget {
  final Transaction transaction;

  TransactionCard({this.transaction});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Stack(
        children: <Widget>[
          ListTile(
              contentPadding: EdgeInsets.fromLTRB(20, 10, 20, 10),
              title: Text(
                this.transaction.description,
                style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                ),
              ),
              subtitle: Text(
                this.transaction.date,
                style: TextStyle(
                  color: Colors.grey,
                ),
              ),
              trailing: Row(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  Text(
                    this.transaction.currency +
                        " " +
                        this.transaction.amount.toString(),
                    style: TextStyle(
                        color: this.transaction.isIncome
                            ? Colors.green
                            : Colors.red),
                  ),
                  Icon(Icons.keyboard_arrow_right,
                      color: Colors.grey, size: 30.0),
                ],
              )),
        ],
      ),
    );
  }
}
