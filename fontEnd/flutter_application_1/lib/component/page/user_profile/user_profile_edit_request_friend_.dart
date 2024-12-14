import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_application_1/component/custom_state/custom_back_button_1_.dart';
import 'package:flutter_application_1/component/custom_state/custom_button_1_.dart';
import 'package:flutter_application_1/component/custom_state/custom_navbar_1_.dart';
import 'package:flutter_application_1/component/custom_state/custom_text_1_.dart';
import 'package:flutter_application_1/function/function_profile_user_.dart';
import 'package:flutter_application_1/setting/setting_varilabel_.dart';

class User_profile_edit_request_friend_ extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return User_profile_edit_request_friend_setting_();
  }
}

class User_profile_edit_request_friend_setting_
    extends State<User_profile_edit_request_friend_> {
  var requestFriendItem_;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    functionGetRequestFriend().then((data) {
      setState(() {
        requestFriendItem_ = data;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    final width_ = MediaQuery.of(context).size.width;
    final height_ = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: colorBackGround_1_,
      bottomNavigationBar: Custom_navbar_1_(3),
      body: SingleChildScrollView(
        child: Container(
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
              Expanded(
                  child: requestFriendItem_ == null
                      ? Container(
                          child: Custom_text_1_("load .........",
                              colorBackGround_2_, sizeText_3_),
                        )
                      : Container(
                          margin: EdgeInsets.only(top: 50, left: 40, right: 40),
                          child: requestFriendItem_[0] == false
                              ? Container(
                                  alignment: Alignment.center,
                                  child: Custom_text_1_(
                                      "Không có lời mời kết bạn nào.",
                                      colorBackGround_2_,
                                      sizeText_2_),
                                )
                              : Container(
                                  child: GridView.builder(
                                      gridDelegate:
                                          SliverGridDelegateWithMaxCrossAxisExtent(
                                              maxCrossAxisExtent: 500,
                                              mainAxisExtent: 50,
                                              crossAxisSpacing: 20,
                                              mainAxisSpacing: 20),
                                      itemCount: requestFriendItem_[1]
                                          .data["result_"]
                                          .length,
                                      itemBuilder: (context, index) {
                                        return Container(
                                          padding: EdgeInsets.only(
                                              left: 10, right: 10),
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
                                                        image: Image.file(File(
                                                                requestFriendItem_[1]
                                                                            .data[
                                                                        "result_"][index]
                                                                    [
                                                                    "linkImg_"]))
                                                            .image),
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
                                                    requestFriendItem_[1]
                                                            .data["result_"]
                                                        [index]["name_"],
                                                    colorBackGround_1_,
                                                    sizeText_2_),
                                              ),
                                              Container(
                                                alignment: Alignment.center,
                                                child: InkWell(
                                                    onTap: () {
                                                      functionApplyRequestFriend(
                                                              requestFriendItem_[
                                                                              1]
                                                                          .data[
                                                                      "result_"]
                                                                  [
                                                                  index]["id_"])
                                                          .then((data) {
                                                        functionGetRequestFriend()
                                                            .then((data) {
                                                          setState(() {
                                                            requestFriendItem_ =
                                                                data;
                                                          });
                                                        });
                                                      });
                                                    },
                                                    child: Container(
                                                      padding: EdgeInsets.only(
                                                          left: 10, right: 10),
                                                      decoration: BoxDecoration(
                                                          color: const Color
                                                              .fromARGB(
                                                              88, 0, 0, 0),
                                                          borderRadius:
                                                              BorderRadius.all(
                                                                  Radius
                                                                      .circular(
                                                                          10))),
                                                      child: Icon(
                                                        Icons.check,
                                                        color:
                                                            colorBackGround_2_,
                                                      ),
                                                    )),
                                              ),
                                              Container(
                                                alignment: Alignment.center,
                                                child: InkWell(
                                                    onTap: () {
                                                      functionDeleteRequestFriend(
                                                              requestFriendItem_[
                                                                              1]
                                                                          .data[
                                                                      "result_"]
                                                                  [
                                                                  index]["id_"])
                                                          .then((data) {
                                                        functionGetRequestFriend()
                                                            .then((data) {
                                                          setState(() {
                                                            requestFriendItem_ =
                                                                data;
                                                          });
                                                        });
                                                      });
                                                    },
                                                    child: Container(
                                                      padding: EdgeInsets.only(
                                                          left: 10, right: 10),
                                                      decoration: BoxDecoration(
                                                          color: const Color
                                                              .fromARGB(
                                                              88, 0, 0, 0),
                                                          borderRadius:
                                                              BorderRadius.all(
                                                                  Radius
                                                                      .circular(
                                                                          10))),
                                                      child: Icon(
                                                        Icons.close,
                                                        color:
                                                            colorBackGround_2_,
                                                      ),
                                                    )),
                                              ),
                                            ],
                                          ),
                                        );
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
