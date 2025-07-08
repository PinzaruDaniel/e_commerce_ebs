import 'package:e_commerce_ebs/presentation/home_page/widgets/new_products_widgets/home_new_products_item_widget.dart';
import 'package:e_commerce_ebs/view/product_view_model.dart';
import 'package:flutter/material.dart';

class HomeNewProductsListWidget extends StatefulWidget {
  const HomeNewProductsListWidget({super.key, required this.item});
  final List<ProductViewModel> item;

  @override
  State<HomeNewProductsListWidget> createState() => _HomeNewProductsListWidgetState();
}

class _HomeNewProductsListWidgetState extends State<HomeNewProductsListWidget> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          height: 250,
          child: ListView.builder(
              padding: EdgeInsets.only(top: 12, left: 8),
              scrollDirection: Axis.horizontal,
              itemCount: widget.item.length,
              itemBuilder: (context, index){
                var itemProducts=widget.item[index];
                return HomeNewProductsItemWidget(item: itemProducts,);
              }),
        )
      ],
    );
  }
}
