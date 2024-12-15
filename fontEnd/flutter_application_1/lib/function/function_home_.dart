import 'package:dio/dio.dart';
import 'package:shared_preferences/shared_preferences.dart';

Future<dynamic> functionGetFriend(String nameFriend_) async {
  final dio = Dio();
  SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
  String idUser_ = sharedPreferences.getString("idUser_").toString();
  String token_ = sharedPreferences.getString("jwtToken_").toString();
  // print("http://10.0.2.2:9090/chat_app/api/v1/friends?id_user=" +
  //     idUser_ +
  //     "&name="+nameFriend_);
  try {
    Response response = await dio.get(
        "http://10.0.2.2:9090/chat_app/api/v1/friends?id_user=" +
            idUser_ +
            "&name=" +
            nameFriend_,
        data: {},
        options: Options(
            contentType: Headers.jsonContentType,
            headers: {'Authorization': ""}));
    return [true, response];
  } on DioException catch (e) {
    return [false, e?.response];
  }
}
