import 'package:flutter/material.dart';
import 'package:flutter_application_2/models/Products.dart';

// Basically the Shop Class Will be Data Base of the product
class Shop extends ChangeNotifier {
  // Now lets Make the list of the Products here
  List<Products> products = [
    // This is for the Product nUMBER 1
    Products(
      name: "Watches ",
      discription: "Lxurious Watches ",
      image: "assets/pic1.jpg",
      price: "RS 1212121",
    ),
    // This is For the product Number 2
    Products(
      name: "S24 ultra",
      discription: "Hay i am king of Phones",
      image: "assets/images.png",
      price: "RS232372873827",
    ),
    // This is for the Product Number 3
    Products(
      name: "Honda Civic",
      discription: "Civic Lover",
      image: "assets/WhatsApp Image 2025-08-06 at 07.25.28_96bff385.jpg",
      price: "RS 2923239232939",
    ),
    // This is for the Product Number 4
    Products(
      name: "Haval",
      discription: "Queens of Every king",
      image: "assets/WhatsApp Image 2025-08-06 at 07.25.30_c681446a.jpg",
      price: "RS depends on How Much You love me ",
    ),
    // This is for the Product Number 5
    Products(
      name: "MacBook",
      discription:
          "Best for Coders\n 8gb Ram 256 gb Storage\n Best for the Coding Lovers",
      image: "assets/3614913a0a5208cd329b929ca8a005fb.jpg",
      price: "RS 23239390293",
    ),
    // This is for the Product Number 6
    Products(
      name: "Mouse",
      discription: "Fits for Every Computer Lover",
      image: "assets/images (1).jpeg",
      price: "RS 3329",
    ),
    // This is forthe Product nUmber 7
    Products(
      name: "Pad ",
      discription: "For Every Coding Lover",
      image: "assets/srsyo_512.jpg",
      price: "RS82323",
    ),
    // This is for the Product Number 8
    Products(
      name: "LAPTOP",
      discription: "We Are offering this Specially for the Codiing Lovers",
      image: "assets/images.jpeg",
      price: "RS32328323928",
    ),
    // This is for the Product Number 9
    Products(
      name: "Coding Desk",
      discription: "Suits for every long time coding lover",
      image: "assets/technology-code-coding-computer-thumbnail.jpg",
      price: "RS3230023023",
    ),
  ];

  // This is the List of the cart items
  List<Products> cart = [];

  // Add product to cart
  void addToCart(Products product) {
    cart.add(product);
    // We have added Here the Changeable Notifier

    notifyListeners();
  }

  // Remove product from cart
  void removeFromCart(Products product) {
    cart.remove(product);
    // We have added Here the Changeable Notifier

    notifyListeners();
  }

  // Get list of products
  List<Products> getProductList() {
    return products;
  }

  // Get list of cart items
  List<Products> getCartList() {
    return cart;
  }
}
