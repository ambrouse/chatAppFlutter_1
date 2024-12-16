import 'package:dio/dio.dart';
import 'package:shared_preferences/shared_preferences.dart';

Future<dynamic> functionFindFriend(String nameFriend_) async {
  final dio = Dio();
  SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
  String idUser_ = sharedPreferences.getString("idUser_").toString();
  String token_ = sharedPreferences.getString("jwtToken_").toString();
  try {
    Response response = await dio.get(
        "http://10.0.2.2:9090/chat_app/api/v1/send_request_friend?name_=" +
            nameFriend_ +
            "&id_user=" +
            idUser_,
        data: {},
        options: Options(
            contentType: Headers.jsonContentType,
            headers: {'Authorization': ""}));
    return response;
  } on DioException catch (e) {
    return null;
  }
}


Future<dynamic> functionRequestFriend(String idFriend_) async {
  final dio = Dio();
  SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
  String idUser_ = sharedPreferences.getString("idUser_").toString();
  String token_ = sharedPreferences.getString("jwtToken_").toString();
  try {
    Response response = await dio.post(
        "http://10.0.2.2:9090/chat_app/api/v1/send_request_friend",
        data: {
          "idUser_":idUser_,
          "idUserFriend_":idFriend_
        },
        options: Options(
            contentType: Headers.jsonContentType,
            headers: {'Authorization': ""}));
    return response;
  } on DioException catch (e) {
    return null;
  }
}
