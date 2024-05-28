import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:spiceway/controller/cartcontroller.dart';
import 'package:spiceway/controller/favcontroller.dart';
import 'package:spiceway/controller/logincontroller.dart';
import 'package:spiceway/controller/ordercontroller.dart';
import 'package:spiceway/controller/registrationcontroller.dart';
import 'package:spiceway/firebase_options.dart';

import 'package:spiceway/view/splashscreen/splashscreen.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => RegistrationScreenController(),
        ),
        ChangeNotifierProvider(
          create: (context) => LoginScreenController(),
        ),
        ChangeNotifierProvider(
          create: (context) => Cartcontroller(),
        ),
        ChangeNotifierProvider(
          create: (context) => Favoritecontroller(),
        ),
        ChangeNotifierProvider(
          create: (context) => Ordercontroller(),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: StreamBuilder(
          stream: FirebaseAuth.instance.authStateChanges(),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return SplashScreen(
                islogged: true,
              );
            } else {
              return SplashScreen(
                islogged: true,
              );
            }
          },
        ),
      ),
    );
  }
}
