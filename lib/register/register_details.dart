import 'package:flutter/material.dart';

class RegisterDetails extends StatelessWidget {
  final int index;

  RegisterDetails({this.index});

  @override
  Widget build(BuildContext context) {
    final TextStyle boldText = TextStyle(fontWeight: FontWeight.bold);
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
                          style: boldText),
                      flex: 1,
                    ),
                    Expanded(
                      child: Text('Renan Morais Lopes'),
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
                          style: boldText),
                      flex: 2,
                    ),
                    Expanded(
                      child: Text('22'),
                      flex: 2,
                    ),
                    Expanded(
                      child: Text('Telefone',
                          style: boldText),
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
