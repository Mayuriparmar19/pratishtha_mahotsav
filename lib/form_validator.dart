class Validator {
  static notNullValidator(String? input) {
    if (input?.trim() == "" || input == null) {
      return "This Field is Required!";
    } else {
      return null;
    }
  }

  static intNotNullValidator(int? input) {
    if (input == null) {
      return "This Field is Required!";
    } else {
      return null;
    }
  }

  static phoneNumberValidator(String? input) {
    if (input!.isEmpty) {
      return "This Field is Required!";
    } else if (!RegExp(r'[0-9].{9}').hasMatch(input)) {
      return "Enter Valid Mobile Number!";
    }
    return null;
  }

  static emailValidator(String? input) {
    if (input!.isEmpty) {
      return "This Field is Required!";
    } else if (!RegExp(r'\S+@\S+\.\S+').hasMatch(input)) {
      return "Please Enter a Valid Email ID!";
    }
    return null;
  }
}
