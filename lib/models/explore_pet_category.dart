class PetCategory {
  String id;
  String petImage;
  String petName;
  String lifeSpan;
  double petPrice;
  String source;
  String temperament;

  PetCategory({
    required this.id,
    required this.petImage,
    required this.petName,
    required this.lifeSpan,
    required this.petPrice,
    required this.source,
    required this.temperament,
  });

  factory PetCategory.fromJson(Map<String, dynamic> json) {
    return PetCategory(
      id: json['id'] ?? '',
      petImage: json['petImage'] ?? '',
      petName: json['petName'] ?? '',
      lifeSpan: json['lifeSpan'] ?? '',
      petPrice: json['petPrice'] ?? 0.0,
      source: json['source'] ?? '',
      temperament: json['temperament'] ?? '',
    );
  }
}
