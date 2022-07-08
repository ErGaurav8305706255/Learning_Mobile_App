class Validate {
  static final RegExp _nameRegex = RegExp(
      r"^[a-zA-Z]+(([',. -][a-zA-Z ])?[a-zA-Z]*)*$");


  static String? validateNameAddress(name) {
    final _hasMatched = _nameRegex.hasMatch(name);
    if(name.isEmpty || name.length <= 3){
      return 'Please enter Name';
    }
    if (!_hasMatched) {
      return 'Please enter valid Name.';
    }
    else {
      return null;
    }
  }

  static final RegExp _emailRegex = RegExp(
      r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$');

  static String? validateEmailAddress(email) {
    final _hasMatched = _emailRegex.hasMatch(email);
    if(email.isEmpty){
      return 'Please enter Email Id';
    }
    if (!_hasMatched) {
      return 'Please enter valid Email ID';
    } else {
      return null;
    }
  }

  static final RegExp _passwordRegex = RegExp(
      r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}$');

  static String? validatePasswordAddress(password) {
    final _hasMatched = _passwordRegex.hasMatch(password);
    if(password.isEmpty){
      return 'Please enter Password';
    }
    if (!_hasMatched) {
      return 'Please enter valid Password.';
    } else {
      return null;
    }
  }

  static final RegExp _mobileRegex = RegExp(r'(^(?:[+0]9)?[0-9]{10,12}$)');

  static String? validateMobileAddress(mobile) {
    final _hasMatched = _mobileRegex.hasMatch(mobile);
    if(mobile.isEmpty){
      return 'Please enter Mobile Number';
    }
    if (!_hasMatched) {
      return 'Please enter valid Mobile no.';
    } else {
      return null;
    }
  }
}