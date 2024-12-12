import 'package:flutter/material.dart';

class Custom_back_button_1_ extends StatefulWidget {
  const Custom_back_button_1_({super.key});

  @override
  State<StatefulWidget> createState() {
    return Custom_back_button_1_Setting_();
  }
}

class Custom_back_button_1_Setting_ extends State<Custom_back_button_1_> {
  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.topLeft,
      child: InkWell(
        onTap: () {},
        child: const Icon(Icons.arrow_back),
      ),
    );
  }
}
