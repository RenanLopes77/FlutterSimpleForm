import 'package:flutter/material.dart';
import 'package:simple_form/register/register.dart';

class RegisterDetails extends StatelessWidget {
  final int firstColumnFlex = 1;
  final int secondColumnFlex = 3;
  final Register register;
  final TextStyle boldTextStyle = TextStyle(fontWeight: FontWeight.bold);

  RegisterDetails({this.register});

  @override
  Widget build(BuildContext context) {
    return Card(
        margin: EdgeInsets.all(8.0),
        elevation: 4,
        child: Padding(
          padding: const EdgeInsets.fromLTRB(8, 12, 8, 12),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[
              _nameField(),
              _emailField(),
              _ageField(),
              _phoneField(),
            ],
          ),
        ));
  }

  Widget _fieldTemplate(List<Widget> widgets) {
    return Padding(
      padding: const EdgeInsets.all(4.0),
      child: Row(
        children: widgets,
      ),
    );
  }

  Widget _nameField() {
    return _fieldTemplate(<Widget>[
      Expanded(
        child: Text('Nome', style: boldTextStyle),
        flex: firstColumnFlex,
      ),
      Expanded(
        child: Text(register.name),
        flex: secondColumnFlex,
      ),
    ]);
  }

  Widget _emailField() {
    return _fieldTemplate(<Widget>[
      Expanded(
        child: Text('Email', style: boldTextStyle),
        flex: firstColumnFlex,
      ),
      Expanded(
        child: Text(register.email),
        flex: secondColumnFlex,
      ),
    ]);
  }

  Widget _ageField() {
    return _fieldTemplate(<Widget>[
      Expanded(
        child: Text('Idade', style: boldTextStyle, textAlign: TextAlign.start),
        flex: firstColumnFlex,
      ),
      Expanded(
        child: Text(register.age),
        flex: secondColumnFlex,
      ),
    ]);
  }

  Widget _phoneField() {
    return _fieldTemplate(<Widget>[
      Expanded(
        child: Text('Telefone', style: boldTextStyle),
        flex: firstColumnFlex,
      ),
      Expanded(
        child: Text(register.phone),
        flex: secondColumnFlex,
      ),
    ]);
  }
}
