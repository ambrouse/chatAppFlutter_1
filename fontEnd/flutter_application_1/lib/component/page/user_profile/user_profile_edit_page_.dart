import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_application_1/component/custom_state/custom_back_button_1_.dart';
import 'package:flutter_application_1/component/custom_state/custom_button_1_.dart';
import 'package:flutter_application_1/component/custom_state/custom_img_field_1_.dart';
import 'package:flutter_application_1/component/custom_state/custom_navbar_1_.dart';
import 'package:flutter_application_1/component/custom_state/custom_text_1_.dart';
import 'package:flutter_application_1/component/custom_state/custom_text_field_1_.dart';
import 'package:flutter_application_1/component/page/user_profile/user_profile_root_page_.dart';
import 'package:flutter_application_1/function/function_profile_user_.dart';
import 'package:flutter_application_1/setting/setting_varilabel_.dart';
// import 'package:image_field/image_field.dart';

class User_profile_edit_ extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return User_profile_edit_setting_();
  }
}

class User_profile_edit_setting_ extends State<User_profile_edit_> {
  TextEditingController textEditingControllerEmail_ = TextEditingController();
  TextEditingController textEditingControllerPassword_ =
      TextEditingController();
  TextEditingController textEditingControllerName_ = TextEditingController();
  TextEditingController textEditingControllerAge_ = TextEditingController();
  String errNofitication_ = "";
  String pathImg_ = "";
  String nameImg_ = "";
  var fileImg_;
  var userInfor;
  @override
  void initState() {
    super.initState();
    functionGetUserInfo().then((data) {
      getIdUser().then((data_) {
        setState(() {
          nameImg_ = data_ + "_" + "myProfileAvarta.png";
          if (data[0]) {
            userInfor = data[1].data["result_"];
            textEditingControllerName_.text = userInfor["name_"];
            textEditingControllerEmail_.text = userInfor["email_"];
            textEditingControllerPassword_.text = userInfor["password_"];
            textEditingControllerAge_.text = userInfor["age_"];
            fileImg_ = Image.file(File(userInfor["linkImg_"]));
          }
        });
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    final width_ = MediaQuery.of(context).size.width;
    final height_ = MediaQuery.of(context).size.height;

    return Scaffold(
        backgroundColor: colorBackGround_1_,
        bottomNavigationBar: Custom_navbar_1_(2),
        body: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                alignment: Alignment.topLeft,
                child: InkWell(
                  onTap: () {
                    Navigator.pushNamed(context, "/user/user_profile_root");
                  },
                  child: Custom_back_button_1_(),
                ),
              ),
              Center(
                child: Custom_text_1_(
                    "edit user", colorBackGround_2_, sizeText_3_),
              ),
              Center(
                child: Container(
                  margin: EdgeInsets.only(top: 40),
                  width: 150,
                  height: 150,
                  decoration: BoxDecoration(
                      image: DecorationImage(
                          fit: BoxFit.cover,
                          image: fileImg_ != null
                              ? fileImg_.image
                              : AssetImage(
                                  "assets/backiee-124549-landscape.jpg")),
                      border: Border.all(
                        color: colorBackGround_2_,
                        width: 1,
                      ),
                      borderRadius:
                          BorderRadius.all(Radius.circular(100000000))),
                ),
              ),
              Center(
                child: Container(
                  width: (width_ / 1.3),
                  child: Column(
                    children: [
                      Container(
                        height: 30,
                        margin: EdgeInsets.only(top: 50),
                        child: Custom_text_field(textEditingControllerName_,
                            "Không được để trống tên.", 1),
                      ),
                      userInfor == null
                          ? Container()
                          : Container(
                              alignment: Alignment.topLeft,
                              height: 30,
                              margin: EdgeInsets.only(top: 20),
                              child: Custom_text_1_(userInfor["email_"],
                                  colorBackGround_2_, sizeText_2_)),
                      userInfor == null
                          ? Container()
                          : Container(
                              alignment: Alignment.topLeft,
                              height: 30,
                              margin: EdgeInsets.only(top: 20),
                              child: Custom_text_1_(userInfor["password_"],
                                  colorBackGround_2_, sizeText_2_)),
                      Container(
                        height: 30,
                        margin: EdgeInsets.only(top: 20),
                        child: Custom_text_field(textEditingControllerAge_,
                            "không được để trống tuổi.", 1),
                      ),
                      Container(
                        margin: EdgeInsets.only(top: 20),
                        child: InkWell(
                          onTap: () {
                            loadImageLocal(nameImg_).then((data) {
                              setState(() {
                                imageCache.evict(fileImg_.image,
                                    includeLive: true);
                                print(data);
                                fileImg_ = Image.file(File(data));
                              });
                            });
                          },
                          child: Custom_buttom_1_("Chọn ảnh."),
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.only(top: 50),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Container(),
                            Container(
                              child: InkWell(
                                onTap: () {
                                  functionUpdateUser(
                                          textEditingControllerName_.text,
                                          textEditingControllerEmail_.text,
                                          textEditingControllerPassword_.text,
                                          textEditingControllerAge_.text,
                                          nameImg_)
                                      .then((data) {});
                                },
                                child: Custom_buttom_1_("Cập nhật."),
                              ),
                            )
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ],
          ),
        ));
  }
}
