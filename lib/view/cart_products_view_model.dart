import 'package:e_commerce_ebs/view/product_view_model.dart';

class CartItem {
  final int id;
  final String title;
  final String imageUrl;
  final int price;
  final Specification? specification;
  int quantity;
  bool isSelected;

  CartItem({
    required this.id,
    required this.title,
    required this.imageUrl,
    required this.price,
    required this.specification,
    this.quantity = 1,
    this.isSelected = true,
  });
}
