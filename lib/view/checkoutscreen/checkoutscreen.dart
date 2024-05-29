import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:spiceway/constants/colorconstants.dart/colorconstants.dart';
import 'package:spiceway/view/paymentscreen/paymentscreen.dart';

class checkoutscreen extends StatefulWidget {
  const checkoutscreen({super.key});

  @override
  State<checkoutscreen> createState() => _checkoutscreenState();
}

class _checkoutscreenState extends State<checkoutscreen> {
  XFile? file;
  var url;
  TextEditingController namecontroller = TextEditingController();
  TextEditingController phonenumbercontroller = TextEditingController();
  TextEditingController addresscontroller = TextEditingController();

  CollectionReference collectionRef =
      FirebaseFirestore.instance.collection("users");
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: ColorConstants.primaryGreen,
        appBar: AppBar(
          backgroundColor: ColorConstants.primaryGreen,
        ),
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: SingleChildScrollView(
            child: Column(children: [
              SizedBox(
                height: 20,
              ),
              TextFormField(
                controller: namecontroller,
                decoration: InputDecoration(
                    label: Text("Enter your name"),
                    border: OutlineInputBorder()),
              ),
              SizedBox(height: 20),
              TextFormField(
                controller: phonenumbercontroller,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                    label: Text("Enter your phonenumber"),
                    border: OutlineInputBorder()),
              ),
              SizedBox(height: 20),
              TextFormField(
                controller: addresscontroller,
                decoration: InputDecoration(
                    label: Text("Enter your address"),
                    border: OutlineInputBorder()),
              ),
              SizedBox(height: 20),
              ElevatedButton(
                  onPressed: () {
                    collectionRef.add({
                      "name": namecontroller.text,
                      "phonenumber": phonenumbercontroller.text,
                      "address": addresscontroller.text
                    });
                  },
                  child: Text("save details")),
            ]),
          ),
        ),
        bottomSheet: payment());
  }
}
