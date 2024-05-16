import 'package:flutter/material.dart';
import 'package:introduction_screen/introduction_screen.dart';
import 'package:spiceway/constants/colorconstants.dart/colorconstants.dart';
import 'package:spiceway/view/loginscreen/loginscreen.dart';

class Welcomescreen extends StatefulWidget {
  const Welcomescreen({super.key});

  @override
  State<Welcomescreen> createState() => _WelcomescreenState();
}

class _WelcomescreenState extends State<Welcomescreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorConstants.primaryGreen,
      body: IntroductionScreen(
        scrollPhysics: BouncingScrollPhysics(),
        pages: [
          PageViewModel(
              titleWidget: Text(
                "Get started with adding some spices to your life",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 28),
              ),
              bodyWidget: Text(
                "Spicefy your inner soul with spiceway",
                style: TextStyle(fontSize: 20),
                textAlign: TextAlign.justify,
              ),
              image: Image.network(
                "https://images.alphacoders.com/110/1103539.jpg",
              )),
          PageViewModel(
              titleWidget: Text("Grab your essential spice right away..",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 28),
                  textAlign: TextAlign.left),
              bodyWidget: Text(
                "Lets add some spice ",
                style: TextStyle(fontSize: 20),
                textAlign: TextAlign.left,
              ),
              image: Image.network(
                  "https://c4.wallpaperflare.com/wallpaper/100/468/880/bowl-spices-bay-leaf-black-pepper-wallpaper-preview.jpg")),
          PageViewModel(
              titleWidget: Text("Welcome",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 28)),
              bodyWidget: Text(
                "Welcome to the world of spices",
                style: TextStyle(fontSize: 20),
                textAlign: TextAlign.left,
              ),
              image: Image.network(
                  "https://www.culinairecookingschool.com.au/wp-content/uploads/2020/01/32A0274DE229432AAB1F97096D07A011.jpg"))
        ],
        showSkipButton: true,
        skip: Text("Skip"),
        next: Icon(Icons.arrow_forward),
        done: Text("Done"),
        onDone: () {
          Navigator.pushAndRemoveUntil(
              context,
              MaterialPageRoute(
                builder: (context) => LoginScreen(),
              ),
              (route) => false);
        },
        onSkip: () {
          Navigator.pushAndRemoveUntil(
              context,
              MaterialPageRoute(
                builder: (context) => LoginScreen(),
              ),
              (route) => false);
        },
        dotsDecorator: DotsDecorator(
            size: Size.square(10),
            activeSize: Size(20, 10),
            activeShape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20))),
      ),
    );
  }
}
