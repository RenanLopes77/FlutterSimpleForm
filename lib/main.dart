import 'package:flutter/material.dart';
import './register/registers.dart';
import './form/my_form.dart';

void main() => runApp(MaterialApp(home: MyApp()));

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Registros'),
        backgroundColor: Colors.redAccent,
      ),
      body: Registers(),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        backgroundColor: Colors.redAccent,
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => MyForm()),
          );
        },
      ),
    );
  }
}
