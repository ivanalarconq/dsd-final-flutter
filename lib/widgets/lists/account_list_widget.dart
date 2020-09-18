import 'package:flutter/material.dart';
import 'package:pago_servicios/state/home_state.dart';
import 'package:pago_servicios/widgets/cards/account_card.dart';
import 'package:provider/provider.dart';

class AccountsListWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final appState = Provider.of<HomeState>(context);
    //appState.getAccounts();

    return Center(
        child: Column(
      children: <Widget>[
        Container(
          margin: EdgeInsets.fromLTRB(0, 5, 0, 5),
          padding: EdgeInsets.fromLTRB(0, 2, 0, 2),
          height: 45,
          child: Center(
            child: Text('Tipo de cambio ref. Compra: 3.515 Venta: 3.550',
                textAlign: TextAlign.center),
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
                : appState.accounts != null
                    ? Expanded(
                        child: Container(
                          child: ListView.builder(
                            itemCount: appState.accounts.length,
                            itemBuilder: (BuildContext context, int position) {
                              return AccountCard(
                                account: appState.accounts[position],
                              );
                            },
                          ),
                        ),
                      )
                    : Text("no hay"))
      ],
    ));
  }
}
