
import 'package:dio/dio.dart';
import 'package:shared_preferences/shared_preferences.dart';

Future<dynamic> functionGetBlog() async {
  final dio = Dio();
  SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
  String idUser_ = sharedPreferences.getString("idUser_").toString();
  String token_ = sharedPreferences.getString("jwtToken_").toString();
  try {
    Response response = await dio.get(
        "http://10.0.2.2:9090/chat_app/api/v1/blog/$idUser_",
        data: {},
        options: Options(
            contentType: Headers.jsonContentType,
            headers: {'Authorization': ""}));
    return response;
  } on DioException {
    return null;
  }
}


Future<dynamic> functionCreateHeart(idBlog) async {
  final dio = Dio();
  SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
  String idUser_ = sharedPreferences.getString("idUser_").toString();
  String token_ = sharedPreferences.getString("jwtToken_").toString();
  try {
    Response response = await dio.post(
        "http://10.0.2.2:9090/chat_app/api/v1/blog_heart",
        data: {
          "idUser_":idUser_,
          "idBlog_":idBlog
        },
        options: Options(
            contentType: Headers.jsonContentType,
            headers: {'Authorization': ""}));
    return response;
  } on DioException {
    return null;
  }
}

Future<dynamic> functionDeleteHeart(idBlog) async {
  final dio = Dio();
  SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
  String idUser_ = sharedPreferences.getString("idUser_").toString();
  String token_ = sharedPreferences.getString("jwtToken_").toString();
  try {
    Response response = await dio.delete(
        "http://10.0.2.2:9090/chat_app/api/v1/blog_heart/$idUser_/"+idBlog,
        data: {},
        options: Options(
            contentType: Headers.jsonContentType,
            headers: {'Authorization': ""}));
    return response;
  } on DioException {
    return null;
  }
}


Future<dynamic> functionCreateBlog(title,content,image) async {
  final dio = Dio();
  SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
  String idUser_ = sharedPreferences.getString("idUser_").toString();
  String token_ = sharedPreferences.getString("jwtToken_").toString();
  try {
    Response response = await dio.post(
        "http://10.0.2.2:9090/chat_app/api/v1/blog",
        data: {
          "idUser_":idUser_,
          "title_":title,
          "content_":content,
          "linkImg_":image
        },
        options: Options(
            contentType: Headers.jsonContentType,
            headers: {'Authorization': ""}));
    return response;
  } on DioException {
    return null;
  }
}

Future<dynamic> functionUpdateImgBlog(idBlog,linkImg) async {
  final dio = Dio();
  try {
    Response response = await dio.put(
        "http://10.0.2.2:9090/chat_app/api/v1/update_img_blog",
        data: {
          "idBlog_":idBlog,
          "linkImg_":linkImg
        },
        options: Options(
            contentType: Headers.jsonContentType,
            headers: {'Authorization': ""}));
    return response;
  } on DioException {
    return null;
  }
}