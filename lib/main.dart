import 'package:flutter/material.dart';
import './register/registers.dart';

void main() => runApp(MaterialApp(home: MyApp()));

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Registers();
  }
}
