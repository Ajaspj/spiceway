import 'dart:developer';
import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';

import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:spiceway/model/productmodel.dart';

class AdminHome extends StatefulWidget {
  const AdminHome({super.key});

  @override
  State<AdminHome> createState() => _AdminHomeState();
}

class _AdminHomeState extends State<AdminHome> {
  XFile? file;
  var url;
  TextEditingController titlecontroller = TextEditingController();
  TextEditingController reviewcontroller = TextEditingController();
  TextEditingController descriptioncontroller = TextEditingController();
  TextEditingController pricecontroller = TextEditingController();
  TextEditingController sellercontroller = TextEditingController();
  TextEditingController ratecontroller = TextEditingController();
  TextEditingController quantitycontroller = TextEditingController();
  CollectionReference collectionRef =
      FirebaseFirestore.instance.collection("spices");
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: SingleChildScrollView(
          child: Column(children: [
            InkWell(
                onTap: () async {
                  file =
                      await ImagePicker().pickImage(source: ImageSource.camera);
                  setState(() {});
                  if (file != null) {
                    final storageref = FirebaseStorage.instance.ref();
                    var imageref = storageref.child("image");
                    var uploadref = imageref.child(file!.name);
                    await uploadref.putFile(File(file!.path));
                    var url = await uploadref.getDownloadURL();
                    log(url.toString());
                  }
                },
                child: file != null
                    ? CircleAvatar(
                        radius: 50,
                        backgroundImage: FileImage(File(file!.path)),
                      )
                    : CircleAvatar(
                        radius: 50,
                        child: Icon(Icons.person),
                      )),
            // InkWell(
            //   onTap: () {
            //     collectionRef.add(ProductModel(
            //       title: 'pepper',
            //       review: 'review',
            //       description: 'description',
            //       image: 'image',
            //       price: 100,
            //       seller: 'seller',
            //       rate: 10,
            //       quantity: 1,
            //     ).toMap());
            //   },
            //   child: Text("add"),
            // ),
            SizedBox(
              height: 20,
            ),
            TextFormField(
              controller: titlecontroller,
              decoration: InputDecoration(
                  label: Text("Enter title"), border: OutlineInputBorder()),
            ),
            SizedBox(height: 10),
            TextFormField(
              controller: reviewcontroller,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                  label: Text("Enter review"), border: OutlineInputBorder()),
            ),
            SizedBox(height: 10),
            TextFormField(
              controller: descriptioncontroller,
              decoration: InputDecoration(
                  label: Text("Enter description"),
                  border: OutlineInputBorder()),
            ),
            SizedBox(height: 10),
            TextFormField(
              controller: sellercontroller,
              decoration: InputDecoration(
                  label: Text("Enter seller"), border: OutlineInputBorder()),
            ),
            SizedBox(height: 10),
            TextFormField(
              controller: pricecontroller,
              decoration: InputDecoration(
                  label: Text("Enter price"), border: OutlineInputBorder()),
            ),
            SizedBox(height: 10),
            TextFormField(
              controller: ratecontroller,
              decoration: InputDecoration(
                  label: Text("Enter rating"), border: OutlineInputBorder()),
            ),
            SizedBox(height: 10),
            TextFormField(
              controller: quantitycontroller,
              decoration: InputDecoration(
                  label: Text("Enter quantity"), border: OutlineInputBorder()),
            ),
            SizedBox(height: 10),
            ElevatedButton(
                onPressed: () {
                  collectionRef.add(ProductModel(
                              title: titlecontroller.text,
                              review: reviewcontroller.text,
                              description: descriptioncontroller.text,
                              image: url.toString(),
                              price: double.parse(pricecontroller.text),
                              seller: sellercontroller.text,
                              rate: double.parse(ratecontroller.text),
                              quantity: int.parse(quantitycontroller.text))
                          .toMap()
                      //   {
                      //   "title": titlecontroller.text,
                      //   "review": reviewcontroller.text,
                      // }
                      );
                },
                child: Text("add")),
          ]),
        ),
      ),
    );
  }
}
