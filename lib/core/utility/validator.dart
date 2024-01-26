class AppValidator {
  String? validateEmail(value) {
    if (value!.isEmpty) {
      return 'please enter an email';
    }
    RegExp emailRegExp = RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$');
    if (!emailRegExp.hasMatch(value)) {
      return 'please enter a valid email';
    }
    return null;
  }

  String? validatePhoneNumber(Value) {
    if (Value!.isEmpty) {
      return 'Please enter a phone number';
    }
    if (Value.length != 10) {
      return 'please enter the 10 digit number';
    }
    return null;
  }

  String? validatePassword(Value) {
    if (Value!.isEmpty) {
      return 'Please enter a passwaord';
    }
    return null;
  }

  String? validateUsername(Value) {
    if (Value!.isEmpty) {
      return 'Please enter your name';
    }
    return null;
  }
}
