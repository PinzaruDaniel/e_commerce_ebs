import 'package:e_commerce_ebs/general_widgets/header_title_widget.dart';
import 'package:e_commerce_ebs/presentation/home_page/widgets/all_products_widgets/all_products_item_widget.dart';
import 'package:e_commerce_ebs/view/product_view_model.dart';
import 'package:flutter/material.dart';

class AllProductsListWidget extends StatefulWidget {
  const AllProductsListWidget({super.key, required this.item});
  final List<ProductViewModel> item;

  @override
  State<AllProductsListWidget> createState() => _AllProductsListWidgetState();
}

class _AllProductsListWidgetState extends State<AllProductsListWidget> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        HeaderTitleWidget(title: 'ALL PRODUCTS'),
        Container(
          height: 250,
          child: ListView.builder(
              padding: EdgeInsets.only(top: 12, left: 8),
              scrollDirection: Axis.horizontal,
              itemCount: widget.item.length,
              itemBuilder: (context, index){
                var itemProducts=widget.item[index];
                return AllProductsItemWidget(item: itemProducts);
              }),
        )
      ],
    );
  }
}