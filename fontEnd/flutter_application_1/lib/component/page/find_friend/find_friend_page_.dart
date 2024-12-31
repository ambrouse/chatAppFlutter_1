import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_application_1/component/custom_state/custom_button_1_.dart';
import 'package:flutter_application_1/component/custom_state/custom_navbar_1_.dart';
import 'package:flutter_application_1/component/custom_state/custom_text_1_.dart';
import 'package:flutter_application_1/component/custom_state/custom_text_field_1_.dart';
import 'package:flutter_application_1/function/function_find_friend_.dart';
import 'package:flutter_application_1/setting/setting_varilabel_.dart';

class find_friend_page_ extends StatefulWidget {
  const find_friend_page_({super.key});

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return find_friend_page_setting_();
  }
}

class find_friend_page_setting_ extends State<find_friend_page_> {
  var listuser_;
  TextEditingController textEditingControllerSearch_ = TextEditingController();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final width_ = MediaQuery.of(context).size.width;
    final height_ = MediaQuery.of(context).size.height;

    return Scaffold(
      bottomNavigationBar: Custom_navbar_1_(3),
      backgroundColor: colorBackGround_1_,
      body: SingleChildScrollView(
        child: SizedBox(
          width: width_,
          height: (height_ - 100),
          child: Column(
            children: [
              Center(
                  child: Container(
                margin: EdgeInsets.only(top: 30),
                width: (width_ / 1.1),
                height: 30,
                child: Row(
                  children: [
                    SizedBox(
                      width: (width_ / 1.5),
                      child: Custom_text_field(
                          textEditingControllerSearch_, "Vui lòng nhập tên bạn muốn tìm.", 1),
                    ),
                    Container(
                      margin: EdgeInsets.only(left: 10),
                      width: (width_ / 6),
                      child: InkWell(
                        onTap: () {
                          functionFindFriend(textEditingControllerSearch_.text)
                              .then((data) {
                            setState(() {
                              listuser_ = data;
                            });
                          });
                        },
                        child: Center(
                            child: Container(child: Custom_buttom_1_("Tim"))),
                      ),
                    ),
                  ],
                ),
              )),
              listuser_ == null
                  ? Container(
                      margin: EdgeInsets.only(top: 20),
                      child: Custom_text_1_("Không tìm thấy người dùng.",
                          colorBackGround_2_, sizeText_2_),
                    )
                  : Expanded(
                      child: Center(
                      child: Container(
                        margin: EdgeInsets.only(top: 40),
                        width: (width_ / 1.3),
                        child: ListView.builder(
                            itemCount: listuser_.data["result_"].length,
                            itemBuilder: (context, index) {
                              return Container(
                                  height: 50,
                                  margin: EdgeInsets.only(top: 20),
                                  padding: EdgeInsets.only(left: 10, right: 10),
                                  decoration: BoxDecoration(
                                      color: colorBackGround_2_,
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(100000))),
                                  child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Container(
                                          width: 40,
                                          height: 40,
                                          decoration: BoxDecoration(
                                              image: DecorationImage(
                                                  fit: BoxFit.cover,
                                                  image: listuser_.data["result_"][index]["linkImg_"]=="1"?
                                                  AssetImage("assets/backiee-124549-landscape.jpg")
                                                  :Image.memory(base64Decode(listuser_.data["result_"][index]["linkImg_"])).image),
                                              borderRadius: BorderRadius.all(
                                                Radius.circular(100000),
                                              ),
                                              border: Border.all(
                                                  color: colorBackGround_1_,
                                                  width: 1)),
                                        ),
                                        Container(
                                          child: Custom_text_1_(
                                              listuser_.data["result_"][index]
                                                  ["name_"],
                                              colorBackGround_1_,
                                              sizeText_2_),
                                        ),
                                        Container(
                                          child: InkWell(
                                            onTap: () {
                                              functionRequestFriend(
                                                      listuser_.data["result_"]
                                                          [index]["id_"])
                                                  .then((data_) {
                                                functionFindFriend(
                                                        textEditingControllerSearch_
                                                            .text)
                                                    .then((data) {
                                                  setState(() {
                                                    listuser_ = data;
                                                  });
                                                });
                                              });
                                            },
                                            child: Custom_buttom_1_("Gửi lời mời."),
                                          ),
                                        ),
                                      ]));
                            }),
                      ),
                    ))
            ],
          ),
        ),
      ),
    );
  }
}
