class User {
  String username;
  String address;
  String email;
  String bluetoothId;
  String name;

  User() {}

  Map<String, dynamic> toJson() {
    return {
      'username': username,
      'address': address,
      'email': email,
      'bluetoothId': bluetoothId
    };
  }

  User.fromJson(Map json) : name = json['name'];
}
