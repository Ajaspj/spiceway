import 'dart:developer';
import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:spiceway/constants/colorconstants.dart/colorconstants.dart';
import 'package:spiceway/model/productmodel.dart';

class AdddataScreen extends StatefulWidget {
  const AdddataScreen({super.key});

  @override
  State<AdddataScreen> createState() => _AdddataScreenState();
}

class _AdddataScreenState extends State<AdddataScreen> {
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
      backgroundColor: ColorConstants.primaryGreen,
      appBar: AppBar(
        backgroundColor: ColorConstants.primaryGreen,
      ),
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
                  ? Container(
                      height: 130,
                      width: 160,
                      decoration: BoxDecoration(
                        // color: ColorConstants.primaryGreen,
                        borderRadius: BorderRadius.circular(20),
                      ),
                      padding: EdgeInsets.all(10),
                      child: Image(
                        image: FileImage(File(file!.path)),
                        fit: BoxFit.cover,
                      ))
                  : Container(
                      height: 130,
                      width: 160,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                      ),
                      padding: EdgeInsets.all(10),
                      child: Icon(Icons.add_a_photo)),
            ),
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
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                  label: Text("Enter price"), border: OutlineInputBorder()),
            ),
            SizedBox(height: 10),
            TextFormField(
              controller: ratecontroller,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                  label: Text("Enter rating"), border: OutlineInputBorder()),
            ),
            SizedBox(height: 10),
            TextFormField(
              controller: quantitycontroller,
              keyboardType: TextInputType.number,
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
                      .toMap());
                },
                child: Text("add")),
          ]),
        ),
      ),
    );
  }
}
