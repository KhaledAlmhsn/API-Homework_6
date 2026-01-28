import 'package:flutter/material.dart';
import 'package:homework6/models/products.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

class DetailsScreen extends StatelessWidget {
  final Products selectedModel;
  const DetailsScreen({super.key, required this.selectedModel});

  @override
  Widget build(BuildContext context) {
    var screenWidth = MediaQuery.sizeOf(context).width;
    var screenHeight = MediaQuery.sizeOf(context).height;
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "DummyJSON - Products",
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
        backgroundColor: Colors.black,
        centerTitle: true,
      ),
      backgroundColor: Colors.grey,
      body: Center(
        child: Container(
          height: screenHeight,
          width: screenWidth,
          margin: EdgeInsets.fromLTRB(0, 25, 0, 40),
          padding: EdgeInsets.only(top: 10),
          decoration: BoxDecoration(
            color: Colors.black,
            border: BoxBorder.all(color: Colors.blueGrey, width: 5),
            borderRadius: BorderRadius.circular(20),
            boxShadow: [
              BoxShadow(color: Colors.blue, spreadRadius: 2, blurRadius: 20),
            ],
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: ListView(
              children: [
                Container(
                  color: Colors.white,
                  height: screenHeight * 0.15,
                  width: double.infinity,
                  child: Image.network(selectedModel.thumbnail!),
                ),
                SizedBox(height: 5),
                Text(
                  "Brand: ${selectedModel.brand}",
                  style: TextStyle(fontSize: 14, color: Colors.white),
                ),
                SizedBox(height: 10),
                Row(
                  children: [
                    Flexible(
                      child: Text(
                        "${selectedModel.title}",
                        style: TextStyle(
                          fontSize: 21,
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    SizedBox(width: 15),
                    Text(
                      "ID: ${selectedModel.id}",
                      style: TextStyle(fontSize: 12, color: Colors.white),
                    ),
                  ],
                ),
                SizedBox(height: 20),
                Text(
                  "${selectedModel.description}",
                  style: TextStyle(fontSize: 15, color: Colors.white),
                ),
                SizedBox(height: 10),
                Row(
                  children: [
                    Icon(
                      Icons.attach_money,
                      size: 16,
                      color: Colors.greenAccent,
                    ),
                    Text(
                      "${selectedModel.price}",
                      style: TextStyle(fontSize: 22, color: Colors.greenAccent),
                    ),
                    SizedBox(width: 5),
                    Text(
                      "${double.parse(selectedModel.discountPrice!.toStringAsFixed(2))}",
                      style: TextStyle(
                        decoration: TextDecoration.lineThrough,
                        color: Colors.grey,
                        fontSize: 10,
                      ),
                    ),
                    SizedBox(width: 15),
                    Container(
                      color: Colors.red,
                      height: screenHeight * 0.03,
                      width: screenWidth * 0.23,
                      child: Center(
                        child: Text(
                          "SAVE ${selectedModel.discountPercentage ?? 0}%",
                          style: TextStyle(fontSize: 15, color: Colors.white),
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 10),
                Row(
                  children: [
                    RatingBar.builder(
                      initialRating:
                          ((selectedModel.rating ?? 0) * 2).round() / 2,
                      minRating: 1,
                      direction: Axis.horizontal,
                      allowHalfRating: true,
                      itemCount: 5,
                      itemSize: 20,
                      itemBuilder: (context, _) =>
                          Icon(Icons.star, color: Colors.amber),
                      onRatingUpdate: (rating) {},
                    ),
                    SizedBox(width: 2),
                    Text(
                      "(${selectedModel.numberOfReviews.length} reviews)",
                      style: TextStyle(
                        fontSize: 12,
                        color: Colors.grey.shade600,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 15),
                Container(
                  width: double.infinity,
                  height: 2,
                  color: Colors.grey,
                ),
                SizedBox(height: 10),
                Text(
                  "Product Details",
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 7),
                Text(
                  "Category: ${selectedModel.category}",
                  style: TextStyle(fontSize: 13, color: Colors.white),
                ),
                Text(
                  "Avaliability: ${selectedModel.stock} In-stock",
                  style: TextStyle(fontSize: 13, color: Colors.white),
                ),
                Text(
                  "Weight: ${selectedModel.weight} kg",
                  style: TextStyle(fontSize: 13, color: Colors.white),
                ),
                Text(
                  "SKU: ${selectedModel.sku}",
                  style: TextStyle(fontSize: 13, color: Colors.white),
                ),
                Text(
                  "Shipping: ${selectedModel.shippingInformation}",
                  style: TextStyle(fontSize: 13, color: Colors.white),
                ),
                Text(
                  "Warranty: ${selectedModel.warrantyInformation}.",
                  style: TextStyle(fontSize: 13, color: Colors.white),
                ),
                Text(
                  "Return Policy: ${selectedModel.returnPolicy}.",
                  style: TextStyle(fontSize: 13, color: Colors.white),
                ),
                Text(
                  "Minimum Order: ${selectedModel.minimumOrderQuantity}.",
                  style: TextStyle(fontSize: 13, color: Colors.white),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
