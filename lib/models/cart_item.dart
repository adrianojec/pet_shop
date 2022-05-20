class CartItem {
  final String id;
  final String petImage;
  final String petName;
  final double petPrice;
  late final int quantity;
  late final double subTotal;

  CartItem({
    required this.id,
    required this.petImage,
    required this.petName,
    required this.petPrice,
    required this.quantity,
  }) : subTotal = petPrice * quantity;
}
