import 'package:flutter/material.dart';
import 'package:pago_servicios/models/operation.dart';

class OperationCard extends StatelessWidget {
  final Operation operation;

  OperationCard({this.operation});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Stack(
        children: <Widget>[
          ListTile(
            contentPadding: EdgeInsets.fromLTRB(20, 10, 20, 10),
            leading: Icon(
              this.operation.icon,
              size: 36,
              color: Colors.green,
            ),
            title: Text(
              this.operation.name,
              style: TextStyle(
                color: Colors.grey,
                fontWeight: FontWeight.bold,
              ),
            ),
            trailing: IconButton(
              icon: Icon(Icons.keyboard_arrow_right),
              color: Colors.green,
              iconSize: 30.0,
              onPressed: () {
                Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => this.operation.widget,
                ));
              },
            ),
          ),
        ],
      ),
    );
  }
}
