import 'package:flutter/material.dart';

class Custom_text_1_ extends StatefulWidget {
  String titleText_;
  double sizeText_;
  var colorText_;
  Custom_text_1_(this.titleText_, this.colorText_, this.sizeText_,{super.key});
  
  @override
  State<StatefulWidget> createState() {
    return Custom_text_1_Setting();
  }
}

class Custom_text_1_Setting extends State<Custom_text_1_> {
  @override
  Widget build(BuildContext context) {
    return Text(
      widget.titleText_,
      style: TextStyle(
        fontSize: widget.sizeText_,
        color: widget.colorText_,
      ),);
  }
}
