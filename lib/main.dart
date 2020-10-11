import 'package:flutter/material.dart';
import 'package:poproject/widget/my_service.dart';
import 'package:poproject/widget/show_product.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MyService(),
    );
  }
}
