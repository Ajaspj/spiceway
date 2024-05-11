// import 'package:flutter/material.dart';
// import 'package:spiceway/constants/colorconstants.dart/colorconstants.dart';

// class HomeScreen extends StatefulWidget {
//   const HomeScreen({super.key});

//   @override
//   State<HomeScreen> createState() => _HomeScreenState();
// }

// class _HomeScreenState extends State<HomeScreen> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Container(
//         margin: EdgeInsets.only(top: 50, left: 20.0, right: 20.0),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             Row(
//               mainAxisAlignment: MainAxisAlignment.spaceBetween,
//               children: [
//                 Text(
//                   "Hi Ajas",
//                   style: TextStyle(
//                       color: ColorConstants.primaryBlack,
//                       fontWeight: FontWeight.bold),
//                 ),
//                 Container(
//                   padding: EdgeInsets.all(3),
//                   decoration: BoxDecoration(
//                       color: ColorConstants.primaryBlack,
//                       borderRadius: BorderRadius.circular(8)),
//                   child: Icon(
//                     Icons.shopping_cart,
//                     color: ColorConstants.primarWhite,
//                   ),
//                 )
//               ],
//             ),
//             SizedBox(
//               height: 20,
//             ),
//             Text(
//               "spices",
//               style: TextStyle(
//                 fontSize: 20,
//                 color: ColorConstants.primaryBlack,
//                 fontWeight: FontWeight.bold,
//               ),
//             ),
//             Text(
//               "Discover and get great spices",
//               style:
//                   TextStyle(color: Colors.black38, fontWeight: FontWeight.bold),
//             ),
//             SizedBox(
//               height: 20,
//             ),
//             Row(
//               mainAxisAlignment: MainAxisAlignment.spaceBetween,
//               children: [
//                 GestureDetector(
//                   child: Material(
//                     elevation: 5.0,
//                     borderRadius: BorderRadius.circular(10),
//                     child: Container(
//                       padding: EdgeInsets.all(8),
//                       height: 50,
//                       width: 50,
//                       color: Colors.amber,
//                     ),
//                   ),
//                 ),
//                 GestureDetector(
//                   child: Material(
//                     elevation: 5.0,
//                     borderRadius: BorderRadius.circular(10),
//                     child: Container(
//                       padding: EdgeInsets.all(8),
//                       height: 50,
//                       width: 50,
//                       color: Colors.amber,
//                     ),
//                   ),
//                 ),
//                 Material(
//                   elevation: 5.0,
//                   borderRadius: BorderRadius.circular(10),
//                   child: Container(
//                     padding: EdgeInsets.all(8),
//                     height: 50,
//                     width: 50,
//                     color: Colors.amber,
//                   ),
//                 ),
//                 Material(
//                   elevation: 5.0,
//                   borderRadius: BorderRadius.circular(10),
//                   child: Container(
//                     padding: EdgeInsets.all(8),
//                     height: 50,
//                     width: 50,
//                     color: Colors.amber,
//                   ),
//                 ),
//               ],
//             )
//           ],
//         ),
//       ),
//     );
//   }
// }

import 'package:flutter/material.dart';
import 'package:spiceway/model/categorymodel.dart';
import 'package:spiceway/model/productmodel.dart';
import 'package:spiceway/view/homescreen/widgets/homeappbar.dart';
import 'package:spiceway/view/homescreen/widgets/imageslider.dart';
import 'package:spiceway/view/homescreen/widgets/productcart.dart';
import 'package:spiceway/view/homescreen/widgets/searchbar.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int currentSlider = 0;
  int selectedIndex = 0;
  @override
  Widget build(BuildContext context) {
    List<List<Product>> selectcategories = [
      all,
      shoes,
      beauty,
      womenFashion,
      jewelry,
      menFashion
    ];
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 35),
              // for custom appbar
              const CustomAppBar(),
              const SizedBox(height: 20),
              // for search bar
              const MySearchBAR(),
              const SizedBox(height: 20),
              ImageSlider(
                currentSlide: currentSlider,
                onChange: (value) {
                  setState(
                    () {
                      currentSlider = value;
                    },
                  );
                },
              ),
              const SizedBox(height: 20),
              // for category selection
              categoryItems(),

              const SizedBox(height: 20),
              if (selectedIndex == 0)
                const Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Special For You",
                      style: TextStyle(
                        fontSize: 25,
                        fontWeight: FontWeight.w800,
                      ),
                    ),
                    Text(
                      "See all",
                      style: TextStyle(
                        fontWeight: FontWeight.w500,
                        fontSize: 16,
                        color: Colors.black54,
                      ),
                    ),
                  ],
                ),
              // for shopping items
              const SizedBox(height: 10),
              GridView.builder(
                padding: EdgeInsets.zero,
                physics: const NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    childAspectRatio: 0.75,
                    crossAxisSpacing: 20,
                    mainAxisSpacing: 20),
                itemCount: selectcategories[selectedIndex].length,
                itemBuilder: (context, index) {
                  return ProductCard(
                    product: selectcategories[selectedIndex][index],
                  );
                },
              )
            ],
          ),
        ),
      ),
    );
  }

  SizedBox categoryItems() {
    return SizedBox(
      height: 130,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: categoriesList.length,
        physics: BouncingScrollPhysics(),
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () {
              setState(() {
                selectedIndex = index;
              });
            },
            child: Container(
              padding: const EdgeInsets.all(5),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                color: selectedIndex == index
                    ? Colors.blue[200]
                    : Colors.transparent,
              ),
              child: Column(
                children: [
                  Container(
                    height: 65,
                    width: 65,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      image: DecorationImage(
                          image: AssetImage(categoriesList[index].image),
                          fit: BoxFit.cover),
                    ),
                  ),
                  const SizedBox(height: 5),
                  Text(
                    categoriesList[index].title,
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  )
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
