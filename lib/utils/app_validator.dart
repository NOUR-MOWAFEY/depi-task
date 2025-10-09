class AppValidator {
  static String? validator(String? input, InputType type) {
    if (input == '') {
      return 'Required Field';
    } else if (type == InputType.email) {
      if (!input!.contains(emailRegExp)) {
        return 'Invalid Email';
      }
    } else if (type == InputType.password) {
      if (input!.length < 8) {
        return 'Password must have at least 8 characters';
      }
    } else if (type == InputType.firstName || type == InputType.lastName) {
      if (input == null) {
        return 'Required Field';
      }
    } else {
      return null;
    }
    return null;
  }
}

enum InputType { email, password, firstName, lastName }

RegExp emailRegExp = RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$');
