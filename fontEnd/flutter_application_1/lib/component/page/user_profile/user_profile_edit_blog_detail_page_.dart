import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_application_1/component/custom_state/custom_back_button_1_.dart';
import 'package:flutter_application_1/component/custom_state/custom_button_1_.dart';
import 'package:flutter_application_1/component/custom_state/custom_img_field_1_.dart';
import 'package:flutter_application_1/component/custom_state/custom_navbar_1_.dart';
import 'package:flutter_application_1/component/custom_state/custom_text_1_.dart';
import 'package:flutter_application_1/component/custom_state/custom_text_field_1_.dart';
import 'package:flutter_application_1/function/function_profile_user_.dart';
import 'package:flutter_application_1/setting/setting_varilabel_.dart';
import 'package:path_provider/path_provider.dart';

class User_profile_edit_blog_detail_page_ extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return User_profile_edit_blog_detail_page_setting_();
  }
}

Future<String> test(String path) async {
  var a = await getApplicationDocumentsDirectory();
  return a.path + "/" + path;
}

class User_profile_edit_blog_detail_page_setting_
    extends State<User_profile_edit_blog_detail_page_> {
  TextEditingController textEditingControllerTitle_ = TextEditingController();
  TextEditingController textEditingControllerContent_ = TextEditingController();
  var previewImage;
  var myBlogDetail_;
  String nameImg_ = "testBlog.png";
  bool reload_ = false;
  @override
  Widget build(BuildContext context) {
    final width_ = MediaQuery.of(context).size.width;
    final height_ = MediaQuery.of(context).size.height;
    String idBlog_ = ModalRoute.of(context)!.settings.arguments as String;
    if (myBlogDetail_ == null) {
      functionGeMyBlogDetail(idBlog_).then((data) {
        setState(() {
          myBlogDetail_ = data;
          textEditingControllerTitle_.text =
              myBlogDetail_[1].data["result_"]["title_"];
          textEditingControllerContent_.text =
              myBlogDetail_[1].data["result_"]["content_"];
          previewImage = Image.file(
            File(myBlogDetail_[1].data["result_"]["linkImg_"]),
          );
        });
      });
    }
    return Scaffold(
      backgroundColor: colorBackGround_1_,
      bottomNavigationBar: Custom_navbar_1_(3),
      body: SingleChildScrollView(
        child: myBlogDetail_ == null
            ? Container(
                alignment: Alignment.center,
                child: Custom_text_1_(
                    "load.....", colorBackGround_2_, sizeText_3_),
              )
            : Column(
                children: [
                  Container(
                    alignment: Alignment.topLeft,
                    child: InkWell(
                      onTap: () {
                        Navigator.pushNamed(
                            context, "/user/user_profile_edit_blog");
                      },
                      child: Custom_back_button_1_(),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(top: 50),
                    width: (width_ / 1.2),
                    child: Container(
                      child: Custom_text_1_(
                          "Tiêu đề :", colorBackGround_2_, sizeText_3_),
                    ),
                  ),
                  myBlogDetail_[0] == false
                      ? Container(
                          alignment: Alignment.center,
                          child: Custom_text_1_(myBlogDetail_[1]["result_"],
                              colorBackGround_2_, sizeText_3_),
                        )
                      : Container(
                          margin: EdgeInsets.only(top: 10),
                          width: (width_ / 1.3),
                          child: Container(
                            height: 30,
                            child: Custom_text_field(
                                textEditingControllerTitle_,
                                myBlogDetail_[1].data["result_"]["title_"],
                                1),
                          ),
                        ),
                  Container(
                    margin: EdgeInsets.only(top: 50),
                    width: (width_ / 1.2),
                    child: Container(
                      child: Custom_text_1_(
                          "Nội dung :", colorBackGround_2_, sizeText_3_),
                    ),
                  ),
                  myBlogDetail_[0] == false
                      ? Container(
                          alignment: Alignment.center,
                          child: Custom_text_1_(myBlogDetail_[1]["result_"],
                              colorBackGround_2_, sizeText_3_),
                        )
                      : Container(
                          margin: EdgeInsets.only(top: 10),
                          width: (width_ / 1.3),
                          child: Container(
                            height: 100,
                            child: Custom_text_field(
                                textEditingControllerContent_,
                                myBlogDetail_[1].data["result_"]["content_"],
                                1),
                          ),
                        ),
                  previewImage == null
                      ? Container(
                          alignment: Alignment.center,
                          child: Custom_text_1_("load img .....",
                              colorBackGround_2_, sizeText_3_),
                        )
                      : Center(
                          child: Container(
                            margin: EdgeInsets.only(top: 50),
                            width: (width_ / 1.3),
                            height: (width_ / 1.3),
                            decoration: BoxDecoration(
                                border: Border.all(
                                    color: colorBackGround_2_, width: 1),
                                image: DecorationImage(
                                    fit: BoxFit.cover,
                                    image: previewImage.image)),
                          ),
                        ),
                  Container(
                    margin: EdgeInsets.only(top: 20),
                      child: InkWell(
                    onTap: () {
                      loadImageLocal(idBlog_ + "_" + nameImg_).then((data) {
                        setState(() {
                          imageCache.evict(previewImage.image,
                              includeLive: true);
                          previewImage = Image.file(File(data));
                          print(data);
                        });
                      });
                    },
                    child: Custom_buttom_1_("Chọn ảnh."),
                  )),
                  Container(
                    margin: EdgeInsets.only(top: 20),
                      child: InkWell(
                    onTap: () {
                      functionUpdateMyBlog(
                              idBlog_,
                              textEditingControllerTitle_.text,
                              textEditingControllerContent_.text,
                              idBlog_ + "_" + nameImg_)
                          .then((data) {
                        print(data);
                      });
                    },
                    child: Custom_buttom_1_("Lưu."),
                  )),
                  Container(
                    margin: EdgeInsets.only(top: 20),
                      child: InkWell(
                    onTap: () {
                      functionDeleteMyBlog(
                        idBlog_,
                      ).then((data) {
                        Navigator.pushNamed(context, "/user/user_profile_edit_blog");
                      });
                    },
                    child: Custom_buttom_1_("Xóa bài viết."),
                  )),
                ],
              ),
      ),
    );
  }
}
