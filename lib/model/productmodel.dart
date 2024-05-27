class ProductModel {
  final String title;
  final String description;
  var image;
  final String review;
  final String seller;
  final double price;

  final double rate;
  int quantity;

  ProductModel(
      {required this.title,
      required this.review,
      required this.description,
      required this.image,
      required this.price,
      required this.seller,
      required this.rate,
      required this.quantity});

  Map<String, dynamic> toMap() {
    return {
      'title': title,
      'description': description,
      'image': image,
      'review': review,
      'seller': seller,
      'price': price,
      'rate': rate,
      'quantity': quantity,
    };
  }

  factory ProductModel.fromMap(Map<String, dynamic> map) {
    return ProductModel(
      title: map['title'],
      description: map['description'],
      image: map['image'],
      review: map['review'],
      seller: map['seller'],
      price: map['price'],
      rate: map['rate'],
      quantity: map['quantity'],
    );
  }
}

// final List<ProductModel> productlist = [
//   ProductModel(
//     title: "Pepper",
//     description:
//         "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Donec massa sapien faucibus et molestie ac feugiat. In massa tempor nec feugiat nisl. Libero id faucibus nisl tincidunt.",
//     image: "images/all/wireless.png",
//     price: 120,
//     seller: "Tariqul isalm",
//     review: "(320 Reviews)",
//     rate: 4.8,
//     quantity: 1,
//   ),
//   ProductModel(
//     title: "Cardamom",
//     description:
//         "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Donec massa sapien faucibus et molestie ac feugiat. In massa tempor nec feugiat nisl. Libero id faucibus nisl tincidunt.",
//     image: "images/all/sweet.png",
//     price: 120,
//     seller: "Joy Store",
//     review: "(32 Reviews)",
//     rate: 4.5,
//     quantity: 1,
//   ),
//   ProductModel(
//     title: "Cardamom",
//     description:
//         "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Donec massa sapien faucibus et molestie ac feugiat. In massa tempor nec feugiat nisl. Libero id faucibus nisl tincidunt.",
//     image: "images/all/miband.jpg",
//     price: 55,
//     seller: "Ram Das",
//     review: "(20 Reviews)",
//     rate: 4.0,
//     quantity: 1,
//   ),
//   ProductModel(
//     title: "Cardamom",
//     description:
//         "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Donec massa sapien faucibus et molestie ac feugiat. In massa tempor nec feugiat nisl. Libero id faucibus nisl tincidunt.",
//     image: "images/all/jacket.png",
//     price: 155,
//     seller: "Jacket Store",
//     review: "(20 Reviews)",
//     rate: 5.0,
//     quantity: 1,
//   ),
//   ProductModel(
//     title: "Cardamom",
//     description:
//         "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Donec massa sapien faucibus et molestie ac feugiat. In massa tempor nec feugiat nisl. Libero id faucibus nisl tincidunt.",
//     image: "images/men fashion/watch.png",
//     price: 1000,
//     seller: "Jacket Store",
//     review: "(100 Reviews)",
//     rate: 5.0,
//     quantity: 1,
//   ),
//   ProductModel(
//     title: "bezil leaves",
//     description:
//         "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Donec massa sapien faucibus et molestie ac feugiat. In massa tempor nec feugiat nisl. Libero id faucibus nisl tincidunt.",
//     image: "images/shoes/Air Jordan.png",
//     price: 255,
//     seller: "The Seller",
//     review: "(55 Reviews)",
//     rate: 5.0,
//     quantity: 1,
//   ),
//   ProductModel(
//     title: "cinnamon",
//     description:
//         "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Donec massa sapien faucibus et molestie ac feugiat. In massa tempor nec feugiat nisl. Libero id faucibus nisl tincidunt.",
//     image: "images/beauty/perfume.png",
//     price: 155,
//     seller: "Love Seller",
//     review: "(99 Reviews)",
//     rate: 4.7,
//     quantity: 1,
//   ),
//   ProductModel(
//     title: "dry ginger",
//     description:
//         "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Donec massa sapien faucibus et molestie ac feugiat. In massa tempor nec feugiat nisl. Libero id faucibus nisl tincidunt.",
//     image: "images/jewelry/wedding ring.png",
//     price: 155,
//     seller: "I Am Seller",
//     review: "(80 Reviews)",
//     rate: 4.5,
//     quantity: 1,
//   ),
//   ProductModel(
//     title: "Cardamom",
//     description:
//         "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Donec massa sapien faucibus et molestie ac feugiat. In massa tempor nec feugiat nisl. Libero id faucibus nisl tincidunt.",
//     image: "images/women fashion/pants.png",
//     price: 155,
//     seller: "PK Store",
//     review: "(55 Reviews)",
//     rate: 5.0,
//     quantity: 1,
//   ),
// ];
