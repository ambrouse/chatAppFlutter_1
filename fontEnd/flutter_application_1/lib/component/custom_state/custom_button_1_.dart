import 'package:flutter/material.dart';
import 'package:flutter_application_1/setting/setting_varilabel_.dart';

class Custom_buttom_1_ extends StatefulWidget {
  final colorBackgr_ = colorBackGround_2_;
  final colorText_ = colorText_2_;
  final colorBorder_ = colorBorder_1_;
  var textTitle_;
  var function;
  var linkNavigator_;

  Custom_buttom_1_(this.textTitle_, {super.key});

  @override
  State<StatefulWidget> createState() {
    return Custom_buttom_1_Setting_();
  }
}

class Custom_buttom_1_Setting_ extends State<Custom_buttom_1_> {
  @override
  Widget build(BuildContext context) {
    return Container(
        padding: const EdgeInsets.only(top: 5, bottom: 5, left: 20, right: 20),
        decoration: BoxDecoration(
            color: widget.colorBackgr_,
            borderRadius: const BorderRadius.all(Radius.circular(10)),
            border: Border.all(
              color: widget.colorBorder_,
              width: 1,
            )),
        child: Text(widget.textTitle_),
    );
  }
}
