import 'package:flutter/material.dart';
import 'package:flutter_application_1/setting/setting_varilabel_.dart';

class Custom_navbar_1_ extends StatefulWidget {
  int currentPageIndex;
  Custom_navbar_1_(this.currentPageIndex, {super.key});

  @override
  State<StatefulWidget> createState() {
    return Custom_navbar_1_setting_();
  }
}

class Custom_navbar_1_setting_ extends State<Custom_navbar_1_> {
  @override
  Widget build(BuildContext context) {
    return NavigationBar(
      onDestinationSelected: (int index) {
        setState(() {
          Navigator.pushNamed(context, link_nav_bar_[index]);
        });
      },
      backgroundColor: const Color.fromARGB(0, 0, 0, 0),
      indicatorColor: colorBackGround_2_,
      selectedIndex: widget.currentPageIndex,
      height: 60,
      destinations: const <Widget>[
        NavigationDestination(
          selectedIcon: Icon(Icons.book),
          icon: Icon(Icons.book),
          label: '',
        ),
        NavigationDestination(
          selectedIcon: Icon(Icons.home),
          icon: Icon(Icons.home_outlined),
          label: '',
        ),
        NavigationDestination(
          selectedIcon: Icon(Icons.person_pin),
          icon: Icon(Icons.person_pin),
          label: '',
        ),
        NavigationDestination(
          selectedIcon: Icon(Icons.search),
          icon: Icon(Icons.search),
          label: '',
        ),
      ],
    );
  }
}
