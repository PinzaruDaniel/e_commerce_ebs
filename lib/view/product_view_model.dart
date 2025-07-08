import 'package:e_commerce_ebs/view/category_view_model.dart';
class Specification {
  final String title;
  final String value;

  Specification({
    required this.title,
    required this.value,
  });
}
class ProductViewModel {
  final String title;
  final String company;
  final String imageUrl;
  final List<String> marks;
  final int price;
  final int sale;
  final String description;
  final List<Specification> specification;
  final List<CategoryViewModel> category;

  ProductViewModel({
    required this.title,
    required this.company,
    required this.imageUrl,
    required this.marks,
    required this.price,
    required this.sale,
    required this.description,
    required this.specification,
    required this.category,
  });
}
