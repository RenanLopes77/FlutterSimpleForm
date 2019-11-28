import 'package:flutter/material.dart';
import './register_details.dart';

class Registers extends StatefulWidget {
  @override
  _RegistersState createState() => _RegistersState();
}

class _RegistersState extends State<Registers> {
  final items = List<String>.generate(50, (i) => "Item $i");

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: items.length,
      itemBuilder: (context, index) {
        return new RegisterDetails(index: index);
      },
    );
  }
}