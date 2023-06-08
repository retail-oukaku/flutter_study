import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class ProductDetailsPage extends StatefulWidget {
  const ProductDetailsPage({super.key});

  @override
  State<ProductDetailsPage> createState() => _ProductDetailsPageState();
}

class _ProductDetailsPageState extends State<ProductDetailsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Flutter WebView'),
      ),
      body: SafeArea(
        child: _buildWebView(),
      ),
    );
  }


  Widget _buildWebView(){
    return const Text('data')
  }
}
