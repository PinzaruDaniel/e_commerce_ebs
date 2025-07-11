import 'package:e_commerce_ebs/view/product_view_model.dart';
import 'package:flutter/material.dart';

class ProductDetailSpecificationWidget extends StatefulWidget {
  const ProductDetailSpecificationWidget({super.key, required this.item});
  final ProductViewModel item;
  @override
  State<ProductDetailSpecificationWidget> createState() => _ProductDetailSpecificationWidgetState();
}

class _ProductDetailSpecificationWidgetState extends State<ProductDetailSpecificationWidget> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
          children: widget.item.specification.map((section){
      return Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text('${section.title}'),
          Text(section.value)
        ],
      );
      }).toList(),
      ),
    );
  }
}
