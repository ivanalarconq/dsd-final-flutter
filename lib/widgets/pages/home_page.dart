import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:pago_servicios/widgets/lists/account_list_widget.dart';
import 'package:pago_servicios/widgets/lists/operations_list_widget.dart';
import 'package:pago_servicios/widgets/lists/products_list_widget.dart';
import 'package:pago_servicios/widgets/modals/EntryDialog.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  Widget content = AccountsListWidget();
  String title = "Te ofrecemos";

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      await showDialog<String>(
        context: context,
        builder: (BuildContext context) => new EntryDialog(),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Text(title),
      ),
      body: content,
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        backgroundColor: Colors.white,
        selectedItemColor: Colors.grey,
        unselectedItemColor: Colors.grey,
        selectedFontSize: 14,
        unselectedFontSize: 14,
        onTap: (value) {
          // Respond to item press.
          setState(() {
            switch (value) {
              case 0:
                content = AccountsListWidget();
                title = "Productos";
                break;

              case 1:
                content = OperationsListWidget();
                title = "Pagos y recargas";
                break;

              case 2:
                content = ProductsListWidget();
                title = "Te ofrecemos";
                break;

              case 3:
                content = ProductsListWidget();
                break;

              case 4:
                content = ProductsListWidget();
                break;
              default:
            }
          });
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
