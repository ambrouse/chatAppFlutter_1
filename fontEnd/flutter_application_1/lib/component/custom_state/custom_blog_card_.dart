import 'package:flutter/material.dart';
import 'package:flutter_application_1/component/custom_state/custom_text_1_.dart';
import 'package:flutter_application_1/setting/setting_varilabel_.dart';

// ignore: camel_case_types
class Custom_blog_card extends StatefulWidget {
  String title_;
  String content_;
  String like_;
  String heart_;
  String idBlog_;
  Custom_blog_card(
      this.title_, this.content_, this.like_, this.heart_, this.idBlog_,
      {super.key});

  @override
  State<StatefulWidget> createState() {
    return Custom_blog_card_setting();
  }
}

class Custom_blog_card_setting extends State<Custom_blog_card> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: colorBackGround_2_,
          borderRadius: BorderRadius.all(Radius.circular(20)),
          border: Border.all(
              color: const Color.fromARGB(255, 1, 97, 57), width: 1) //BoxShadow
          ),
      child: Column(
        children: [
          Container(
            padding: EdgeInsets.only(left: 20),
            height: 50,
            alignment: Alignment.topLeft,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Custom_text_1_(widget.title_, colorBackGround_1_, sizeText_2_),
              ],
            ),
          ),
          Container(
            padding: EdgeInsets.only(left: 20),
            height: 140,
            alignment: Alignment.topLeft,
            child: Custom_text_1_(
                widget.content_, colorBackGround_1_, sizeText_2_),
          ),
          Container(
            margin: EdgeInsets.only(right: 20, left: 20),
            alignment: Alignment.center,
            height: 20,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  child: Custom_text_1_("like : " + widget.like_,
                      colorBackGround_1_, sizeText_1_),
                ),
                Container(
                  child: Custom_text_1_("heart : " + widget.heart_,
                      colorBackGround_1_, sizeText_1_),
                ),
              ],
            ),
          ),
          Container(
              padding: EdgeInsets.only(left: 20),
              height: 35,
              child: Row(
                children: [
                  InkWell(
                    onTap: () {
                      Navigator.pushNamed(
                          context, "/user/user_profile_edit_blog_detail_",
                          arguments: widget.idBlog_);
                    },
                    child: Custom_text_1_("edit blog >>>>>",
                        const Color.fromARGB(255, 1, 40, 63), sizeText_1_),
                  ),
                  Container()
                ],
              )),
        ],
      ),
    );
  }
}
