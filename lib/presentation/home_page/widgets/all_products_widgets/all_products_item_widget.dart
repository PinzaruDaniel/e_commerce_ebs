import 'package:e_commerce_ebs/themes/app_text_styles.dart';
import 'package:e_commerce_ebs/view/product_view_model.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class AllProductsItemWidget extends StatefulWidget {
  const AllProductsItemWidget({super.key, required this.item});
  final ProductViewModel item;

  @override
  State<AllProductsItemWidget> createState() => _AllProductsItemWidgetState();
}

class _AllProductsItemWidgetState extends State<AllProductsItemWidget> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      focusColor: Colors.transparent,
      splashColor: Colors.transparent,
      highlightColor: Colors.transparent,
      onTap: () {},
      child: Padding(
        padding: EdgeInsets.only(left: 8, right: 8),
        child: Container(
          width: 160,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(24),
                child: Image(image: AssetImage(widget.item.imageUrl),height: 160, fit: BoxFit.cover),
              ),
              Text(widget.item.title, style: AppTextsStyle.medium,),
              Text(widget.item.company, style: AppTextsStyle.medium,),
              Text('\$ ${NumberFormat('#,##0').format(widget.item.price)}', style: AppTextsStyle.boldBig.copyWith(fontSize: 16),)

            ],
          ),
        ),
      ),
    );
  }
}