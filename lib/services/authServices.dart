import 'package:dio/dio.dart' as Dio;
import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:shop_app/services/dio.dart';

class AuthServices extends ChangeNotifier {
  bool _isLoggedIn = false;

  late String _token;
  late String _user;
  final storage = const FlutterSecureStorage();

  bool get authenticated => _isLoggedIn;

  Future<dynamic> login(Map<String, String> credentials) async {
    print(credentials);
    Dio.Response response = await dio().post('login', data: credentials);
    return response.data;
  }

  Future<dynamic> reset({required String email}) async {
    print(email);
    await dio().post('forget', data: {'email': email});
  }

  Future<dynamic> tryToken({String? token}) async {
    print(token);
    if (token == null) return;
    try {
      Dio.Response response = await dio().get('user',
          options: Dio.Options(headers: {'Authorization': 'Bearer $token'}));
      if (response.statusCode == 200) {
        _user = response.data.toString();

        _isLoggedIn = true;
        notifyListeners();
        _token = token;
        notifyListeners();
        storeUser(_user);
        storeToken(token);
      }
    } on DioError catch (e) {
      print(e);
    }
  }

  void storeToken(String token) async {
    await storage.write(key: "token", value: token);
  }

  void storeUser(String user) async {
    await storage.write(key: "user", value: user);
  }

  Future<bool> logout() async {
    try {
      await dio().post('logout',
          options: Dio.Options(headers: {'Authorization': 'Bearer $_token'}));
    } catch (e) {
      print(e);
    }
    deleteToken();
    deleteUser();
    _isLoggedIn = false;
    notifyListeners();
    return _isLoggedIn;
  }

  void deleteToken() async {
    storage.delete(key: 'token');
  }

  void deleteUser() async {
    storage.delete(key: 'user');
  }
}
