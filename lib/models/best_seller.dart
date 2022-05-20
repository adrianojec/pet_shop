class BestSeller {
  String id;
  String itemName;
  double itemPrice;
  String itemImage;
  String description;

  BestSeller({
    required this.id,
    required this.itemName,
    required this.itemPrice,
    required this.itemImage,
    required this.description,
  });

  factory BestSeller.fromJson(Map<String, dynamic> json) {
    return BestSeller(
      id: json['id'] ?? '',
      itemName: json['itemName'] ?? '',
      itemPrice: json['itemPrice'] ?? 0.0,
      itemImage: json['itemImage'] ?? '',
      description: json['description'] ?? '',
    );
  }
}
