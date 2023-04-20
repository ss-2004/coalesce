import 'package:coalesce_app/components/constants.dart';
import 'package:coalesce_app/screens/team_info_page.dart';
import 'package:flutter/material.dart';

class TeamViewCard extends StatelessWidget {
  TeamViewCard({
    required this.teamName,
    required this.eventName,
    required this.members,
    required this.teamSize,
    required this.techStack,
  });

  final String teamName;
  final String eventName;
  final int members;
  final int teamSize;
  final List<String> techStack;
  final List<Image> skillLogo = [];

  List<Image> generateSkillLogoList() {
    for (var skill in techStack) {
      skillLogo.add(
        Image(
          image: AssetImage(
            "resources/logos/$skill.png",
          ),
        ),
      );
    }
    return skillLogo;
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        Navigator.pushNamed(context, TeamInfoPage.id);
      },
      child: Container(
        margin: const EdgeInsets.all(10.0),
        decoration: BoxDecoration(
          color: kBGColour,
          borderRadius: BorderRadius.circular(12.5),
        ),
        child: Padding(
          padding: const EdgeInsets.all(12.5),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Team Name : $teamName",
                    maxLines: 2,
                    style: appRegularText,
                  ),
                  kGapFiller,
                  Text(
                    "Event Name : $eventName",
                    maxLines: 2,
                    style: appRegularText,
                  ),
                  kGapFiller,
                  Text(
                    "Team : $members/$teamSize",
                    style: appRegularText,
                  ),
                ],
              ),
              SizedBox(
                height: 125.0,
                width: 125.0,
                child: GridView(
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 3,
                    childAspectRatio: 1.0,
                    mainAxisSpacing: 0.1,
                  ),
                  children: generateSkillLogoList(),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
