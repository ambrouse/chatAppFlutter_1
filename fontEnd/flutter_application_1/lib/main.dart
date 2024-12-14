import 'package:flutter/material.dart';
import 'package:flutter_application_1/component/page/home/home_page_.dart';
import 'package:flutter_application_1/component/page/login_sigup/login_page_.dart';
import 'package:flutter_application_1/component/page/login_sigup/sigup_page_.dart';
import 'package:flutter_application_1/component/page/user_profile/user_profile_edit_blog_detail_page_.dart';
import 'package:flutter_application_1/component/page/user_profile/user_profile_edit_blog_page_.dart';
import 'package:flutter_application_1/component/page/user_profile/user_profile_edit_page_.dart';
import 'package:flutter_application_1/component/page/user_profile/user_profile_edit_request_friend_.dart';
import 'package:flutter_application_1/component/page/user_profile/user_profile_root_page_.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    TextEditingController textEditingController_ = TextEditingController();
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;

    return SafeArea(
      child: MaterialApp(
        home: Home_page_(),
        debugShowCheckedModeBanner: false,
        routes: {
          "/user/login": (context) => const Login_page_(),
          "/user/sigup": (context) => const Sigup_page_(),
          "/user/home": (context) => Home_page_(),
          "/user/user_profile_root": (context) => User_profile_root_page_(),
          "/user/user_profile_edit_info": (context) => User_profile_edit_(),
          "/user/user_profile_edit_blog": (context) => User_profile_edit_blog_page_(),
          "/user/user_profile_edit_blog_detail_": (context) => User_profile_edit_blog_detail_page_(),
          "/user/user_profile_edit_request_friend_": (context) => User_profile_edit_request_friend_(),
        },
      ),
    );
  }
}
