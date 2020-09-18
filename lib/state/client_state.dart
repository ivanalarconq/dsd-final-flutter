import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:pago_servicios/models/customer.dart';
import 'package:pago_servicios/models/login.dart';
import 'package:pago_servicios/widgets/pages/accounts_page.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ClientState with ChangeNotifier {
  String _clientUrl = "http://10.0.2.2:3000/clients/";
  String _loginUrl = "http://10.0.2.2:3000/login/";

  static const HTTP_OK = 200;

  ClientState();

  bool _isFetching = false;
  Customer customer;

  bool get isFetching => _isFetching;

  Future<void> login(Login login, BuildContext context) async {
    _isFetching = true;
    notifyListeners();

    print(login.cardNumber.toString() +
        " " +
        login.dni.toString() +
        "  " +
        login.pwd);
    var response = await http.post(_loginUrl, body: {
      'cardNumber': login.cardNumber.toString(),
      'dni': login.dni.toString(),
      'password': login.pwd,
    });

    //print("response " + response.statusCode.toString());
    //print("response " + response.body);

    if (response.statusCode == 201) {
      //Map customerJson = jsonDecode(response.body);
      if (response.body != null) {
        Map<String, dynamic> user = jsonDecode(response.body);
        customer = Customer.fromJson(user);

        final prefs = await SharedPreferences.getInstance();
        prefs.setInt('userId', customer.id);
        //print("map " + user.toString());
      }

      print("LOGEADO CON EXITO!");
      Navigator.of(context).push(MaterialPageRoute(
        builder: (context) => AccountsPage(),
      ));

      //customer = Customer.fromJson(customerJson);

    } else {
      print("no se guardo nada :( " +
          response.statusCode.toString() +
          response.body);
    }
    _isFetching = false;
    notifyListeners();
  }
}
