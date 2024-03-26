import 'package:smart_learning/app_config.dart';
import 'package:http/http.dart' as http;

import '../model/login_register_response.dart';

class LoginRegisterRepo {
  Future<LoginRegisterResponse> login({
    required String email,
    required String password,
    required String age,
}) async {
    var url = Uri.parse('${AppConfig.BASE_URL}/api/login');
    final response = await http.post(
      url,
      body: {
        "email": email,
        "password": password,
        "age": age,
      },
      headers: {
        "Accept" : "application/json",
      },
    );
    return loginRegisterResponseFromJson(response.body);
  }


  Future<LoginRegisterResponse> register({
    required String email,
    required String password,
    required String age,
    required String name,
}) async {
    var url = Uri.parse('${AppConfig.BASE_URL}/api/login');
    final response = await http.post(
      url,
      body: {
        "name": name,
        "email": email,
        "password": password,
        "age": age,
      },
      headers: {
        "Accept" : "application/json",
      },
    );
    return loginRegisterResponseFromJson(response.body);
  }
}
