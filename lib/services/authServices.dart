import 'package:dio/dio.dart' as Dio;
import 'package:flutter/cupertino.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:shop_app/models/user.dart';
import 'package:shop_app/services/dio.dart';

class AuthServices extends ChangeNotifier {
  bool _isLoggedIn = false;

  late User _user;
  late String _token;
  final storage = const FlutterSecureStorage();

  bool get authenticated => _isLoggedIn;

  User get user => _user;

  Future<bool> login(Map<String, String> credentials) async {
    print(credentials);
    try {
      Dio.Response response =
          await dio().post('authentication', data: credentials);
      String token = response.data.toString();
      await tryToken(token: token);
    } catch (e) {
      print(e);
    }
    notifyListeners();
    return _isLoggedIn;
  }

  Future<bool> reset({required String email}) async {
    print(email);
    try {
      final response = await dio().post('forget', data: email);
      // print(response.data.toString());
    } catch (e) {
      print(e);
    }
    return false;
  }

  Future<dynamic> tryToken({String? token}) async {
    if (token == null) return;
    try {
      Dio.Response response = await dio().get('user',
          options: Dio.Options(headers: {'Authorization': 'Bearer $token'}));
      if (response.statusCode == 200) {
        _isLoggedIn = true;
        notifyListeners();
        _user = User.fromJson(response.data);
        notifyListeners();
        _token = token;
        notifyListeners();
        storeToken(token);
        print(_user);
      }
    } catch (e) {
      print(e);
    }
    return _isLoggedIn;
  }

  void storeToken(String token) async {
    await storage.write(key: "token", value: token);
  }

  Future<bool> logout() async {
    try {
      await dio().post('logout',
          options: Dio.Options(headers: {'Authorization': 'Bearer $_token'}));
    } catch (e) {
      print(e);
    }
    deleteToken();
    _isLoggedIn = false;
    notifyListeners();
    return _isLoggedIn;
  }

  void deleteToken() async {
    storage.delete(key: 'token');
  }
}
