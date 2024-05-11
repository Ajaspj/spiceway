import 'package:flutter/material.dart';
import 'package:spiceway/constants/colorconstants.dart/colorconstants.dart';

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        IconButton(
          style: IconButton.styleFrom(
            backgroundColor: ColorConstants.primaryGreen,
            padding: const EdgeInsets.all(15),
          ),
          onPressed: () {},
          icon: Image.asset(
            "",
            height: 20,
          ),
        ),
        IconButton(
          style: IconButton.styleFrom(
            backgroundColor: ColorConstants.primaryGreen,
            padding: const EdgeInsets.all(15),
          ),
          onPressed: () {},
          iconSize: 30,
          icon: const Icon(Icons.notifications_outlined),
        ),
      ],
    );
  }
}
