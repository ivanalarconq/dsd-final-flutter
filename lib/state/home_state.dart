import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:pago_servicios/models/account.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HomeState with ChangeNotifier {
  String _accountsUrl = "http://10.0.2.2:3000/accounts/";

  static const HTTP_OK = 200;

  HomeState() {
    getAccounts();
  }

  bool _isFetching = false;
  Account account;
  List<Account> accounts;
  bool get isFetching => _isFetching;

  Future<void> getAccounts() async {
    _isFetching = true;
    notifyListeners();

    final prefs = await SharedPreferences.getInstance();
    final userId = prefs.getInt('userId') ?? 0;

    var response = await http.get(_accountsUrl + userId.toString());

    if (response.statusCode == HTTP_OK) {
      if (response.body != null) {
        var accountsJson = jsonDecode(response.body) as List;
        accounts =
            accountsJson.map((tagJson) => Account.fromJson(tagJson)).toList();
      }
      print("LOGEADO CON EXITO!");
    } else {
      print("no se guardo nada :( " +
          response.statusCode.toString() +
          response.body);
    }
    _isFetching = false;
    notifyListeners();
  }
}
