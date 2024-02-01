class Validate {
  static bool email(String value) {
    Pattern pattern =
        r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9_-]+\.[a-zA-Z]+";
    var regex = RegExp(pattern as String);
    return (!regex.hasMatch(value)) ? false : true;
  }

  static bool text(String value) {
    Pattern pattern = r'[!@#<>?":_`~;[\]\\/|=+)(*&^%0-9-]';
    var regex = RegExp(pattern as String);
    return !regex.hasMatch(value);
  }
}
