import 'package:comarkter/const.dart';
import 'package:comarkter/screens/homeScreens/homePage.dart';
import 'package:comarkter/screens/homeScreens/offers.dart';
import 'package:comarkter/screens/homeScreens/profile.dart';
import 'package:comarkter/screens/material/abbBar.dart';
import 'package:flutter/material.dart';
import 'package:line_icons/line_icons.dart';
import 'package:convex_bottom_bar/convex_bottom_bar.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> with SingleTickerProviderStateMixin {
  PageController _pageController = PageController(initialPage: 0);

  int index = 0;
  @override
  Widget build(BuildContext context) {
    return Container(
        child: MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
          body: PageView(
            controller: _pageController,
            onPageChanged: (newindex) {
              setState(() {
                index = newindex;
              });
            },
            children: [
              backdop(),
              Container(),
              offers(),
              profile(),
            ],
          ),
          bottomNavigationBar: Padding(
            padding: const EdgeInsets.only(right: 10, left: 10, bottom: 13),
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                    blurRadius: 0.51,
                    color: dark,
                  ),
                ],
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: BottomNavigationBar(
                  elevation: 1,
                  items: const [
                    BottomNavigationBarItem(
                      icon: Icon(LineIcons.home),
                      label: 'Home',
                    ),
                    BottomNavigationBarItem(
                      icon: Icon(LineIcons.searchDollar),
                      label: 'finde offer',
                    ),
                    BottomNavigationBarItem(
                      icon: Icon(LineIcons.tags),
                      label: 'offers',
                    ),
                    BottomNavigationBarItem(
                      icon: Icon(LineIcons.user),
                      label: 'Profile',
                    ),
                  ],
                  currentIndex: index,
                  selectedItemColor: red,
                  unselectedItemColor: Colors.grey,
                  onTap: (index) {
                    _pageController.animateToPage(index,
                        duration: Duration(milliseconds: 50),
                        curve: Curves.ease);
                  },
                ),
              ),
            ),
          )),
    ));
  }
}
