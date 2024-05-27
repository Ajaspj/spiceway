import 'package:flutter/material.dart';
import 'package:spiceway/constants/colorconstants.dart/colorconstants.dart';
import 'package:spiceway/model/productmodel.dart';
import 'package:spiceway/view/detailsscreen.dart/widgets/addtocart.dart';
import 'package:spiceway/view/detailsscreen.dart/widgets/description.dart';
import 'package:spiceway/view/detailsscreen.dart/widgets/detailappbar.dart';
import 'package:spiceway/view/detailsscreen.dart/widgets/itemsdetails.dart';

class DetailScreen extends StatefulWidget {
  final ProductModel product;
  const DetailScreen({super.key, required this.product});

  @override
  State<DetailScreen> createState() => _DetailScreenState();
}

class _DetailScreenState extends State<DetailScreen> {
  int currentImage = 0;
  // int currentColor = 1;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorConstants.primaryGreen,
      // for add to cart , icon and quantity
      floatingActionButton: AddToCart(product: widget.product),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      body: SafeArea(
          child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // for back button share and favorite,
            DetailAppBar(
              product: widget.product,
            ),

            SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  height: 300,
                  width: 350,
                  decoration: BoxDecoration(
                    // color: ColorConstants.primaryGreen,
                    borderRadius: BorderRadius.circular(20),
                  ),
                  padding: EdgeInsets.all(10),
                  child: Image.network(
                    widget.product.image,
                    fit: BoxFit.fill,
                  ),
                ),
              ],
              // children: List.generate(
              //   5,
              //   (index) => Container(
              //     margin: EdgeInsets.only(right: 3),
              //     decoration: BoxDecoration(
              //       borderRadius: BorderRadius.circular(10),
              //       color: currentImage == index
              //           ? Colors.black
              //           : Colors.transparent,
              //       border: Border.all(
              //         color: Colors.black,
              //       ),
              //     ),
              //   ),
              // ),
            ),
            SizedBox(height: 20),
            Container(
              width: double.infinity,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topRight: Radius.circular(40),
                  topLeft: Radius.circular(40),
                ),
              ),
              padding: EdgeInsets.only(
                left: 20,
                right: 20,
                top: 20,
                bottom: 100,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // for product name, price, rating, and seller
                  ItemsDetails(product: widget.product),

                  SizedBox(height: 40),
                  // for description
                  Description(
                    description: widget.product.description,
                  )
                ],
              ),
            )
          ],
        ),
      )),
    );
  }
}
