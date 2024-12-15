import 'package:flutter/material.dart';
import 'package:flutter_application_1/component/custom_state/custom_back_button_1_.dart';
import 'package:flutter_application_1/component/custom_state/custom_button_1_.dart';
import 'package:flutter_application_1/component/custom_state/custom_navbar_1_.dart';
import 'package:flutter_application_1/component/custom_state/custom_text_1_.dart';
import 'package:flutter_application_1/component/custom_state/custom_text_field_1_.dart';
import 'package:flutter_application_1/function/function_chat_.dart';
import 'package:flutter_application_1/function/function_profile_user_.dart';
import 'package:flutter_application_1/setting/setting_varilabel_.dart';

class Chat_page_ extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return Chat_page_setting_();
  }
}

class Chat_page_setting_ extends State<Chat_page_> {
  ScrollController scrollController = ScrollController();
  var chat_;
  var idUser_;
  TextEditingController textEditingControllerChat_ = TextEditingController();
  // Socket socket = io(
  //     'http://localhost:3000',
  //     OptionBuilder()
  //         .setTransports(['websocket']) // for Flutter or Dart VM
  //         .disableAutoConnect() // disable auto-connection
  //         .setExtraHeaders({'foo': 'bar'}) // optional
  //         .build());

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    // conect();
  }

  // void conect() {
  //   socket.onConnect((data) => {print("object")});
  //   socket.onConnectError((data) => {print("object")});
  //   socket.onDisconnect((data) => {print("object")});
  // }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
  }

  // void setupSocket() {

  // }

  @override
  Widget build(BuildContext context) {
    String idUserFriend_ = ModalRoute.of(context)!.settings.arguments as String;
    final width_ = MediaQuery.of(context).size.width;
    final height_ = MediaQuery.of(context).size.height;

    if (chat_ == null) {
      functionGetChat(idUserFriend_).then((data) {
        getIdUser().then((idUser) {
          setState(() {
            chat_ = data;
            idUser_ = idUser;
          });
        });
      });
    }

    return Scaffold(
      backgroundColor: colorBackGround_1_,
      bottomNavigationBar: Custom_navbar_1_(1),
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
                    Navigator.pushNamed(context, "/user/home");
                  },
                  child: Custom_back_button_1_(),
                ),
              ),
              Container(
                margin: EdgeInsets.only(top: 50, left: 20),
                alignment: Alignment.topLeft,
                child: InkWell(
                  onTap: () {},
                  child: Custom_buttom_1_("textTitle_"),
                ),
              ),
              Expanded(
                  child: chat_ == null
                      ? Container(
                          child: Custom_text_1_(
                              "Load ....", colorBackGround_2_, sizeText_3_),
                        )
                      : Container(
                          margin: EdgeInsets.only(top: 30),
                          child: chat_.data["respone_"] == 400
                              ? Container(
                                  child: Custom_text_1_(chat_.data["result_"],
                                      colorBackGround_2_, sizeText_3_),
                                )
                              : ListView.builder(
                                  controller: scrollController,
                                  itemCount: chat_.data["result_"].length,
                                  itemBuilder: (context, index) {
                                    if (chat_.data["result_"][index]
                                            ["idSend_"] ==
                                        idUser_) {
                                      return Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Container(),
                                          Container(
                                            margin: EdgeInsets.only(top: 20),
                                            width: (width_ / 1.5),
                                            padding: EdgeInsets.only(
                                                left: 10,
                                                right: 10,
                                                top: 5,
                                                bottom: 5),
                                            decoration: BoxDecoration(
                                                color: colorBackGround_2_,
                                                borderRadius: BorderRadius.all(
                                                    Radius.circular(10))),
                                            child: Custom_text_1_(
                                                chat_.data["result_"][index]
                                                    ["mess_"],
                                                colorBackGround_1_,
                                                sizeText_2_),
                                          )
                                        ],
                                      );
                                    }

                                    return Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Container(
                                            margin: EdgeInsets.only(top: 20),
                                            padding: EdgeInsets.only(
                                                left: 10,
                                                right: 10,
                                                top: 5,
                                                bottom: 5),
                                            decoration: BoxDecoration(
                                                color: colorBackGround_2_,
                                                borderRadius: BorderRadius.all(
                                                    Radius.circular(10))),
                                            width: (width_ / 1.5),
                                            child: Custom_text_1_(
                                                chat_.data["result_"][index]
                                                    ["mess_"],
                                                colorBackGround_1_,
                                                sizeText_2_),
                                          ),
                                          Container(),
                                        ]);
                                  }),
                        )),
              Center(
                child: Container(
                  width: width_,
                  height: 60,
                  alignment: Alignment.center,
                  child: Container(
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
                                  if (!textEditingControllerChat_.text
                                      .split(" ")
                                      .last
                                      .isEmpty) {
                                    functionSendChat(idUserFriend_,
                                            textEditingControllerChat_.text)
                                        .then((data_) {
                                      functionGetChat(idUserFriend_)
                                          .then((data) {
                                        setState(() {
                                          chat_ = data;
                                          scrollController.animateTo(
                                            100000000000000,
                                            curve: Curves.easeOut,
                                            duration: const Duration(
                                                milliseconds: 300),
                                          );
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
