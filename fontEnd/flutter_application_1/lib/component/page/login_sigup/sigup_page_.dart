import 'dart:math';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/component/custom_state/custom_button_1_.dart';
import 'package:flutter_application_1/component/custom_state/custom_text_1_.dart';
import 'package:flutter_application_1/component/custom_state/custom_text_field_1_.dart';
import 'package:flutter_application_1/setting/setting_varilabel_.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Sigup_page_ extends StatefulWidget {
  const Sigup_page_({super.key});

  @override
  State<StatefulWidget> createState() {
    return Sigup_page_setting_();
  }
}

Future<dynamic> func_sigup_request_(name_, email_, password_, age_) async {
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
    return [false, e?.response];
  }
}

class Sigup_page_setting_ extends State<Sigup_page_> {
  TextEditingController textEditingControllerEmail_ = TextEditingController();
  TextEditingController textEditingControllerPassword_ =
      TextEditingController();
  TextEditingController textEditingControllerName_ = TextEditingController();
  TextEditingController textEditingControllerAge_ = TextEditingController();
  String errNofitication_ = "";
  @override
  Widget build(BuildContext context) {
    final width_ = MediaQuery.of(context).size.width;
    final height_ = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: colorBackGround_1_,
      body: SingleChildScrollView(
          child: Column(
        children: [
          Container(
            alignment: Alignment.center,
            child: Custom_text_1_("Đăng Ký", colorText_2_, sizeText_3_),
          ),
          Center(
            child: Container(
              margin: EdgeInsets.only(top: 50),
              width: (width_ / 1.3),
              height: 30,
              child: Custom_text_field(textEditingControllerName_, "Nhập Tên"),
            ),
          ),
          Center(
            child: Container(
              margin: EdgeInsets.only(top: 20),
              width: (width_ / 1.3),
              height: 30,
              child:
                  Custom_text_field(textEditingControllerEmail_, "Nhập Email"),
            ),
          ),
          Center(
            child: Container(
              margin: EdgeInsets.only(top: 20),
              width: (width_ / 1.3),
              height: 30,
              child: Custom_text_field(
                  textEditingControllerPassword_, "Nhập Mật khẩu"),
            ),
          ),
          Center(
            child: Container(
              margin: EdgeInsets.only(top: 20),
              width: (width_ / 1.3),
              height: 30,
              child: Custom_text_field(
                  textEditingControllerAge_, "Nhập Tuổi"),
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
              margin: EdgeInsets.only(top: 50),
              width: (width_ / 1.3),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    child: InkWell(
                      onTap: () {
                        Navigator.pushNamed(context, "/user/sigup");
                      },
                      child: Custom_buttom_1_("Đăng Nhập"),
                    ),
                  ),
                  Container(
                    child: InkWell(
                      onTap: () {
                        func_sigup_request_(
                                textEditingControllerName_.text,
                                textEditingControllerEmail_.text,
                                textEditingControllerPassword_.text,
                                textEditingControllerAge_.text)
                            .then((data) {
                          print(data);
                          setState(() {
                            if (data[0]) {
                              errNofitication_ = "";
                            } else {
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
