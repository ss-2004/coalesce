import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:coalesce_app/components/rounded_button.dart';
import 'package:coalesce_app/components/constants.dart';
import 'package:coalesce_app/layout.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  static const String id = "login_page";

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  bool hidePswd = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kBGColour,
      body: Padding(
        padding: const EdgeInsets.all(50.0),
        child: Center(
          child: Column(
            children: <Widget>[
              kGapFiller,
              const SizedBox.square(
                dimension: 200.0,
                child: Image(
                  image: AssetImage("resources/CoalesceLogo.png"),
                ),
              ),
              kGapFiller,
              Text(
                "Coalesce",
                style: appBranding.copyWith(fontSize: 50.0),
              ),
              kGapFiller,
              TextField(
                cursorColor: kBGColour,
                style: kInputTextStyle,
                decoration: kInputField.copyWith(
                  prefixIcon: const Icon(
                    Icons.mail_outline_rounded,
                    color: kBGColour,
                  ),
                ),
              ),
              kGapFiller,
              TextField(
                obscureText: hidePswd,
                cursorColor: kBGColour,
                style: kInputTextStyle,
                decoration: kInputField.copyWith(
                  prefixIcon: const Icon(
                    Icons.key_rounded,
                    color: kBGColour,
                  ),
                  suffixIcon: GestureDetector(
                    onTap: () {
                      if (hidePswd == false) {
                        setState(() {
                          hidePswd = true;
                        });
                      } else {
                        setState(() {
                          hidePswd = false;
                        });
                      }
                    },
                    child: Icon(
                      hidePswd
                          ? Icons.remove_red_eye_outlined
                          : Icons.remove_red_eye,
                      color: kBGColour,
                    ),
                  ),
                ),
              ),
              kGapFiller,
              // TODO add forgot
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  RoundedButton(
                    buttonCol: kTrimColour,
                    buttonTextCol: kAccentColour,
                    buttonText: "Login",
                    pressedAction: () {
                      Navigator.pushNamed(context, HomePage.id);
                    },
                  ),
                  kGapFiller,
                  RoundedButton(
                    buttonCol: kHighlightColour,
                    buttonTextCol: kFGColour,
                    buttonText: "Register",
                    pressedAction: () {},
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
