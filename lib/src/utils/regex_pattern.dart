class RegexPattern {
  static final RegExp emailRegExp = RegExp(r'^.+@[a-zA-Z]+\.{1}[a-zA-Z]+(\.{0,1}[a-zA-Z]+)$');
  static final RegExp phoneRegExp = RegExp(r'(^(?:[+0]9)?[0-9]{9,11}$)');
  static final RegExp dateRegExp =
      RegExp(r'(^(3[01]|[12][0-9]|0[1-9]|[1-9])?[/](1[0-2]|0[1-9]|[1-9])?[/]([0-9]{4})');
}
