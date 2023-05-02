import 'package:coalesce_app/components/constants.dart';
import 'package:coalesce_app/components/team_card.dart';
import 'package:flutter/material.dart';

class FeedPage extends StatefulWidget {
  const FeedPage({Key? key}) : super(key: key);

  static const String id = "feed_page";

  @override
  State<FeedPage> createState() => _FeedPageState();
}

class _FeedPageState extends State<FeedPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kAccentColour,
      body: Column(
        children: [
          TeamViewCard(
            teamName: "I124Q",
            eventName: "Webster",
            members: 2,
            teamSize: 4,
            techStack: const [
              "html5",
              "css3",
              "js",
              "typescript",
              "firebase",
              "bootstrap5"
            ],
          ),
          TeamViewCard(
            teamName: "MOE LESTER",
            eventName: "Webster",
            members: 3,
            teamSize: 4,
            techStack: const [
              "html5",
              "css3",
              "js",
              "vuejs",
              "mongodb",
              "tailwind"
            ],
          ),
        ],
      ),
    );
  }
}