import 'package:e_commerce_ebs/view/product_view_model.dart';
import 'package:flutter/cupertino.dart';

import '../../general_widgets/header_title_widget.dart';
import '../../pages/home_page/widgets/home_products_item_widget.dart';

enum ProductType {
  newProducts('new_products'),
  saleProducts('sale_products');

  const ProductType(this.value);

  final String value;
}

extension MapTextProductType on ProductType {
  String get title {
    switch (this) {
      case ProductType.newProducts:
        return 'NEW PRODUCTS';
      case ProductType.saleProducts:
        return 'SALE PRODUCTS';
    }
  }
}

class HorizontalProductsListWidget extends StatefulWidget {
  const HorizontalProductsListWidget({super.key, required this.items, required this.type});

  final List<ProductViewModel> items;
  final ProductType type;

  @override
  State<HorizontalProductsListWidget> createState() => _HorizontalProductsListWidgetState();
}

class _HorizontalProductsListWidgetState extends State<HorizontalProductsListWidget> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        HeaderTitleWidget(title: widget.type.title),
         Container(
          height: 250,
          child:  ListView.builder(
            padding: EdgeInsets.only(top: 12, left: 8),
            scrollDirection: Axis.horizontal,
            itemCount: widget.items.length,
            itemBuilder: (context, index) {
              if (index % 2 == 0) {
                var itemProducts = widget.items[index];
                return HomeProductsItemWidget(item: itemProducts, width: 180);
              } else {
                return SizedBox.shrink();
              }
            },
          ),
        ),
      ],
    );
  }
}
//if(widget.type.title==ProductType.newProducts)