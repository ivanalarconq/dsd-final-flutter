class Customer {
  int id;
  String firstName;
  String lastName;
  Customer(this.id, this.firstName, this.lastName);

  Customer.fromJson(Map<String, dynamic> json)
      : id = int.parse(json['id'].toString()),
        firstName = json['firstName'],
        lastName = json['lastName'];

  Map<String, dynamic> toJson() => {
        'id': id,
        'firstName': firstName,
        'lastName': lastName,
      };
}
