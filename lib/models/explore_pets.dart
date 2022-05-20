class PetsCardType {
  static const card1 = 'card1';
  static const card2 = 'card2';
}

class PopularPets {
  String id;
  String cardType;
  String title;
  String subtitle;
  String backgroundImage;
  String backgroundImageSource;
  String review;

  PopularPets({
    required this.id,
    required this.cardType,
    required this.title,
    this.subtitle = '',
    this.backgroundImage = '',
    this.backgroundImageSource = '',
    this.review = '',
  });

  factory PopularPets.fromJson(Map<String, dynamic> json) {
    return PopularPets(
      id: json['id'] ?? '',
      cardType: json['cardType'] ?? '',
      title: json['title'] ?? '',
      subtitle: json['subtitle'] ?? '',
      backgroundImage: json['backgroundImage'] ?? '',
      backgroundImageSource: json['backgroundImageSource'] ?? '',
      review: json['review'] ?? '',
    );
  }
}
