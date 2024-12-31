import 'package:flutter/material.dart';
import 'package:flutter_application_1/component/custom_state/custom_back_button_1_.dart';
import 'package:flutter_application_1/component/custom_state/custom_button_1_.dart';
import 'package:flutter_application_1/component/custom_state/custom_navbar_1_.dart';
import 'package:flutter_application_1/component/custom_state/custom_text_1_.dart';
import 'package:flutter_application_1/component/custom_state/custom_text_field_1_.dart';
import 'package:flutter_application_1/function/function_chat_.dart';
import 'package:flutter_application_1/function/function_profile_user_.dart';
import 'package:flutter_application_1/setting/setting_varilabel_.dart';
import 'package:web_socket_channel/web_socket_channel.dart';
import 'package:web_socket_channel/status.dart' as status;

class Chat_page_ extends StatefulWidget {
  const Chat_page_({super.key});

  @override
  State<StatefulWidget> createState() {
    return Chat_page_setting_();
  }
}

class Chat_page_setting_ extends State<Chat_page_> {
  final scrollController = ScrollController();
  var chat_;
  var idUser_;
  var webSocket_;
  var idUserFriendLocal_;
  bool checkScron_ = false;
  TextEditingController textEditingControllerChat_ = TextEditingController();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    String idUserFriend_ = ModalRoute.of(context)!.settings.arguments as String;
    final width_ = MediaQuery.of(context).size.width;
    final height_ = MediaQuery.of(context).size.height;

    if (chat_ == null) {
      functionGetChat(idUserFriend_).then((data) {
        getIdUser().then((idUser) {
          functionSendMessWebSocket().then((websocket) {
            setState(() {
              chat_ = data;
              print(chat_.data["respone_"]);
              checkScron_ = true;
              idUser_ = idUser;
              webSocket_ = websocket;
              websocket.stream.listen((message) {
                if (message != null) {
                  if (message.split(" ").length > 1) {
                    var check = message.split(" ")[0];
                    var check_ = message.split(" ")[1];
                    if ((check == idUser || check == idUserFriend_) &&
                        (check_ == idUser || check_ == idUserFriend_)) {
                      functionGetChat(idUserFriend_).then((data_2_) {
                        setState(() {
                          chat_ = data_2_;
                          checkScron_ = true;
                        });
                      });
                    }
                  }
                }
              });
            });
          });
        });
      });
    }

    if (chat_ != null && checkScron_) {
      if (chat_.data["respone_"] == 200) {
        Future.delayed(Duration(milliseconds: 0), () {
          setState(() {
            scrollController.jumpTo(scrollController.position.maxScrollExtent);
            checkScron_ = false;
          });
        });
      }
    }

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
                alignment: Alignment.topLeft,
                child: InkWell(
                  onTap: () {
                    if (webSocket_ != null) {
                      Navigator.pushNamed(context, "/user/home");
                      webSocket_.sink.add("disconected");
                    }
                  },
                  child: Custom_back_button_1_(),
                ),
              ),
              Container(
                margin: EdgeInsets.only(top: 50, left: 20),
                alignment: Alignment.topLeft,
                child: InkWell(
                  onTap: () {},
                  child: Custom_buttom_1_("Hủy kết bạn."),
                ),
              ),
              Expanded(
                  child: chat_ == null
                      ? Container(
                          child: Custom_text_1_(
                              "Load ....", colorBackGround_2_, sizeText_2_),
                        )
                      : Container(
                          margin: EdgeInsets.only(top: 30),
                          child: chat_.data["respone_"] == 400
                              ? Container(
                                  child: Custom_text_1_(chat_.data["result_"],
                                      colorBackGround_2_, sizeText_2_),
                                )
                              : Center(
                                  child: SizedBox(
                                    width: (width_ / 1.1),
                                    child: ListView.builder(
                                        controller: scrollController,
                                        itemCount: chat_.data["result_"].length,
                                        itemBuilder: (context, index) {
                                          if (chat_.data["result_"][index]
                                                  ["idSend_"] ==
                                              idUser_) {
                                            return Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                Container(),
                                                Container(
                                                  margin:
                                                      EdgeInsets.only(top: 20),
                                                  width: (width_ / 1.5),
                                                  padding: EdgeInsets.only(
                                                      left: 10,
                                                      right: 10,
                                                      top: 5,
                                                      bottom: 5),
                                                  decoration: BoxDecoration(
                                                      color: colorBackGround_2_,
                                                      borderRadius:
                                                          BorderRadius.all(
                                                              Radius.circular(
                                                                  10))),
                                                  child: Custom_text_1_(
                                                      chat_.data["result_"]
                                                          [index]["mess_"],
                                                      colorBackGround_1_,
                                                      sizeText_2_),
                                                )
                                              ],
                                            );
                                          }

                                          return Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                Container(
                                                  margin:
                                                      EdgeInsets.only(top: 20),
                                                  padding: EdgeInsets.only(
                                                      left: 10,
                                                      right: 10,
                                                      top: 5,
                                                      bottom: 5),
                                                  decoration: BoxDecoration(
                                                      color: colorBackGround_2_,
                                                      borderRadius:
                                                          BorderRadius.all(
                                                              Radius.circular(
                                                                  10))),
                                                  width: (width_ / 1.5),
                                                  child: Custom_text_1_(
                                                      chat_.data["result_"]
                                                          [index]["mess_"],
                                                      colorBackGround_1_,
                                                      sizeText_2_),
                                                ),
                                                Container(),
                                              ]);
                                        }),
                                  ),
                                ),
                        )),
              Center(
                child: Container(
                  width: width_,
                  height: 60,
                  alignment: Alignment.center,
                  child: SizedBox(
                      width: (width_ / 1.1),
                      height: 30,
                      child: Row(
                        children: [
                          Expanded(
                            flex: 8,
                            child: Custom_text_field(
                                textEditingControllerChat_, "", 1),
                          ),
                          Expanded(
                              flex: 2,
                              child: InkWell(
                                onTap: () {
                                  if (textEditingControllerChat_.text
                                      .split(" ")
                                      .last
                                      .isNotEmpty) {
                                    functionSendChat(idUserFriend_,
                                            textEditingControllerChat_.text)
                                        .then((data_) {
                                      functionGetChat(idUserFriend_)
                                          .then((data) {
                                        getIdUser().then((idUser_) {
                                          setState(() {
                                            chat_ = data;
                                            checkScron_ = true;
                                            webSocket_.sink.add(
                                                "$idUser_ $idUserFriend_");
                                          });
                                          textEditingControllerChat_.text = "";
                                        });
                                      });
                                    });
                                  }
                                },
                                child: Icon(
                                  Icons.send,
                                  color: colorBackGround_2_,
                                ),
                              ))
                        ],
                      )),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
