
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';
import 'package:flutter_web_test_project/extensions/string_extension.dart';
import 'package:flutter_web_test_project/kadai4/product_detail_page.dart';

class BarcodeScanPage extends StatefulWidget {
  const BarcodeScanPage({super.key});

  @override
  State<BarcodeScanPage> createState() => _BarcodeScanPageState();
}

class _BarcodeScanPageState extends State<BarcodeScanPage> {
  String _scanBarcode = 'Unknown';

  @override
  void initState() {
    super.initState();
  }

  Future<void> _scanBarcodeNormal() async {
    String barcodeScanRes;
    try {
      barcodeScanRes = await FlutterBarcodeScanner.scanBarcode(
          '#ff6666', 'Cancel', true, ScanMode.BARCODE,);
      debugPrint(barcodeScanRes);
      await _skipToProductDetail(barcodeScanRes);
    } on PlatformException {
      barcodeScanRes = 'Failed to get platform version.';
    }

    if (!mounted) {
      return;
    }

    setState(() {
      _scanBarcode = barcodeScanRes;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
            appBar: AppBar(title: const Text('Barcode scan')),
            body: SafeArea(
              child: Center(
                child: Flex(
                  direction: Axis.vertical,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    ElevatedButton(
                      onPressed: _scanBarcodeNormal,
                      child: const Text('Start barcode scan'),
                    ),
                    const SizedBox(
                      height: 24,
                    ),
                    Text('Scan result : $_scanBarcode\n',
                      style: const TextStyle(fontSize: 20),
                    ),
                  ],
                ),
              ),
            ),
        ),
    );
  }

  Future<void> _skipToProductDetail(String barcode) async {
    final isbn = barcode.barcodeToIsbn();
    if (isbn.isEmpty) {
      _showAlertDialog();
      return;
    }
    final url = 'https://www.amazon.co.jp/dp/$isbn';
    await Navigator.push(
      context,
      MaterialPageRoute<void>(
        builder: (context) =>
            ProductDetailsPage(url: url),
      ),
    );
  }

  void _showAlertDialog() {
    showDialog<void>(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Warning'),
          content: const SingleChildScrollView(
            child: ListBody(
              children: <Widget>[
                Text('100が上限です'),
              ],
            ),
          ),
          actions: <Widget>[
            FloatingActionButton(
              child: const Text('OK'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }
}
