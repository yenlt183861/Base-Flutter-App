class Singleton {
  static final Singleton _instance = Singleton._();

  static Singleton get instance => _instance;
  factory Singleton() {
    return _instance;
  }
  Singleton._();

  String? tokenLogin;

  bool get isLoginUser => tokenLogin != null;
}
