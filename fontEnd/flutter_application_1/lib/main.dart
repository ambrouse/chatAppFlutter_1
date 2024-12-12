import 'package:flutter/material.dart';
import 'package:flutter_application_1/component/page/login_sigup/login_page_.dart';
import 'package:flutter_application_1/component/page/login_sigup/sigup_page_.dart';

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
        home: const Login_page_(),
        debugShowCheckedModeBanner: false,
        routes: {
          "/user/login": (context) => const Login_page_(),
          "/user/sigup": (context) => const Sigup_page_(),
        },
      ),
    );
  }
}
