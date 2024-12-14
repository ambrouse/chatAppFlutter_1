import 'package:flutter/material.dart';
import 'package:flutter_application_1/component/custom_state/custom_back_button_1_.dart';
import 'package:flutter_application_1/component/custom_state/custom_blog_card_.dart';
import 'package:flutter_application_1/component/custom_state/custom_navbar_1_.dart';
import 'package:flutter_application_1/component/custom_state/custom_text_1_.dart';
import 'package:flutter_application_1/function/function_profile_user_.dart';
import 'package:flutter_application_1/setting/setting_varilabel_.dart';

class User_profile_edit_blog_page_ extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return User_profile_edit_blog_page_setting_();
  }
}

class User_profile_edit_blog_page_setting_
    extends State<User_profile_edit_blog_page_> {
  var myBlogItem_;
  var errNofitication_;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    functionGeMyBlog().then((data) {
      if (data[0]) {
        setState(() {
          myBlogItem_ = data[1].data["result_"];
          print(myBlogItem_.length);
        });
      } else {
        errNofitication_ = data[1]["result_"];
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final width_ = MediaQuery.of(context).size.width;
    final height_ = MediaQuery.of(context).size.height;

    return Scaffold(
        backgroundColor: colorBackGround_1_,
        bottomNavigationBar: Custom_navbar_1_(3),
        body: Container(
          width: width_,
          height: height_,
          child: SingleChildScrollView(
            child: Container(
              // margin: EdgeInsets.only(bottom: 100),
              width: width_,
              height: (height_ - 100),
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
                    child: Custom_text_1_(
                        "Quản lý bài viết", colorBackGround_2_, sizeText_3_),
                  ),
                  Container(
                    margin: EdgeInsets.only(top: 50),
                    width: (width_ / 1.3),
                    alignment: Alignment.topLeft,
                    child: Custom_text_1_(
                        "Các bài viết đã đăng :", colorBackGround_2_, sizeText_3_),
                  ),
                  Expanded(
                    child: Container(
                      margin: EdgeInsets.only(top: 50),
                      padding: EdgeInsets.only(left: 40, right: 40),
                      child: GridView.builder(
                          gridDelegate:
                              SliverGridDelegateWithMaxCrossAxisExtent(
                                  maxCrossAxisExtent: 500,
                                  mainAxisExtent: 250,
                                  crossAxisSpacing: 20,
                                  mainAxisSpacing: 20),
                          itemCount:
                              myBlogItem_ == null ? 1 : myBlogItem_.length,
                          itemBuilder: (context, index) {
                            return myBlogItem_ == null
                                ? Container(
                                    child: Center(child: Custom_text_1_(errNofitication_==null?"load....":errNofitication_,colorBackGround_2_,sizeText_3_)),
                                  )
                                : Custom_blog_card(
                                    myBlogItem_[index]["title_"],
                                    myBlogItem_[index]["content_"],
                                    myBlogItem_[index]["like_"].toString(),
                                    myBlogItem_[index]["heart_"].toString(),
                                    myBlogItem_[index]["id_"]);
                          }),
                    ),
                  )
                ],
              ),
            ),
          ),
        ));
  }
}
