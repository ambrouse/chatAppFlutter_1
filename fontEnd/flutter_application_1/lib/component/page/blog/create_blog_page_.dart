import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_application_1/component/custom_state/custom_back_button_1_.dart';
import 'package:flutter_application_1/component/custom_state/custom_button_1_.dart';
import 'package:flutter_application_1/component/custom_state/custom_img_field_1_.dart';
import 'package:flutter_application_1/component/custom_state/custom_navbar_1_.dart';
import 'package:flutter_application_1/component/custom_state/custom_text_1_.dart';
import 'package:flutter_application_1/component/custom_state/custom_text_field_1_.dart';
import 'package:flutter_application_1/function/function_blog_.dart';
import 'package:flutter_application_1/setting/setting_varilabel_.dart';

class Create_blog_page_ extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return Create_blog_page_setting_();
  }
}

class Create_blog_page_setting_ extends State<Create_blog_page_> {
  var myBlogDetail_;
  TextEditingController textEditingControllerTitle_ = TextEditingController();
  TextEditingController textEditingControllerContent_ = TextEditingController();
  var previewImage;
  var pikerImage_;
  String errTitle_ = "";
  String errContent_ = "";
  String errImage_ = "";
  String nameImg_ = "_img_blog.png";

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
            Container(
              margin: EdgeInsets.only(top: 50),
              width: (width_ / 1.2),
              child: Container(
                child: Custom_text_1_(
                    "Tiêu đề :", colorBackGround_2_, sizeText_2_),
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: 10),
              width: (width_ / 1.3),
              child: Container(
                height: 30,
                child: Custom_text_field(textEditingControllerTitle_, "", 1),
              ),
            ),
            Center(
              child: Container(
                margin: EdgeInsets.only(top: 10),
                width: (width_ / 1.3),
                child: Container(
                  height: 30,
                  child: Custom_text_1_(errTitle_, Colors.red, sizeText_1_),
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: 50),
              width: (width_ / 1.2),
              child: Container(
                child: Custom_text_1_(
                    "Nội dung :", colorBackGround_2_, sizeText_2_),
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: 10),
              width: (width_ / 1.3),
              child: Container(
                height: 100,
                child: Custom_text_field(textEditingControllerContent_, "", 5),
              ),
            ),
            Center(
              child: Container(
                margin: EdgeInsets.only(top: 10),
                width: (width_ / 1.3),
                child: Container(
                  height: 30,
                  child: Custom_text_1_(errContent_, Colors.red, sizeText_1_),
                ),
              ),
            ),
            Center(
              child: Container(
                margin: EdgeInsets.only(top: 50),
                width: (width_ / 1.3),
                height: (width_ / 1.3),
                decoration: BoxDecoration(
                    border: Border.all(color: colorBackGround_2_, width: 1),
                    image: DecorationImage(
                        fit: BoxFit.cover,
                        image: previewImage == null
                            ? AssetImage("assets/backiee-124549-landscape.jpg")
                            : previewImage.image)),
              ),
            ),
            Container(
                margin: EdgeInsets.only(top: 20),
                child: InkWell(
                  onTap: () {
                    loadImageLocal("demo_create_blog.png").then((data) {
                      setState(() {
                        if (previewImage != null) {
                          imageCache.evict(previewImage.image,
                              includeLive: true);
                        }
                        if (data != null) {
                          errImage_ = "";
                          previewImage = Image.file(File(data));
                          pikerImage_ = File(data);
                        }
                      });
                    });
                  },
                  child: Custom_buttom_1_("Chọn ảnh."),
                )),
            Center(
              child: Container(
                margin: EdgeInsets.only(top: 10),
                width: (width_ / 1.3),
                child: Container(
                  height: 30,
                  child: Custom_text_1_(errImage_, Colors.red, sizeText_1_),
                ),
              ),
            ),
            Container(
                margin: EdgeInsets.only(top: 20),
                child: InkWell(
                  onTap: () {
                    if (textEditingControllerTitle_.text
                        .split(" ")
                        .last
                        .isEmpty) {
                      setState(() {
                        errTitle_ = "Không được để trống tiêu đề.";
                      });
                    } else if (textEditingControllerContent_.text
                        .split(" ")
                        .last
                        .isEmpty) {
                      setState(() {
                        errTitle_ = "";
                        errContent_ = "Không được để trống nội dung.";
                      });
                    } else if (pikerImage_ == null) {
                      setState(() {
                        errContent_ = "";
                        errImage_ = "Không được để trống ảnh.";
                      });
                    } else {
                      functionCreateBlog(textEditingControllerTitle_.text,
                              textEditingControllerContent_.text)
                          .then((data) {
                        if (pikerImage_ != null) {
                          saveImage(
                                  pikerImage_,
                                  data.data["result_"]["idBlog_"] +
                                      "_img_blog.png")
                              .then((data_) {
                            loadUrlImage().then((data_url) {
                              String img_path_ = data_url +
                                  "/" +
                                  data.data["result_"]["idBlog_"] +
                                  nameImg_;
                              functionUpdateImgBlog(
                                      data.data["result_"]["idBlog_"],
                                      img_path_)
                                  .then((data__) {
                                  Navigator.pushNamed(
                                      context, "/user/user_profile_root");
                              });
                            });
                          });
                        }
                      });
                    }
                  },
                  child: Custom_buttom_1_("Lưu."),
                )),
          ],
        ),
      ),
    );
  }
}
