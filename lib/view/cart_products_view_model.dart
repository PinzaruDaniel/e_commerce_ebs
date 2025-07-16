class CartItem {
  final int id;
  final String title;
  final String imageUrl;
  final int price;
  int quantity;
  bool isSelected;

  CartItem({
    required this.id,
    required this.title,
    required this.imageUrl,
    required this.price,
     this.quantity=1,
    this.isSelected=true
  });
}