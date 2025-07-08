import 'package:e_commerce_ebs/general_widgets/header_title_widget.dart';
import 'package:e_commerce_ebs/presentation/home_page/widgets/sale_products_widget/sale_products_products_item_widget.dart';
import 'package:e_commerce_ebs/view/product_view_model.dart';
import 'package:flutter/material.dart';

class SaleProductsListWidget extends StatefulWidget {
  const SaleProductsListWidget({super.key, required this.products});
  final List<ProductViewModel> products;

  @override
  State<SaleProductsListWidget> createState() => _SaleProductsListWidgetState();
}

class _SaleProductsListWidgetState extends State<SaleProductsListWidget> {
  @override
  Widget build(BuildContext context) {
    final discountedProducts = widget.products.where((p) => p.sale != 0).toList();

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        HeaderTitleWidget(title: 'SALE PRODUCTS'),
        Container(
          height: 250,
          child: ListView.builder(
            padding: const EdgeInsets.only(top: 12, left: 8),
            scrollDirection: Axis.horizontal,
            itemCount: discountedProducts.length,
            itemBuilder: (context, index) {
              final product = discountedProducts[index];
              return SaleProductsProductsItemWidget(item: product);
            },
          ),
        ),
      ],
    );
  }
}