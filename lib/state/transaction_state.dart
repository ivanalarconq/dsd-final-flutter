import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:pago_servicios/models/account.dart';
import 'package:pago_servicios/models/operation.dart';
import 'package:pago_servicios/models/transaction.dart';
import 'package:shared_preferences/shared_preferences.dart';

class TransactionState with ChangeNotifier {
  String _operationUrl = "http://10.0.2.2:3000/operations/";

  static const HTTP_OK = 200;

  TransactionState(Account account) {
    getTransactions(account);
  }

  bool _isFetching = false;

  List<Transaction> transactions;
  bool get isFetching => _isFetching;

  Future<void> getTransactions(Account account) async {
    _isFetching = true;
    notifyListeners();

    //final prefs = await SharedPreferences.getInstance();
    //final userId = prefs.getInt('userId') ?? 0;

    var response = await http.get(_operationUrl + account.id.toString());

    if (response.statusCode == HTTP_OK) {
      if (response.body != null) {
        var transactionsJson = jsonDecode(response.body) as List;
        transactions = transactionsJson
            .map((tagJson) => Transaction.fromJson(tagJson))
            .toList();
      }
      print("transacciones obtenidas satisfactoriamente!");
    } else {
      print("no se guardo nada :( " +
          response.statusCode.toString() +
          response.body);
    }
    _isFetching = false;
    notifyListeners();
  }
}
