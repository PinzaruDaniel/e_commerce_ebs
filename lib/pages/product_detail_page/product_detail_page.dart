import 'package:e_commerce_ebs/pages/product_detail_page/widgets/product_detail_app_bar_widget.dart';
import 'package:e_commerce_ebs/view/product_view_model.dart';
import 'package:flutter/material.dart';

class ProductDetailPage extends StatefulWidget {
  const ProductDetailPage({super.key, required this.item});
  final ProductViewModel item;

  @override
  State<ProductDetailPage> createState() => _ProductDetailPageState();
}

class _ProductDetailPageState extends State<ProductDetailPage> {
  @override
  Widget build(BuildContext context) {
    return
        Container(
          color: Colors.white,
          child: Column(
            children: [
              ProductDetailAppBarWidget(item: widget.item,)
            ],
          ),
        );
  }
}
