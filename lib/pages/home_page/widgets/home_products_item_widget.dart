import 'package:e_commerce_ebs/pages/product_detail_page/product_detail_page.dart';
import 'package:e_commerce_ebs/themes/app_text_styles.dart';
import 'package:e_commerce_ebs/view/product_view_model.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class HomeProductsItemWidget extends StatefulWidget {
  const HomeProductsItemWidget({super.key, required this.item});
  final ProductViewModel item;

  @override
  State<HomeProductsItemWidget> createState() => _HomeProductsItemWidgetState();
}

class _HomeProductsItemWidgetState extends State<HomeProductsItemWidget> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      //focusColor: Colors.transparent,
      //splashColor: Colors.transparent,
      //highlightColor: Colors.transparent,
      onTap: () {Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => const ProductDetailPage()),
      );},
      child: Padding(
        padding: EdgeInsets.only(left: 8, right: 8),
        child: SizedBox(

          width: 180,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(24),
                child: Image(
                  image: AssetImage(widget.item.imageUrl[0]),
                  height: 160,
                  width: 180,
                  fit: BoxFit.cover,
                ),
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
