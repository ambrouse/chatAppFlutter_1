import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_application_1/component/custom_state/custom_button_1_.dart';
import 'package:flutter_application_1/component/custom_state/custom_navbar_1_.dart';
import 'package:flutter_application_1/component/custom_state/custom_text_1_.dart';
import 'package:flutter_application_1/component/custom_state/custom_text_field_1_.dart';
import 'package:flutter_application_1/function/function_home_.dart';
import 'package:flutter_application_1/setting/setting_varilabel_.dart';

class Home_page_ extends StatefulWidget {
  const Home_page_({super.key});

  @override
  State<StatefulWidget> createState() {
    return Home_page_setting_();
  }
}

class Home_page_setting_ extends State<Home_page_> {
  TextEditingController textEditingControllerNameFriend_ =
      TextEditingController();
  var friend_;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    functionGetFriend("").then((data) {
      setState(() {
        friend_ = data;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    final width_ = MediaQuery.of(context).size.width;
    final height_ = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: colorBackGround_1_,
      bottomNavigationBar: Custom_navbar_1_(1),
      body: SingleChildScrollView(
        child: SizedBox(
          width: width_,
          height: (height_ - 100),
          child: Column(
            children: [
              Container(
                child: Custom_text_1_(
                    "Trang chủ", colorBackGround_2_, sizeText_3_),
              ),
              Container(
                height: 30,
                margin: EdgeInsets.only(top: 50),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Expanded(
                        flex: 7,
                        child: Center(
                          child: SizedBox(
                            width: (width_ / 1.6),
                            child: Custom_text_field(
                                textEditingControllerNameFriend_, "Tìm kiếm bạn bè.", 1),
                          ),
                        )),
                    Expanded(
                        flex: 3,
                        child: Center(
                          child: Container(
                            child: InkWell(
                              onTap: () {
                                functionGetFriend(
                                        textEditingControllerNameFriend_.text)
                                    .then((data) {
                                  setState(() {
                                    friend_ = data;
                                  });
                                });
                              },
                              child: Custom_buttom_1_("Tìm"),
                            ),
                          ),
                        ))
                  ],
                ),
              ),
              friend_ == null
                  ? Container(
                      alignment: Alignment.center,
                      margin: EdgeInsets.only(top: 50),
                      child: Custom_text_1_(
                          "Load ....", colorBackGround_2_, sizeText_3_),
                    )
                  : Expanded(
                      child: friend_[0] == false
                          ? Container(
                              margin: EdgeInsets.only(top: 50),
                              alignment: Alignment.center,
                              child: Custom_text_1_(
                                  friend_[1].data["result_"].toString(),
                                  colorBackGround_2_,
                                  sizeText_3_),
                            )
                          : Container(
                              margin: EdgeInsets.only(top: 50),
                              padding: EdgeInsets.only(left: 40, right: 40),
                              child: GridView.builder(
                                  gridDelegate:
                                      SliverGridDelegateWithMaxCrossAxisExtent(
                                          maxCrossAxisExtent: 500,
                                          mainAxisExtent: 50,
                                          crossAxisSpacing: 20,
                                          mainAxisSpacing: 20),
                                  itemCount: friend_[1].data["result_"].length,
                                  itemBuilder: (context, index) {
                                    return InkWell(
                                      onTap: () {
                                        Navigator.pushNamed(
                                            context, "/user/chat",
                                            arguments:
                                                friend_[1].data["result_"]
                                                    [index]["idUserfriend_"]);
                                      },
                                      child: Container(
                                          padding: EdgeInsets.only(
                                              left: 10, right: 10),
                                          decoration: BoxDecoration(
                                              color: colorBackGround_2_,
                                              borderRadius: BorderRadius.all(
                                                  Radius.circular(100000))),
                                          child: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                Container(
                                                  width: 40,
                                                  height: 40,
                                                  decoration: BoxDecoration(
                                                      image: DecorationImage(
                                                          fit: BoxFit.cover,
                                                          image: friend_[1].data["result_"][index]["linkImgFriend_"]=="1"?
                                                          AssetImage("assets/backiee-124549-landscape.jpg")
                                                          :Image.memory(base64Decode(friend_[1].data["result_"][index]["linkImgFriend_"])).image),
                                                      borderRadius:
                                                          BorderRadius.all(
                                                        Radius.circular(100000),
                                                      ),
                                                      border: Border.all(
                                                          color:
                                                              colorBackGround_1_,
                                                          width: 1)),
                                                ),
                                                Container(
                                                  child: Custom_text_1_(
                                                      friend_[1].data["result_"]
                                                              [index]
                                                          ["nameFriend_"],
                                                      colorBackGround_1_,
                                                      sizeText_2_),
                                                ),
                                              ])),
                                    );
                                  }),
                            ))
            ],
          ),
        ),
      ),
    );
  }
}
