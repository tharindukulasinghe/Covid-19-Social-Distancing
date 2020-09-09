class User {
  String username;
  String address;
  String email;
  String bluetoothId;

  Map<String, dynamic> toJson() {
    return {
      'username': username,
      'address': address,
      'email': email,
      'bluetoothId': bluetoothId
    };
  }
}
