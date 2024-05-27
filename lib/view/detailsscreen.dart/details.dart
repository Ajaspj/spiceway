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
                ClipRRect(
                  borderRadius: BorderRadius.circular(20),
                  child: Image.network(
                    widget.product.image,
                    height: 370,
                    width: 380,
                  ),
                )
              ],
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
