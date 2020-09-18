import 'package:flutter/material.dart';
import 'package:pago_servicios/models/company.dart';
import 'package:pago_servicios/widgets/details/base_service_payment_form.dart';

class ServiceCard extends StatelessWidget {
  final Company company;

  ServiceCard({this.company});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Stack(
        children: <Widget>[
          ListTile(
            contentPadding: EdgeInsets.fromLTRB(20, 10, 20, 10),
            title: Text(
              this.company.name,
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
                  builder: (context) => BaseServicePaymentWidget(
                    company: company,
                  ),
                ));
              },
            ),
          ),
        ],
      ),
    );
  }
}
