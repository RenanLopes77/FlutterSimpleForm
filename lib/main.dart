import 'package:flutter/material.dart';

void main() => runApp(MyForm());

class MyForm extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Cadastros',
      theme: ThemeData(
        primaryColor: Colors.redAccent,
      ),
      home: Scaffold(
        appBar: AppBar(
          title: Text('Cadastros'),
        ),
        body: Registers(),
      ),
    );
  }
}

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

class RegisterDetails extends StatelessWidget {
  final int index;

  RegisterDetails({this.index});

  @override
  Widget build(BuildContext context) {
    return Card(
        margin: EdgeInsets.fromLTRB(4, 4, 4, 4),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.all(4.0),
                child: Row(
                  children: <Widget>[
                    Expanded(
                      child: Text('Nome',
                          style: TextStyle(fontWeight: FontWeight.bold)),
                      flex: 1,
                    ),
                    Expanded(
                      child: Text('Renan'),
                      flex: 4,
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(4.0),
                child: Row(
                  children: <Widget>[
                    Expanded(
                      child: Text('Idade',
                          style: TextStyle(fontWeight: FontWeight.bold)),
                      flex: 2,
                    ),
                    Expanded(
                      child: Text('22'),
                      flex: 2,
                    ),
                    Expanded(
                      child: Text('Telefone',
                          style: TextStyle(fontWeight: FontWeight.bold)),
                      flex: 3,
                    ),
                    Expanded(
                      child: Text('(11) 1234-5678'),
                      flex: 3,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ));
  }
}
