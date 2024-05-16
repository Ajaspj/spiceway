import 'package:flutter/material.dart';
import 'package:spiceway/constants/colorconstants.dart/colorconstants.dart';
import 'package:spiceway/view/welcomescreen/welcome.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    Future.delayed(Duration(seconds: 5)).then((value) {
      Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) => Welcomescreen(),
          ));
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorConstants.primaryGreen,
      body: Center(
          child: Image.asset(
        "assets/images/spiceway-high-resolution-logo-black-transparent.png",
        scale: 5.0,
      )
          //     Text(
          //   "Spice Way... \n spice your way with spiceway ! ",
          //   style: TextStyle(
          //       fontSize: 25,
          //       fontStyle: FontStyle.italic,
          //       fontWeight: FontWeight.bold,
          //       color: ColorConstants.primaryBlack),
          // )
          ),
    );
  }
}
