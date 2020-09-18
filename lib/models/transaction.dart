class Transaction {
  int id;
  String description;
  String currency;
  double amount;
  String date;
  bool isIncome;
  int accountId;

  Transaction(this.id, this.accountId, this.description, this.currency,
      this.amount, this.date, this.isIncome);

  Transaction.fromJson(Map<String, dynamic> json)
      : id = int.parse(json['id'].toString()),
        description = json['description'],
        currency = "S/.",
        amount = double.parse(json['amount'].toString()),
        date = json['madeAt'],
        isIncome = json['isIncome'],
        accountId = int.parse(json['accountId'].toString());

  /*Map<String, dynamic> toJson() => {
        'id': id,
        'firstName': firstName,
        'lastName': lastName,
      };*/
}
