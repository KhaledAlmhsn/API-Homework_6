import 'package:flutter/material.dart';
import 'package:homework6/services/api.dart';
import 'package:homework6/screens/details_screen.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

class ProductsScreen extends StatelessWidget {
  const ProductsScreen({super.key});

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
      body: FutureBuilder(
        future: Api().getData('https://dummyjson.com/products'),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          }
          if (snapshot.hasError) {
            return Center(child: Text("${snapshot.error}"));
          }
          return ListView.builder(
            itemCount: snapshot.data?.length,
            itemBuilder: (context, index) {
              return Container(
                height: screenHeight * 0.4,
                width: screenWidth * 0.5,
                margin: EdgeInsets.fromLTRB(15, 10, 15, 10),
                padding: EdgeInsets.fromLTRB(15, 10, 15, 0),
                decoration: BoxDecoration(
                  color: Colors.black,
                  border: BoxBorder.all(color: Colors.blueGrey, width: 5),
                  borderRadius: BorderRadius.circular(20),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.blue,
                      spreadRadius: 2,
                      blurRadius: 20,
                    ),
                  ],
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          snapshot.data?[index].title ?? "null",
                          style: TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                        Text(
                          " (ID: ${snapshot.data?[index].id ?? 0})",
                          style: TextStyle(fontSize: 10, color: Colors.white),
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        RatingBar.builder(
                          initialRating:
                              ((snapshot.data?[index].rating ?? 0) * 2)
                                  .round() /
                              2,
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
                          "(${snapshot.data?[index].numberOfReviews.length} reviews)",
                          style: TextStyle(
                            fontSize: 12,
                            color: Colors.grey.shade600,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 5),
                    Image.network(
                      snapshot.data?[index].thumbnail ??
                          "https://bolma.sa/assets/images/not-found.jpg",
                      width: 100,
                      height: 100,
                    ),
                    SizedBox(height: 10),
                    Text(
                      snapshot.data?[index].description ?? "null",
                      style: TextStyle(fontSize: 13, color: Colors.white),
                    ),
                    SizedBox(height: 2.5),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "${snapshot.data?[index].discountPercentage ?? 0}% ",
                          style: TextStyle(fontSize: 13, color: Colors.green),
                        ),
                        Text(
                          "${double.parse(snapshot.data![index].discountPrice!.toStringAsFixed(2))}",
                          style: TextStyle(
                            decoration: TextDecoration.lineThrough,
                            color: Colors.blueGrey,
                            fontSize: 10,
                          ),
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.attach_money,
                          size: 16,
                          color: Colors.greenAccent,
                        ),
                        Padding(
                          padding: const EdgeInsets.only(right: 7),
                          child: Text(
                            "${snapshot.data?[index].price}",
                            style: TextStyle(
                              fontSize: 16,
                              color: Colors.greenAccent,
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 5.5),
                    SizedBox(
                      height: 25,
                      width: 100,
                      child: ElevatedButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) {
                                return DetailsScreen(
                                  selectedModel: snapshot.data![index],
                                );
                              },
                            ),
                          );
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.green,
                        ),
                        child: Center(
                          child: Text(
                            "Details",
                            style: TextStyle(
                              fontSize: 15,
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              );
            },
          );
        },
      ),
    );
  }
}
