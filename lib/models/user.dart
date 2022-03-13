class User {
  int? id;
  String? email;
  String? username;
  String? password;
  Map<String, String>? fullName;
  String? phone;
  Map<String, String>? address;

  User.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    email = json['email'];
    username = json['username'];
    password = json['password'];
    phone = json['phone'];
    Map<String, String> name = {
      'firstname': json['name']['firstname'],
      'lastname': json['name']['lastname'],
    };
    fullName = name;
    Map<String, String> address = {
      'city': json['address']['city'],
      'street': json['address']['street'],
      'number': json['address']['number'],
    };
    this.address = address;
  }
}
