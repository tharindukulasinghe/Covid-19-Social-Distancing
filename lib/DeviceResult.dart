import 'package:flutter_blue/flutter_blue.dart';

class DeviceResult {
  int rssi;
  BluetoothDevice device;
  double distance;

  DeviceResult(int rssi, BluetoothDevice device, double distance) {
    this.rssi = rssi;
    this.device = device;
    this.distance = distance;
  }
}
