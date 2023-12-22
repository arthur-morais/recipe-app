class Validator {
  Validator._();

  static String? validateBasic(String? value) {
    if (value != null && value.isEmpty) {
      return "This field can not be empty.";
    }
    return null;
  }

  static String? validateUrl(String? value) {
    final condition = RegExp(
        r"((https?|ftp)\:\/\/([\w-]+\.)?([\w-])+\.(\w)+\/?[\w\?\.\=\&\-\#\+\/]+)");
        
    validateBasic(value);

    if (value != null && !condition.hasMatch(value)) {
      return 'URL can not be validated.';
    }

    return null;
  }
}
