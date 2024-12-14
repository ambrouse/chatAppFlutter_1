import 'package:flutter/material.dart';
import 'package:flutter_application_1/setting/setting_varilabel_.dart';

class Custom_text_field extends StatefulWidget {
  TextEditingController textEditingController_ = TextEditingController();
  String titleText_;
  int maxLine_;

  Custom_text_field(this.textEditingController_, this.titleText_,this.maxLine_, {super.key});

  @override
  State<StatefulWidget> createState() {
    return Custom_text_field_setting();
  }
}

class Custom_text_field_setting extends State<Custom_text_field> {
  @override
  Widget build(BuildContext context) {
    @override
    void dispose() {
      widget.textEditingController_.dispose();
      super.dispose();
    }

    return TextField(
      controller: widget.textEditingController_,
      style: TextStyle(color: colorText_2_),
      maxLines: 8,
      decoration: InputDecoration(
          border: const OutlineInputBorder(),
          contentPadding: const EdgeInsets.only(top: 1, bottom: 1, left: 20),
          hintText: widget.titleText_,
          hintStyle: const TextStyle(fontSize: sizeText_2_,color: colorText_2_)),
    );
  }
}
