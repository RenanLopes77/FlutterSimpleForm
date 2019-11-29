import 'package:flutter/material.dart';
import 'package:simple_form/register/register.dart';
import './register_details.dart';
import '../form/my_form.dart';

class Registers extends StatefulWidget {
  @override
  _RegistersState createState() => _RegistersState();
}

class _RegistersState extends State<Registers> {
  final List<Register> registers = [];

  addRegister(Register register) {
    setState(() => registers.add(register));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Registros'),
        backgroundColor: Colors.redAccent,
      ),
      body: ListView.builder(
        itemCount: registers.length,
        itemBuilder: (context, index) {
          return new RegisterDetails(register: registers[index]);
        },
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        backgroundColor: Colors.redAccent,
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => MyForm(addRegister)),
          );
        },
      ),
    );
  }
}
