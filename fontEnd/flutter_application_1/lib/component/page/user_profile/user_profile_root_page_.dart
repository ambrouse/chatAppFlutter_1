import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_application_1/component/custom_state/custom_back_button_1_.dart';
import 'package:flutter_application_1/component/custom_state/custom_button_1_.dart';
import 'package:flutter_application_1/component/custom_state/custom_navbar_1_.dart';
import 'package:flutter_application_1/component/custom_state/custom_text_1_.dart';
import 'package:flutter_application_1/component/custom_state/custom_text_field_1_.dart';
import 'package:flutter_application_1/component/page/user_profile/user_profile_edit_page_.dart';
import 'package:flutter_application_1/function/function_profile_user_.dart';
import 'package:flutter_application_1/setting/setting_varilabel_.dart';

class User_profile_root_page_ extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return User_profile_root_page_setting_();
  }
}

class User_profile_root_page_setting_ extends State<User_profile_root_page_> {
  var userInfo_;
  bool checkRequest_ = false;
  @override
  initState() {
    functionGetUserInfo().then((data) {
      if (data[0]) {
        setState(() {
          userInfo_ = data[1].data['result_'];
          checkRequest_ = true;
          print(data);
        });
      } else {
        setState(() {
          checkRequest_ = false;
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final width_ = MediaQuery.of(context).size.width;
    final height_ = MediaQuery.of(context).size.height;

    return Scaffold(
      bottomNavigationBar: Custom_navbar_1_(3),
      backgroundColor: colorBackGround_1_,
      body: SingleChildScrollView(
        child: Stack(
          children: [
            Container(
              width: width_,
              height: height_,
              child: Column(
                children: [
                  userInfo_ == null
                      ? Container()
                      : Center(
                          child: Container(
                            margin: EdgeInsets.only(top: 20),
                            width: 150,
                            height: 150,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.all(
                                    Radius.circular(100000000000000)),
                                border:
                                    Border.all(color: colorText_2_, width: 1),
                                image: DecorationImage(
                                    fit: BoxFit.cover,
                                    image: userInfo_["linkImg_"] == "1"
                                        ? AssetImage(
                                            "assets/backiee-124549-landscape.jpg")
                                        : FileImage(
                                            File(userInfo_["linkImg_"])))),
                          ),
                        ),
                  userInfo_ == null
                      ? Container()
                      : Center(
                          child: Container(
                            margin: EdgeInsets.only(top: 30),
                            width: width_,
                            child: Column(
                              children: [
                                Container(
                                  margin: EdgeInsets.only(top: 20),
                                  child: Custom_text_1_(userInfo_["name_"],
                                      colorText_2_, sizeText_2_),
                                ),
                                Container(
                                  margin: EdgeInsets.only(top: 20),
                                  child: Custom_text_1_(userInfo_["email_"],
                                      colorText_2_, sizeText_2_),
                                ),
                                Container(
                                  margin: EdgeInsets.only(top: 20),
                                  child: Custom_text_1_(userInfo_["password_"],
                                      colorText_2_, sizeText_2_),
                                ),
                                Container(
                                  margin: EdgeInsets.only(top: 20),
                                  child: Custom_text_1_(userInfo_["age_"],
                                      colorText_2_, sizeText_2_),
                                ),
                              ],
                            ),
                          ),
                        ),
                  Center(
                    child: Container(
                      margin: EdgeInsets.only(top: 40),
                      width: (width_ / 1.5),
                      child: Column(
                        children: [
                          Column(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Container(
                                margin: EdgeInsets.only(top: 20),
                                child: InkWell(
                                  onTap: () {
                                    setState(() {
                                      Navigator.pushNamed(context,
                                          "/user/user_profile_edit_info");
                                    });
                                  },
                                  child: Custom_buttom_1_("Sửa thông tin."),
                                ),
                              ),
                              Container(
                                margin: EdgeInsets.only(top: 20),
                                child: InkWell(
                                  onTap: () {
                                    Navigator.pushNamed(context,
                                        "/user/user_profile_edit_blog");
                                  },
                                  child: Custom_buttom_1_("Quản lý bài viết."),
                                ),
                              )
                            ],
                          ),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Container(
                                margin: EdgeInsets.only(top: 20),
                                child: InkWell(
                                  onTap: () {
                                    Navigator.pushNamed(context,
                                        "/user/user_profile_edit_request_friend_");
                                  },
                                  child: Custom_buttom_1_("Lời mời kết bạn."),
                                ),
                              ),
                              Container(
                                margin: EdgeInsets.only(top: 20),
                                child: InkWell(
                                  onTap: () {},
                                  child: Custom_buttom_1_("textTitle_"),
                                ),
                              )
                            ],
                          )
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
