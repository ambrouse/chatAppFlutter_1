import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_application_1/component/custom_state/custom_navbar_1_.dart';
import 'package:flutter_application_1/component/custom_state/custom_text_1_.dart';
import 'package:flutter_application_1/function/function_blog_.dart';
import 'package:flutter_application_1/setting/setting_varilabel_.dart';
import 'package:flutter_iconly/flutter_iconly.dart';

class Blog_page_ extends StatefulWidget {
  const Blog_page_({super.key});

  @override
  State<StatefulWidget> createState() {
    return Blog_page_setting_();
  }
}

class Blog_page_setting_ extends State<Blog_page_> {
  var listBlog_;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    functionGetBlog().then((data) {
      setState(() {
        listBlog_ = data;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    final width_ = MediaQuery.of(context).size.width;
    final height_ = MediaQuery.of(context).size.height;
    return Scaffold(
      bottomNavigationBar: Custom_navbar_1_(0),
      backgroundColor: colorBackGround_1_,
      body: SingleChildScrollView(
        child: SizedBox(
          width: width_,
          height: (height_ - 100),
          child: Column(
            children: [
              Container(
                margin: EdgeInsets.only(top: 30),
                child: Custom_text_1_("Bài viết trong vòng bạn bè",
                    colorBackGround_2_, sizeText_3_),
              ),
              listBlog_ == null
                  ? Container(
                      margin: EdgeInsets.only(top: 50),
                      child: Custom_text_1_(
                          "Không có bài viết nào trong vòng bạn bè.",
                          colorBackGround_2_,
                          sizeText_2_),
                    )
                  : Expanded(
                      child: Container(
                      margin: EdgeInsets.only(top: 40),
                      width: (width_ / 1.3),
                      child: ListView.builder(
                          itemCount: listBlog_.data["result_"].length,
                          itemBuilder: (context, index) {
                            return Container(
                              margin: EdgeInsets.only(top: 20),
                              decoration: BoxDecoration(
                                  color: colorBackGround_2_,
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(20))),
                              child: Column(
                                children: [
                                  Container(
                                    margin: EdgeInsets.only(top: 20),
                                    padding: EdgeInsets.only(left: 20),
                                    alignment: Alignment.topLeft,
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Row(
                                          children: [
                                            Container(
                                              width: 40,
                                              height: 40,
                                              decoration: BoxDecoration(
                                                borderRadius: BorderRadius.all(
                                                    Radius.circular(100000)),
                                                border: Border.all(
                                                    color: colorBackGround_1_),
                                                image: DecorationImage(
                                                    fit: BoxFit.cover,
                                                    image: listBlog_.data[
                                                                        "result_"]
                                                                    [index][
                                                                "linkImgUser_"] ==
                                                            "1"
                                                        ? AssetImage(
                                                            "assets/backiee-124549-landscape.jpg")
                                                        : Image.memory(base64Decode(
                                                                listBlog_.data[
                                                                            "result_"]
                                                                        [index]
                                                                    ["linkImgUser_"]))
                                                            .image),
                                              ),
                                            ),
                                            Container(
                                              padding:
                                                  EdgeInsets.only(left: 30),
                                              child: Custom_text_1_(
                                                  listBlog_.data["result_"]
                                                      [index]["nameUser_"],
                                                  colorBackGround_1_,
                                                  sizeText_2_),
                                            )
                                          ],
                                        )
                                      ],
                                    ),
                                  ),
                                  Container(
                                    margin: EdgeInsets.only(top: 20),
                                    padding: EdgeInsets.only(left: 20),
                                    alignment: Alignment.topLeft,
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Custom_text_1_(
                                            listBlog_.data["result_"][index]
                                                ["title_"],
                                            colorBackGround_1_,
                                            sizeText_2_),
                                      ],
                                    ),
                                  ),
                                  Container(
                                    margin: EdgeInsets.only(top: 20),
                                    padding: EdgeInsets.only(left: 20),
                                    alignment: Alignment.topLeft,
                                    child: Custom_text_1_(
                                        listBlog_.data["result_"][index]
                                            ["content_"],
                                        colorBackGround_1_,
                                        sizeText_2_),
                                  ),
                                  Container(
                                    margin: EdgeInsets.only(top: 30),
                                    alignment: Alignment.center,
                                    child: Container(
                                      height: ((width_ / 1.3) - 10),
                                      width: ((width_ / 1.3) - 10),
                                      decoration: BoxDecoration(
                                          image: DecorationImage(
                                              fit: BoxFit.cover,
                                              image: Image.memory(base64Decode(
                                                      listBlog_.data["result_"]
                                                              [index]
                                                          ["linkImgBlog_"]))
                                                  .image),
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(20))),
                                    ),
                                  ),
                                  Container(
                                    height: 50,
                                    padding: EdgeInsets.only(right: 20),
                                    alignment: Alignment.topLeft,
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.end,
                                          children: [
                                            InkWell(
                                              onTap: () {
                                                if (!listBlog_.data["result_"]
                                                    [index]["checkHeart_"]) {
                                                  functionCreateHeart(listBlog_
                                                              .data["result_"]
                                                          [index]["id_"])
                                                      .then((data_) {
                                                    functionGetBlog()
                                                        .then((data) {
                                                      setState(() {
                                                        listBlog_ = data;
                                                      });
                                                    });
                                                  });
                                                } else {
                                                  functionDeleteHeart(listBlog_
                                                              .data["result_"]
                                                          [index]["id_"])
                                                      .then((data_) {
                                                    functionGetBlog()
                                                        .then((data) {
                                                      setState(() {
                                                        listBlog_ = data;
                                                      });
                                                    });
                                                  });
                                                }
                                              },
                                              child: Container(
                                                  padding: EdgeInsets.only(
                                                      left: 5, right: 20),
                                                  child: listBlog_
                                                              .data["result_"]
                                                          [index]["checkHeart_"]
                                                      ? Icon(
                                                          IconlyBold.heart,
                                                          color: Colors.red,
                                                        )
                                                      : Icon(
                                                          IconlyBroken.heart)),
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
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
