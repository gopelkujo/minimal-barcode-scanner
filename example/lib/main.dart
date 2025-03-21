import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:minimal_barcode_scanner/minimal_barcode_scanner.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  String _barcodeResult = 'Unknown';

  @override
  void initState() {
    super.initState();
  }

  /// Listen to the scanned barcode.
  ///
  /// This function will continuously scan the captured barcode. So this allows
  /// you to get multiple barcodes in sequence. Add the callback to `.listen` as
  /// [getBarcodeStreamReceiver] type is `Stream`.
  Future<void> startBarcodeScanStream() async {
    MinimalBarcodeScanner.getBarcodeStreamReceiver(
      '#ff6666',
      'Cancel',
      true,
      ScanMode.BARCODE,
    )?.listen((barcode) => print(barcode));
  }

  /// Scan 2 Dimenional QR-Code. [scanBarcode] scans for QR-Codes marked with
  /// the parameter [scanMode] value being [ScanMode.QR].
  ///
  /// Only one time scan. The scanner will exit and return the value of the
  /// barcode immediately after the scanner captured the first barcode.
  Future<void> scanQR() async {
    String scanned;

    // Platform messages may fail, so we use a try/catch PlatformException.
    try {
      scanned = await MinimalBarcodeScanner.scanBarcode(
        '#ff6666',
        'Cancel',
        true,
        ScanMode.QR,
      );
      print(scanned);
    } on PlatformException {
      scanned = 'Failed to get platform version.';
    }

    // Prevent the widget tree rebuild (setState) when the widget tree is not
    // mounted anymore.
    if (!mounted) return;

    setState(() => _barcodeResult = scanned);
  }

  /// Scan Barcode. [scanBarcode] scans for Barcides marked with
  /// the parameter [scanMode] value being [ScanMode.BARCODE].
  ///
  /// Only one time scan. The scanner will exit and return the value of the
  /// barcode immediately after the scanner captured the first barcode.
  Future<void> scanBarcodeNormal() async {
    String scanned;
    // Platform messages may fail, so we use a try/catch PlatformException.
    try {
      scanned = await MinimalBarcodeScanner.scanBarcode(
        '#ff6666',
        'Cancel',
        true,
        ScanMode.BARCODE,
      );
      print(scanned);
    } on PlatformException {
      scanned = 'Failed to get platform version.';
    }

    // Prevent the widget tree rebuild (setState) when the widget tree is not
    // mounted anymore.
    if (!mounted) return;

    setState(() => _barcodeResult = scanned);
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: const Text('Barcode scan')),
        body: Builder(
          builder: (BuildContext context) {
            return Container(
              alignment: Alignment.center,
              child: Flex(
                direction: Axis.vertical,
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  ElevatedButton(
                    onPressed: () => scanBarcodeNormal(),
                    child: Text('Start barcode scan'),
                  ),
                  ElevatedButton(
                    onPressed: () => scanQR(),
                    child: Text('Start QR scan'),
                  ),
                  ElevatedButton(
                    onPressed: () => startBarcodeScanStream(),
                    child: Text('Start barcode scan stream'),
                  ),
                  Text(
                    'Scan result : $_barcodeResult\n',
                    style: TextStyle(fontSize: 20),
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
