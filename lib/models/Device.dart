class Device {
  String bluetoothId;

  Device(String bluetoothId) {
    this.bluetoothId = bluetoothId;
  }

  Map<String, dynamic> toJson() {
    return {'bluetoothId': bluetoothId};
  }
}
