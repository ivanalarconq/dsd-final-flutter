import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:pago_servicios/state/home_state.dart';
import 'package:pago_servicios/widgets/lists/account_list_widget.dart';
import 'package:pago_servicios/widgets/pages/products_page.dart';
import 'package:provider/provider.dart';

import 'finance_page.dart';
import 'operations_page.dart';

class AccountsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Text("Productos"),
      ),
      body: ChangeNotifierProvider<HomeState>(
        create: (_) => HomeState(),
        child: AccountsListWidget(),
      ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        backgroundColor: Colors.white,
        selectedItemColor: Colors.grey,
        unselectedItemColor: Colors.grey,
        selectedFontSize: 14,
        unselectedFontSize: 14,
        onTap: (value) {
          // Respond to item press.
          switch (value) {
            case 0:
              break;

            case 1:
              Navigator.of(context).push(MaterialPageRoute(
                builder: (context) => ProductsPage(),
              ));
              break;

            case 2:
              Navigator.of(context).push(MaterialPageRoute(
                builder: (context) => OperationsPage(),
              ));
              break;

            case 3:
              Navigator.of(context).push(MaterialPageRoute(
                builder: (context) => FinancePage(),
              ));
              break;

            case 4:
              Navigator.of(context).push(MaterialPageRoute(
                builder: (context) => AccountsPage(),
              ));
              break;
            default:
          }
        },
        items: [
          BottomNavigationBarItem(
            title: Text('Productos'),
            icon: Icon(FontAwesomeIcons.creditCard),
          ),
          BottomNavigationBarItem(
            title: Text('Operaciones'),
            icon: Icon(FontAwesomeIcons.peopleArrows),
          ),
          BottomNavigationBarItem(
            title: Text('Servicios'),
            icon: Icon(FontAwesomeIcons.handHoldingUsd),
          ),
          BottomNavigationBarItem(
            title: Text('Mis finanzas'),
            icon: Icon(FontAwesomeIcons.piggyBank),
          ),
          BottomNavigationBarItem(
            title: Text('Más'),
            icon: Icon(FontAwesomeIcons.angleDoubleRight),
          ),
        ],
      ),
    );
  }
}
