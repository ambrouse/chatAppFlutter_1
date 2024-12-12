import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/component/custom_state/custom_button_1_.dart';
import 'package:flutter_application_1/component/custom_state/custom_text_1_.dart';
import 'package:flutter_application_1/component/custom_state/custom_text_field_1_.dart';
import 'package:flutter_application_1/setting/setting_varilabel_.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Login_page_ extends StatefulWidget {
  const Login_page_({super.key});

  @override
  State<StatefulWidget> createState() {
    return Login_page_setting_();
  }
}

Future<dynamic> func_login_request_(name_, password_) async {
  final dio = Dio();
  print(name_);
  print(password_);
  try {
    Response response = await dio.get(
        "http://10.0.2.2:9090/chat_app/api/v1/login",
        data: {"email_": name_, "password_": password_},
        options: Options(
            contentType: Headers.jsonContentType,
            headers: {'Authorization': ""}));

    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    sharedPreferences.setString(
        "jwtToken_", response.data["result_"]["token_"]);
    sharedPreferences.setString("idUser_", response.data["result_"]["idUser_"]);
    return [true, response];
  } on DioException catch (e) {
    return [false, e?.response];
  }
}

class Login_page_setting_ extends State<Login_page_> {
  TextEditingController textEditingControllerEmail_ = TextEditingController();
  TextEditingController textEditingControllerPassword_ =
      TextEditingController();
  String errNofitication_ = "";
  var emailValue_;
  var passwordValue_;
  @override
  Widget build(BuildContext context) {
    final width_ = MediaQuery.of(context).size.width;
    final height_ = MediaQuery.of(context).size.height;
    // if (passwordValue_ != null) {
    //   textEditingControllerEmail_.text = emailValue_.toString();
    // }
    // if (passwordValue_ != null) {
    //   textEditingControllerEmail_.text = passwordValue_.toString();
    // }
    return Scaffold(
      backgroundColor: colorBackGround_1_,
      body: SingleChildScrollView(
          child: Column(
        children: [
          Container(
            alignment: Alignment.center,
            child: Custom_text_1_("Đăng nhập", colorText_2_, sizeText_3_),
          ),
          Center(
            child: Container(
              margin: const EdgeInsets.only(top: 50),
              width: (width_ / 1.3),
              height: 30,
              child:
                  Custom_text_field(textEditingControllerEmail_, "Nhập Email"),
            ),
          ),
          Center(
            child: Container(
              margin: const EdgeInsets.only(top: 20),
              width: (width_ / 1.3),
              height: 30,
              child: Custom_text_field(
                  textEditingControllerPassword_, "Nhập Mật khẩu"),
            ),
          ),
          Center(
            child: Container(
                margin: const EdgeInsets.only(top: 20),
                width: (width_ / 1.3),
                height: 30,
                alignment: Alignment.center,
                child: Custom_text_1_(errNofitication_,
                    const Color.fromARGB(255, 255, 0, 0), sizeText_1_)),
          ),
          Center(
            child: Container(
              margin: const EdgeInsets.only(top: 50),
              width: (width_ / 1.3),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    child: InkWell(
                      onTap: () {
                        Navigator.pushNamed(context, "/user/sigup");
                      },
                      child: Custom_buttom_1_("Đăng ký"),
                    ),
                  ),
                  Container(
                    child: InkWell(
                      onTap: () {
                        func_login_request_(textEditingControllerEmail_.text,
                                textEditingControllerPassword_.text)
                            .then((data) {
                          setState(() {
                            if (data[0]) {
                              // Navigator.pushNamed(context, "");
                              errNofitication_ = "";
                              print(data);
                            } else {
                              print(data);
                              errNofitication_ = data[1].data["result_"];
                            }
                          });
                        });
                      },
                      child: Custom_buttom_1_("Tiếp theo"),
                    ),
                  )
                ],
              ),
            ),
          )
        ],
      )),
    );
  }
}
