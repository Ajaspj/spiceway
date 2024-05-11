import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:spiceway/constants/colorconstants.dart/colorconstants.dart';
import 'package:spiceway/controller/registrationcontroller.dart';
import 'package:spiceway/view/loginscreen/loginscreen.dart';

class RegisterationScreen extends StatefulWidget {
  const RegisterationScreen({super.key});

  @override
  State<RegisterationScreen> createState() => _RegisterationScreenState();
}

class _RegisterationScreenState extends State<RegisterationScreen> {
//  XFile?file;
  var url;
  TextEditingController nameController = TextEditingController();
  TextEditingController passwordcontroller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    var formKey = GlobalKey<FormState>();
    final providerobj = context.watch<RegistrationScreenController>();
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(color: ColorConstants.primaryGreen),
        child: Padding(
          padding: const EdgeInsets.all(15),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Form(
                  key: formKey,
                  child: Column(
                    children: [
                      Container(
                        child: Text(
                          'Registeration',
                          style: TextStyle(
                              fontSize: 40, fontWeight: FontWeight.bold),
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      TextFormField(
                        controller: nameController,
                        decoration: InputDecoration(
                            hintText: "Username",
                            labelText: "E-mail or Phone",
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(30))),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      TextFormField(
                        controller: passwordcontroller,
                        decoration: InputDecoration(
                            hintText: "Password",
                            labelText: "Password",
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(30))),
                      ),
                    ],
                  )),
              SizedBox(
                height: 20,
              ),
              providerobj.isLoading
                  ? CircularProgressIndicator()
                  : OutlinedButton(
                      onPressed: () async {
                        if (nameController.text.isNotEmpty &&
                            passwordcontroller.text.isNotEmpty) {
                          context
                              .read<RegistrationScreenController>()
                              .register(
                                  context: context,
                                  email: nameController.text,
                                  password: passwordcontroller.text)
                              .then((value) {
                            if (value == true) {
                              ScaffoldMessenger.of(context).showSnackBar(
                                  SnackBar(
                                      backgroundColor: Colors.green,
                                      content: Text("Registration Successs")));
                              Navigator.pushAndRemoveUntil(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => LoginScreen()),
                                  (route) => false);
                            } else {}
                          });
                        } else {
                          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                              backgroundColor: Colors.red,
                              content:
                                  Text("Enter a valid email and password")));
                        }
                      },
                      child: Text("Register")),
              SizedBox(height: 16),
              Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text("Already have account"),
                  TextButton(
                      onPressed: () {
                        Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                              builder: (context) => LoginScreen(),
                            ));
                      },
                      child: Text("Login now")),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
