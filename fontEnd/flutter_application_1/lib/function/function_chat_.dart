import 'package:dio/dio.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:web_socket_channel/web_socket_channel.dart';

Future<dynamic> functionGetChat(linkuser_) async {
  final dio = Dio();
  SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
  String idUser_ = sharedPreferences.getString("idUser_").toString();
  String token_ = sharedPreferences.getString("jwtToken_").toString();
  try {
    Response response = await dio.get(
        "${"http://10.0.2.2:9090/chat_app/api/v1/chat/" +
            linkuser_}/$idUser_",
        data: {},
        options: Options(
            contentType: Headers.jsonContentType,
            headers: {'Authorization': ""}));
    return response;
  } on DioException catch (e) {
    return e.response;
  }
}

Future<dynamic> functionSendChat(idFriend_, content_) async {
  final dio = Dio();
  SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
  String idUser_ = sharedPreferences.getString("idUser_").toString();
  String token_ = sharedPreferences.getString("jwtToken_").toString();
  try {
    Response response = await dio.post(
        "http://10.0.2.2:9090/chat_app/api/v1/chat",
        data: {
          "idUser_": idUser_,
          "iduserFriend_": idFriend_,
          "content_": content_
        },
        options: Options(
            contentType: Headers.jsonContentType,
            headers: {'Authorization': ""}));
    return response;
  } on DioException catch (e) {
    return e.response;
  }
}

Future<dynamic> functionConectSocket() async {
  final wsUrl = Uri.parse('ws://10.0.2.2:9090/ws');
  final channel = WebSocketChannel.connect(wsUrl);

  await channel.ready;

  return channel;
}

Future<dynamic> functionSendMessWebSocket() async {
  final wsUrl = Uri.parse('ws://10.0.2.2:9090/ws');
  final channel = WebSocketChannel.connect(wsUrl);
  await channel.ready;
  channel.sink.add("conected");

  
  return channel;
}
