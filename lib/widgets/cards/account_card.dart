import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:pago_servicios/models/account.dart';
import 'package:pago_servicios/widgets/details/account_detail.dart';

class AccountCard extends StatelessWidget {
  final Account account;

  AccountCard({this.account});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        ListTile(
          contentPadding: EdgeInsets.fromLTRB(20, 10, 20, 10),
          leading: Icon(
            FontAwesomeIcons.piggyBank,
            size: 36,
            color: Colors.green,
          ),
          title: Text(
            this.account.type,
            style: TextStyle(
              color: Colors.grey,
              fontWeight: FontWeight.bold,
            ),
          ),
          subtitle: Text(
            this.account.currency + " " + this.account.amount.toString(),
            style: TextStyle(
              color: Colors.black,
              fontSize: 20,
            ),
          ),
          trailing: IconButton(
            icon: Icon(Icons.keyboard_arrow_right),
            color: Colors.green,
            iconSize: 30.0,
            onPressed: () {
              Navigator.of(context).push(MaterialPageRoute(
                builder: (context) => AccountDetailPage(
                  account: account,
                ),
              ));
            },
          ),
        ),
      ],
    );
  }
}
