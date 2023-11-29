extension Validator on String? {
  String? get validateNull {
    if (this == null || (this?.isEmpty ?? true)) {
      return "This field is required";
    } else {
      return null;
    }
  }
}
