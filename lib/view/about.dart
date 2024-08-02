import 'package:flutter/material.dart';
import 'package:hungrycart/app_style.dart';

class AboutPage extends StatefulWidget {
  const AboutPage({super.key});

  @override
  State<AboutPage> createState() => _AboutPage();
}

class _AboutPage extends State<AboutPage> {
  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.white,
      child: Center(
        child: Column(
          children: [
            const Image(image: AssetImage('lib/assets/hungry_cart_logo.png')),
            Container(
              margin: const EdgeInsets.fromLTRB(10, 0, 10, 0),
              alignment: Alignment.bottomLeft,
              child: Text(
                "About HungryCart",
                style: AppStyle.headerTextStyle.copyWith(color: Colors.black),
              ),
            ),
            Container(
              margin: const EdgeInsets.fromLTRB(10, 0, 10, 0),
              alignment: Alignment.bottomLeft,
              child: const Text(
                "This app is a prototype of a proposed grocery app that aimed "
                "to make grocery much more convenient. A group of students were "
                'tasked to create a "solution" to a "problem" and they came up with this.',
                style: AppStyle.textStyle,
                textAlign: TextAlign.justify,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
