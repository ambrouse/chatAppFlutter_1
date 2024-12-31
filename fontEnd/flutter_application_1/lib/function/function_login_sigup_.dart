

import 'package:dio/dio.dart';
import 'package:shared_preferences/shared_preferences.dart';

Future<dynamic> Func_login_request_(name_, password_) async {
  final dio = Dio();
  try {
    Response response = await dio.get(
        "http://10.0.2.2:9090/chat_app/api/v1/login",
        data: {"email_": "testemail7@gmail.com", "password_": "testpassword1"},
        options: Options(
            contentType: Headers.jsonContentType,
            headers: {'Authorization': ""}));

    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    sharedPreferences.setString(
        "jwtToken_", response.data["result_"]["token_"]);
    sharedPreferences.setString("idUser_", response.data["result_"]["idUser_"]);
    return [true, response];
  } on DioException catch (e) {
    return [false, e.response];
  }
}


Future<dynamic> Func_sigup_request_(name_, email_, password_, age_) async {
  final dio = Dio();
  try {
    Response response = await dio.post(
        "http://10.0.2.2:9090/chat_app/api/v1/sigup",
        data: {
          "email_": email_,
          "password_": password_,
          "name_": name_,
          "age_": 10
        },
        options: Options(
            contentType: Headers.jsonContentType,
            headers: {"Authorization": ""}));
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    sharedPreferences.setString(
        "jwtToken_", response.data["result_"]["token_"]);
    sharedPreferences.setString("idUser_", response.data["result_"]["idUser_"]);
    return [true, response];
  } on DioException catch (e) {
    return [false, e.response];
  }
}