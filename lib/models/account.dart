class Account {
  int id;
  String type;
  String currency;
  double amount;
  int customerId;
  int number;
  Account(this.id, this.type, this.currency, this.amount, this.customerId,
      this.number);

  Account.fromJson(Map<String, dynamic> json)
      : id = int.parse(json['id'].toString()),
        type = json['type'],
        currency = "S/.",
        amount = double.parse(json['balance']),
        customerId = int.parse(json['customerId'].toString()),
        number = int.parse(json['number'].toString());

  Map<String, dynamic> toJson() => {
        'id': id,
        'type': type,
        'number': number,
        'balance': amount,
        'customerId': customerId,
        'isLocked': false,
      };
}
