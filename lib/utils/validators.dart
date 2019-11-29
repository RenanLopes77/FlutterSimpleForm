class Validators {
  String notEmpty(value, {emptyMessage: 'Empty field'}) {
    if (value.isEmpty) {
      return emptyMessage;
    }
    return null;
  }

  String isEmail(value, {emptyMessage: 'Please enter email', notMatchMessage: 'Enter Valid Email'}) {
    if (value.isEmpty) {
      return emptyMessage;
    }

    Pattern emailPattern = r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';

    if (!RegExp(emailPattern).hasMatch(value)) {
      return notMatchMessage;
    }
    return null;
  }
}