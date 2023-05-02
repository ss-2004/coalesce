import 'package:coalesce_app/screens/profile_page.dart';
import 'package:coalesce_app/components/constants.dart';
import 'package:coalesce_app/screens/search_page.dart';
import 'package:coalesce_app/screens/teams_page.dart';
import 'package:coalesce_app/screens/feed_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  static const String id = "home_page";

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _page = 0;
  late PageController pageController; // for tabs animation

  @override
  void initState() {
    super.initState();
    pageController = PageController();
  }

  @override
  void dispose() {
    super.dispose();
    pageController.dispose();
  }

  void onPageChanged(int page) {
    setState(() {
      _page = page;
    });
  }

  void navigationTapped(int page) {
    //Animating Page
    pageController.jumpToPage(page);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: kBGColour,
        title: Text(
          "Coalesce",
          style: appBranding.copyWith(fontSize: 35.0),
        ),
      ),
      body: PageView(
        controller: pageController,
        onPageChanged: onPageChanged,
        children: homeScreenItems,
      ),
      bottomNavigationBar: CupertinoTabBar(
        backgroundColor: kBGColour,
        activeColor: kHighlightColour,
        inactiveColor: kFGColour,
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            label: "Home",
            activeIcon: Icon(Icons.home),
            icon: Icon(Icons.home_outlined),
          ),
          BottomNavigationBarItem(
            label: "Search",
            activeIcon: Icon(Icons.search_outlined),
            icon: Icon(Icons.search_outlined),
          ),
          BottomNavigationBarItem(
            label: "Teams",
            activeIcon: Icon(Icons.people_rounded),
            icon: Icon(Icons.people_outlined),
          ),
          BottomNavigationBarItem(
            label: "Profile",
            activeIcon: Icon(Icons.person_2),
            icon: Icon(Icons.person_2_outlined),
          ),
        ],
        onTap: navigationTapped,
        currentIndex: _page,
      ),
    );
  }
}
