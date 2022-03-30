import 'package:aikzykmh/tool/screen.dart';
import 'package:flutter/material.dart';

import 'home/home_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late int _currentIndex = 0;

  List<Widget> pages = const [
    HomePageView(),
    HomePageView(),
    HomePageView(),
    HomePageView()
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: pages[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
        selectedItemColor: Colors.deepPurpleAccent,
        selectedLabelStyle: TextStyle(fontSize: Screen.size(45),fontWeight: FontWeight.w700),
        unselectedLabelStyle: TextStyle(fontSize: Screen.size(40),fontWeight: FontWeight.w700),
        currentIndex: _currentIndex,
        type: BottomNavigationBarType.fixed,
        items: [
          BottomNavigationBarItem(
              icon: Image(
                width: Screen.width(80),
                height: Screen.height(80),
                image: const AssetImage('assets/icon/home/shouye.png'),
              ),
              label: '首页'),
          BottomNavigationBarItem(
              icon: Image(
                width: Screen.width(80),
                height: Screen.height(80),
                image: const AssetImage('assets/icon/home/fenlei.png'),
              ),
              label: '分类'),
          BottomNavigationBarItem(
              icon: Image(
                width: Screen.width(80),
                height: Screen.height(80),
                image: const AssetImage('assets/icon/home/shipin.png'),
              ),
              label: '视频'),
          BottomNavigationBarItem(
              icon: Image(
                width: Screen.width(80),
                height: Screen.height(80),
                image: const AssetImage('assets/icon/home/wode.png'),
              ),
              label: '我的'),
        ],
      ),
    );
  }
}
