import 'package:flutter/material.dart';
import 'package:flutter_application_1/component/custom_state/custom_text_1_.dart';
import 'package:flutter_application_1/setting/setting_varilabel_.dart';

class Custom_back_button_1_ extends StatefulWidget {
  Custom_back_button_1_({super.key});
  @override
  State<StatefulWidget> createState() {
    return Custom_back_button_1_Setting_();
  }
}

class Custom_back_button_1_Setting_ extends State<Custom_back_button_1_> {
  @override
  Widget build(BuildContext context) {
    return Icon(
      Icons.arrow_back,
      color: colorBackGround_2_,
    );
  }
}
