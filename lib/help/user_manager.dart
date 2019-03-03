import 'package:boomenglish/model/user.dart';

class UserManager {
  User user;
  String token;
  bool get isLogin => token != null && token.length > 0;

  // 工厂模式
  factory UserManager() => _getInstance();
  static UserManager get instance => _getInstance();
  static UserManager _instance;
  UserManager._internal() {
    // 初始化
  }
  static UserManager _getInstance() {
    if (_instance == null) {
      _instance = new UserManager._internal();
    }
    return _instance;
  }
  
}
