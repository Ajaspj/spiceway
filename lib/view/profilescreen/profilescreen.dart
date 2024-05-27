import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:spiceway/admin/adminhome.dart';
import 'package:spiceway/constants/colorconstants.dart/colorconstants.dart';
import 'package:spiceway/view/loginscreen/loginscreen.dart';

class Profilescreen extends StatelessWidget {
  const Profilescreen({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: ColorConstants.primaryGreen,
      appBar: AppBar(
        backgroundColor: ColorConstants.primaryGreen,
      ),
      body: Stack(
        children: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 9, vertical: 50),
            child: Align(
              alignment: Alignment.topCenter,
              child: Card(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15),
                ),
                child: Container(
                  height: size.height * 0.4,
                  padding: EdgeInsets.symmetric(horizontal: 8, vertical: 15),
                  child: Column(
                    children: [
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 15),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Stack(
                                  children: [
                                    CircleAvatar(
                                      radius: 42,
                                      child: Icon(
                                        Icons.account_circle,
                                        size: 80,
                                      ),
                                    ),
                                    Positioned(
                                      bottom: 0,
                                      right: 0,
                                      child: Container(
                                        height: 25,
                                        width: 25,
                                        decoration: BoxDecoration(
                                          shape: BoxShape.circle,
                                          color:
                                              Color.fromARGB(255, 95, 225, 99),
                                        ),
                                        child: Icon(
                                          Icons.check,
                                          color: Colors.white,
                                          size: 20,
                                        ),
                                      ),
                                    )
                                  ],
                                ),
                                Row(
                                  children: [
                                    SizedBox(width: 8),
                                    GestureDetector(
                                      onTap: () async {
                                        await FirebaseAuth.instance.signOut();
                                        Navigator.pushAndRemoveUntil(
                                            context,
                                            MaterialPageRoute(
                                              builder: (context) =>
                                                  LoginScreen(),
                                            ),
                                            (route) => false);
                                      },
                                      child: Container(
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(20),
                                          color: ColorConstants.primaryGreen,
                                        ),
                                        padding: EdgeInsets.symmetric(
                                            vertical: 8, horizontal: 12),
                                        child: Text(
                                          "logout",
                                          style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 16,
                                            color: Colors.white,
                                          ),
                                        ),
                                      ),
                                    )
                                  ],
                                )
                              ],
                            ),
                            SizedBox(height: 10),
                            Text(
                              "Ajas pj",
                              style: TextStyle(
                                fontWeight: FontWeight.w800,
                                fontSize: 35,
                              ),
                            ),
                            Text(
                              "",
                              style: TextStyle(
                                  fontWeight: FontWeight.w800,
                                  fontSize: 16,
                                  color: Colors.black45),
                            ),
                            SizedBox(
                              height: 15,
                            ),
                            GestureDetector(
                              onTap: () async {
                                await FirebaseAuth.instance.signOut();
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => AdminHome(),
                                  ),
                                );
                              },
                              child: Container(
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(20),
                                  color: ColorConstants.primaryGreen,
                                ),
                                padding: EdgeInsets.symmetric(
                                    vertical: 8, horizontal: 12),
                                child: Text(
                                  "Add Data",
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 16,
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                      Spacer(),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
