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
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            label: "Home",
            activeIcon: const Icon(Icons.home),
            icon: IconButton(
              icon: const Icon(Icons.home_outlined),
              onPressed: () {
                Navigator.pushNamed(context, FeedPage.id);
              },
            ),
          ),
          BottomNavigationBarItem(
            label: "Search",
            activeIcon: const Icon(Icons.search_outlined),
            icon: IconButton(
              icon: const Icon(Icons.search_outlined),
              onPressed: () {
                Navigator.pushNamed(context, SearchPage.id);
              },
            ),
          ),
          BottomNavigationBarItem(
            label: "Teams",
            activeIcon: const Icon(Icons.people_rounded),
            icon: IconButton(
              icon: const Icon(Icons.people_outlined),
              onPressed: () {
                Navigator.pushNamed(context, TeamsPage.id);
              },
            ),
          ),
          BottomNavigationBarItem(
            label: "Profile",
            activeIcon: const Icon(Icons.person_2),
            icon: IconButton(
              icon: const Icon(Icons.person_2_outlined),
              onPressed: () {
                Navigator.pushNamed(context, ProfilePage.id);
              },
            ),
          ),
        ],
        onTap: navigationTapped,
        currentIndex: _page,
      ),
    );
  }
}
