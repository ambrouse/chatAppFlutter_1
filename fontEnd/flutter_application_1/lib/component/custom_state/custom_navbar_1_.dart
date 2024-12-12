import 'package:flutter/material.dart';

class Custom_navbar_1_ extends StatefulWidget {
  const Custom_navbar_1_({super.key});

  // var body;

  // Custom_navbar_1_(this.body);
  @override
  State<StatefulWidget> createState() {
    return Custom_navbar_1_setting_();
  }
}

class Custom_navbar_1_setting_ extends State<Custom_navbar_1_> {
  int currentPageIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: NavigationBar(
        onDestinationSelected: (int index) {
          setState(() {
            currentPageIndex = index;
          });
        },
        indicatorColor: const Color.fromARGB(255, 110, 110, 110),
        selectedIndex: currentPageIndex,
        height: 60,
        destinations: const <Widget>[
          NavigationDestination(
            selectedIcon: Icon(Icons.book),
            icon: Icon(Icons.book),
            label: 'Blog',
          ),
          NavigationDestination(
            selectedIcon: Icon(Icons.chat),
            icon: Icon(Icons.chat),
            label: 'chat',
          ),
          NavigationDestination(
            selectedIcon: Icon(Icons.home),
            icon: Icon(Icons.home_outlined),
            label: 'Home',
          ),
          NavigationDestination(
            selectedIcon: Icon(Icons.person_pin),
            icon: Icon(Icons.person_pin),
            label: 'profile',
          ),
          NavigationDestination(
            selectedIcon: Icon(Icons.search),
            icon: Icon(Icons.search),
            label: 'search',
          ),
        ],
      ),
      body: bodyNavbar_[currentPageIndex],
    );
  }
}

final bodyNavbar_ = [Container(child: const Text("data"),),
Container(child: const Text("data 2"),),
Container(child: const Text("data 2"),),
Container(child: const Text("data 2"),),
Container(child: const Text("data 2"),),

];
