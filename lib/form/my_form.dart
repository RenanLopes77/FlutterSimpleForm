import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_masked_text/flutter_masked_text.dart';

import '../register/register.dart';
import '../utils/validators.dart';

class MyForm extends StatelessWidget {
  final void Function(Register) addRegisterCallback;
  MyForm(this.addRegisterCallback);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Formulário'),
        backgroundColor: Colors.redAccent,
      ),
      body: BodyForm(addRegisterCallback),
    );
  }
}

class BodyForm extends StatefulWidget {
  final void Function(Register) addRegisterCallback;
  BodyForm(this.addRegisterCallback);

  @override
  _BodyFormState createState() => _BodyFormState(addRegisterCallback);
}

class _BodyFormState extends State<BodyForm> {
  final _formKey = GlobalKey<FormState>();
  final _register = new Register();
  final MaskedTextController phoneMask =
      new MaskedTextController(mask: '(00) 00000-0000');
  final void Function(Register) addRegisterCallback;

  _BodyFormState(this.addRegisterCallback);

  String validateEmail(String value) {
    if (value.isEmpty) {
      return 'Please enter email';
    }

    Pattern emailPattern =
        r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';

    if (!RegExp(emailPattern).hasMatch(value)) {
      return 'Enter Valid Email';
    }
    return null;
  }

  @override
  Widget build(BuildContext context) {
    this.phoneMask.beforeChange = (String previous, String next) {
      if (next.length <= 14) {
        this.phoneMask.updateMask('(00) 0000-0000');
      } else if (next.length == 15) {
        this.phoneMask.updateMask('(00) 00000-0000');
      }
      return true;
    };
    return Form(
        key: _formKey,
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              TextFormField(
                decoration: InputDecoration(
                  labelText: 'Nome Completo',
                ),
                onSaved: (value) {
                  setState(() {
                    _register.name = value;
                  });
                },
                validator: (value) {
                  if (value.isEmpty || value.trim().isEmpty) {
                    return 'Please enter some text';
                  }
                  return null;
                },
              ),
              TextFormField(
                decoration: InputDecoration(labelText: 'Email'),
                keyboardType: TextInputType.emailAddress,
                validator: (value) {
                  return Validators().isEmail(value,
                      emptyMessage: 'Adicione um email',
                      notMatchMessage: 'Este email é inválido');
                },
                onSaved: (value) {
                  setState(() {
                    _register.email = value;
                  });
                },
              ),
              TextFormField(
                decoration: InputDecoration(labelText: 'Idade'),
                keyboardType: TextInputType.number,
                validator: (value) {
                  return Validators()
                      .notEmpty(value, emptyMessage: 'Adicione a idade');
                },
                onSaved: (value) {
                  setState(() {
                    _register.age = value;
                  });
                },
              ),
              TextFormField(
                controller: phoneMask,
                decoration: InputDecoration(labelText: 'Telefone'),
                keyboardType: TextInputType.number,
                validator: (value) {
                  if (value.isEmpty) {
                    return 'Adicione um número de telefone';
                  } else if (value.length < 14) {
                    return 'Telefone precisa ter DDD e pelo menos 8 dígitos';
                  }
                },
                onSaved: (value) {
                  setState(() {
                    _register.phone = value.toString();
                  });
                },
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 16.0),
                child: RaisedButton(
                  onPressed: () {
                    if (_formKey.currentState.validate()) {
                      _formKey.currentState.save();
                      Scaffold.of(context).showSnackBar(
                          SnackBar(content: Text('Processing Data')));
                      addRegisterCallback(_register);
                      Navigator.pop(context);
                    }
                  },
                  child: Text('Submit'),
                ),
              )
            ],
          ),
        ));
  }
}
