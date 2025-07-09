import 'package:e_commerce_ebs/general_widgets/header_title_widget.dart';
import 'package:e_commerce_ebs/view/product_view_model.dart';
import 'package:flutter/material.dart';

import 'home_products_item_widget.dart';

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
        SizedBox(
          child: GridView.builder(
            physics: NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,

                childAspectRatio: 0.85,
              //mainAxisSpacing: 32.0,
            ),
            padding: EdgeInsets.only(left: 8.0, right: 8, top: 16),
            itemCount: widget.item.length,
            itemBuilder: (context, index) {
              var itemProducts=widget.item[index];
              return HomeProductsItemWidget(item: itemProducts);
            },
          ),
        ),
      ],
    );
  }
}
/*ListView.builder(
padding: EdgeInsets.only(top: 12, left: 8),
scrollDirection: Axis.vertical,
shrinkWrap: true,
//physics: NeverScrollableScrollPhysics(),
itemCount: widget.item.length,
itemBuilder: (context, index){
var itemProducts=widget.item[index];
return HomeProductsItemWidget(item: itemProducts);
}),*/