import 'package:dio/dio.dart';
import 'package:path_provider/path_provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

Future<dynamic> functionGetUserInfo() async {
  final dio = Dio();
  SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
  String idUser_ = sharedPreferences.getString("idUser_").toString();
  String token_ = sharedPreferences.getString("jwtToken_").toString();
  try {
    Response response = await dio.get(
        "http://10.0.2.2:9090/chat_app/api/v1/user/" + idUser_,
        data: {},
        options: Options(
            contentType: Headers.jsonContentType,
            headers: {'Authorization': ""}));
    return [true, response];
  } on DioException catch (e) {
    return [false, e?.response];
  }
}

Future<String> getIdUser() async{
  SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
  String idUser_ = sharedPreferences.getString("idUser_").toString();
  return idUser_;
}

Future<dynamic> functionUpdateUser(
    var name_, var email_, var password_, var age_, var nameImg_) async {
  final dio = Dio();
  SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
  String idUser_ = sharedPreferences.getString("idUser_").toString();
  String token_ = sharedPreferences.getString("jwtToken_").toString();
  var a = await getApplicationDocumentsDirectory();
  try {
    Response response = await dio.put(
        "http://10.0.2.2:9090/chat_app/api/v1/user",
        data: {
          "idUser_": idUser_,
          "email_": email_,
          "password_": password_,
          "name_": name_,
          "age_": age_,
          "linkImg_": nameImg_
        },
        options: Options(
            contentType: Headers.jsonContentType,
            headers: {'Authorization': ""}));
    return [true, response];
  } on DioException catch (e) {
    return [false, e?.response];
  }
}

Future<dynamic> functionGeMyBlog() async {
  final dio = Dio();
  SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
  String idUser_ = sharedPreferences.getString("idUser_").toString();
  String token_ = sharedPreferences.getString("jwtToken_").toString();
  try {
    Response response = await dio.get(
        "http://10.0.2.2:9090/chat_app/api/v1/my_blog/" + idUser_,
        data: {},
        options: Options(
            headers: {'Authorization': ""},
            contentType: Headers.jsonContentType));
    return [true, response];
  } on DioException catch (e) {
    return [false, e?.response];
  }
}

Future<dynamic> functionGeMyBlogDetail(String idBlog_) async {
  final dio = Dio();
  try {
    Response response = await dio.get(
        "http://10.0.2.2:9090/chat_app/api/v1/my_blog_detail/" + idBlog_,
        data: {},
        options: Options(
            headers: {'Authorization': ""},
            contentType: Headers.jsonContentType));
    return [true, response];
  } on DioException catch (e) {
    return [false, e?.response];
  }
}

Future<dynamic> functionUpdateMyBlog(
    String idBlog_, String title_, String content_, String linkImg_) async {
  final dio = Dio();
  var a = await getApplicationDocumentsDirectory();
  try {
    Response response = await dio.put(
        "http://10.0.2.2:9090/chat_app/api/v1/my_blog_detail",
        data: {
          "idBlog_": idBlog_,
          "title_": title_,
          "content_": content_,
          "linkImg_": linkImg_,
        },
        options: Options(
            contentType: Headers.jsonContentType,
            headers: {'Authorization': ""}));
    return [true, response];
  } on DioException catch (e) {
    return [false, e?.response];
  }
}

Future<dynamic> functionDeleteMyBlog(String idBlog_) async {
  final dio = Dio();
  try {
    Response response = await dio.delete(
        "http://10.0.2.2:9090/chat_app/api/v1/my_blog_detail/" + idBlog_,
        data: {},
        options: Options(
            contentType: Headers.jsonContentType,
            headers: {'Authorization': ""}));
    return [true, response];
  } on DioException catch (e) {
    return [false, e?.response];
  }
}

Future<dynamic> functionGetRequestFriend() async {
  final dio = Dio();
  SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
  String idUser_ = sharedPreferences.getString("idUser_").toString();
  String token_ = sharedPreferences.getString("jwtToken_").toString();
  try {
    Response response = await dio.get(
        "http://10.0.2.2:9090/chat_app/api/v1/request_friend/" + idUser_,
        data: {},
        options: Options(
            contentType: Headers.jsonContentType,
            headers: {'Authorization': ""}));
    return [true, response];
  } on DioException catch (e) {
    return [false, e?.response];
  }
}

Future<dynamic> functionDeleteRequestFriend(String idRequestFriend_) async {
  final dio = Dio();
  try {
    Response response = await dio.delete(
        "http://10.0.2.2:9090/chat_app/api/v1/request_friend/" +
            idRequestFriend_,
        data: {},
        options: Options(
            contentType: Headers.jsonContentType,
            headers: {'Authorization': ""}));
    return [true, response];
  } on DioException catch (e) {
    return [false, e?.response];
  }
}

Future<dynamic> functionApplyRequestFriend(String idRequestFriend_) async {
  final dio = Dio();
  try {
    Response response = await dio.post(
        "http://10.0.2.2:9090/chat_app/api/v1/request_friend",
        data: {"idRequestFriend_": idRequestFriend_},
        options: Options(
            contentType: Headers.jsonContentType,
            headers: {'Authorization': ""}));
    return [true, response];
  } on DioException catch (e) {
    return [false, e?.response];
  }
}
