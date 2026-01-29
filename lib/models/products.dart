class Products {
  String? title;
  int? id;
  String? thumbnail;
  String? description;
  double? price;
  double? rating;
  double? discountPercentage;
  double? discountPrice;
  List numberOfReviews;
  String? brand;
  int? stock;
  String? category;
  int? weight;
  String? sku;
  String? shippingInformation;
  String? warrantyInformation;
  String? returnPolicy;
  int? minimumOrderQuantity;

  Products(
    this.title,
    this.id,
    this.thumbnail,
    this.description,
    this.price,
    this.rating,
    this.discountPercentage,
    this.discountPrice,
    this.numberOfReviews,
    this.brand,
    this.stock,
    this.category,
    this.weight,
    this.sku,
    this.shippingInformation,
    this.warrantyInformation,
    this.returnPolicy,
    this.minimumOrderQuantity,
  );

  factory Products.fromJson(Map<String, dynamic> json) {
    return Products(
      json["title"],
      json["id"],
      json["thumbnail"],
      json["description"],
      (json["price"] as num?)?.toDouble(),
      (json["rating"] as num?)?.toDouble(),
      (json["discountPercentage"] as num?)?.toDouble(),
      ((json["price"] as num? ?? 0) /
              (1.0 - ((json["discountPercentage"] as num? ?? 0) / 100)))
          .toDouble(),
      json["reviews"] ?? [],
      json["brand"],
      json["stock"],
      json["category"],
      json["weight"],
      json["sku"],
      json["shippingInformation"],
      json["warrantyInformation"],
      json["returnPolicy"],
      json["minimumOrderQuantity"],
    );
  }
}
