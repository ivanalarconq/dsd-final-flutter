import 'package:flutter/material.dart';
import 'package:pago_servicios/models/account.dart';
import 'package:pago_servicios/state/transaction_state.dart';
import 'package:pago_servicios/widgets/cards/transaction_card.dart';
import 'package:provider/provider.dart';

class AccountDetailPage extends StatelessWidget {
  final Account account;

  const AccountDetailPage({Key key, this.account}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<TransactionState>(
      create: (_) => TransactionState(account),
      child: AccountDetailWidget(
        account: account,
      ),
    );
  }
}

class AccountDetailWidget extends StatelessWidget {
  final Account account;
  AccountDetailWidget({Key key, this.account}) : super(key: key);

  //List<Transaction> transactions;
  //int count = 0;

  @override
  Widget build(BuildContext context) {
    final appState = Provider.of<TransactionState>(context);

    /*if (transactions == null) {
      transactions = List<Transaction>();
      getData();
    }*/
    //return productsListItems();
    return Scaffold(
      appBar: AppBar(
        title: Text("Detalle de la cuenta"),
      ),
      body: Center(
          child: Column(
        children: <Widget>[
          Container(
            margin: EdgeInsets.fromLTRB(0, 5, 0, 5),
            padding: EdgeInsets.fromLTRB(0, 2, 0, 2),
            height: 45,
            child: Center(
              child: Text(
                this.account.type,
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 18,
                ),
              ),
            ),
          ),
          Container(
            margin: EdgeInsets.fromLTRB(0, 5, 0, 5),
            padding: EdgeInsets.fromLTRB(0, 2, 0, 2),
            height: 60,
            child: Center(
              child: Text(
                this.account.currency + " " + this.account.amount.toString(),
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 40, color: Colors.green),
              ),
            ),
          ),
          Container(
            margin: EdgeInsets.fromLTRB(0, 5, 0, 5),
            padding: EdgeInsets.fromLTRB(0, 2, 0, 2),
            height: 45,
            child: Center(
              child: Text('Mis movimientos', textAlign: TextAlign.center),
            ),
            decoration: BoxDecoration(
              border: Border(
                bottom: BorderSide(color: Colors.green, width: 2),
              ),
            ),
          ),
          Container(
              child: appState.isFetching
                  ? CircularProgressIndicator()
                  : appState.transactions != null
                      ? Expanded(
                          child: Container(
                            child: ListView.builder(
                              itemCount: appState.transactions.length,
                              itemBuilder:
                                  (BuildContext context, int position) {
                                return TransactionCard(
                                  transaction: appState.transactions[position],
                                );
                              },
                            ),
                          ),
                        )
                      : Text("no hay"))

          /*Expanded(
            child: Container(
              child: transactionsListItems(),
            ),
          )*/
        ],
      )),
    );
  }

  /*void getData() {
    transactions.add(Transaction(
        1, 1, "Pago de sueldo", "S/.", 7000, "Lun 31 ago 04:04 am", true));
    transactions.add(Transaction(
        2, 1, "Netflix", "S/.", 7000, "Lun 31 ago 04:04 am", false));
    transactions.add(
        Transaction(3, 1, "Mojang", "S/.", 100, "Lun 31 ago 04:04 am", false));
    transactions.add(Transaction(4, 1, "Cevicheria El Marisco", "S/.", 100,
        "Lun 31 ago 04:04 am", false));
    transactions.add(Transaction(
        5, 1, "Polleria Juanito", "S/.", 100, "Lun 31 ago 04:04 am", false));
    transactions.add(Transaction(
        6, 1, "Sueldo UTP", "S/.", 5000, "Lun 31 ago 04:04 am", true));
    transactions.add(
        Transaction(7, 1, "Mojang", "S/.", 100, "Lun 31 ago 04:04 am", false));

    count = transactions.length;
  }*/

  /*ListView transactionsListItems() {
    return ListView.builder(
      itemCount: count,
      itemBuilder: (BuildContext context, int position) {
        return TransactionCard(
          transaction: this.transactions[position],
        );
      },
    );
  }*/
}
