import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_blue/flutter_blue.dart';

class BluetoothPage extends StatefulWidget {
  @override
  _BluetoothPageState createState() => _BluetoothPageState();
}

class _BluetoothPageState extends State<BluetoothPage> {
  FlutterBlue flutterBlue = FlutterBlue.instance;

  bool isScanning = false;
  StreamSubscription? scanSubscription;

  List<ScanResult> scanResults = [];

  @override
  void dispose() {
    scanSubscription?.cancel();
    super.dispose();
  }

  void startScan() {
    setState(() {
      isScanning = true;
      scanResults.clear();
    });

    scanSubscription = flutterBlue.scan(
      timeout: Duration(seconds: 5),
    ).listen((scanResult) {
      setState(() {
        scanResults.add(scanResult);
      });
    }, onError: (error) {
      print('Scan error: $error');
    }, onDone: () {
      setState(() {
        isScanning = false;
      });
    });
  }

  void stopScan() {
    scanSubscription?.cancel();
    setState(() {
      isScanning = false;
    });
  }

  void connectToDevice(BluetoothDevice device) {
    // Connect to the selected device
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Bluetooth Connectivity'),
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: scanResults.length,
              itemBuilder: (BuildContext context, int index) {
                final ScanResult result = scanResults[index];
                return ListTile(
                  title: Text(result.device.name ?? 'Unknown Device'),
                  subtitle: Text(result.device.id.toString()),
                  trailing: ElevatedButton(
                    onPressed: () {
                      connectToDevice(result.device);
                    },
                    child: Text('Connect'),
                  ),
                );
              },
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              IconButton(
                onPressed: isScanning ? null : startScan,
                iconSize: 100,
                icon: Icon(Icons.bluetooth_searching),
              ),
              SizedBox(width: 32),
              IconButton(
                onPressed: stopScan,
                iconSize: 100,
                icon: Icon(Icons.bluetooth_connected),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
