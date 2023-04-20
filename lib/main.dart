import 'package:coalesce_app/screens/profile_page.dart';
import 'package:coalesce_app/screens/search_page.dart';
import 'package:coalesce_app/screens/login_page.dart';
import 'package:coalesce_app/screens/teams_page.dart';
import 'package:coalesce_app/screens/feed_page.dart';
import 'package:coalesce_app/layout.dart';
import 'package:flutter/material.dart';

void main() async {
  runApp(Coalesce());
}

class Coalesce extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: const LoginPage(),
      theme: ThemeData(
        fontFamily: "Sacramento-Regular.ttf",
      ),
      initialRoute: LoginPage.id,
      routes: {
        LoginPage.id: (context) => const LoginPage(),
        FeedPage.id: (context) => const FeedPage(),
        HomePage.id: (context) => const HomePage(),
        TeamsPage.id: (context) => const TeamsPage(),
        ProfilePage.id: (context) => const ProfilePage(),
        SearchPage.id: (context) => const SearchPage(),
      },
    );
  }
}
