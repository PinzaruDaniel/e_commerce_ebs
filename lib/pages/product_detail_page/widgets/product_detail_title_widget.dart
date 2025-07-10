import 'package:e_commerce_ebs/themes/app_text_styles.dart';
import 'package:e_commerce_ebs/view/product_view_model.dart';
import 'package:flutter/material.dart';

class ProductDetailTitleWidget extends StatefulWidget {
  const ProductDetailTitleWidget({super.key, required this.item});

  final ProductViewModel item;

  @override
  State<ProductDetailTitleWidget> createState() => _ProductDetailTitleWidgetState();
}

class _ProductDetailTitleWidgetState extends State<ProductDetailTitleWidget> {
  @override
  Widget build(BuildContext context) {
    double discountprice = widget.item.price - (widget.item.price * (widget.item.sale / 100));
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 24.0, horizontal: 12),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(widget.item.company, style: AppTextsStyle.boldSmall),
              Text(widget.item.title, style: AppTextsStyle.bold),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 12),
          child: Row(
            children: [
              widget.item.sale == 0
                  ? Text('\$ ${widget.item.price}', style: AppTextsStyle.bold.copyWith(fontSize: 21))
                  : Row(
                      spacing: 8,
                      children: [
                        Text('\$ $discountprice', style: AppTextsStyle.bold.copyWith(fontSize: 21)),
                        Text(
                          '\$ ${widget.item.price}',
                          style: TextStyle(
                            decoration: TextDecoration.lineThrough,
                            decorationColor: Color(0xffA0A5AB),
                            color: Color(0xffA0A5AB),
                            fontSize: 12,
                            fontFamily: 'Nunito-Sans',
                          ),
                        ),
                        Container(
                          padding: EdgeInsets.symmetric(vertical: 3, horizontal: 4),
                          decoration: BoxDecoration(color: Color(0xfff8dcde), borderRadius: BorderRadius.circular(4)),
                          child: Text(
                            '${widget.item.sale}%',
                            style: AppTextsStyle.boldSmall.copyWith(color: Color(0xffcf1c0c)),
                          ),
                        ),
                      ],
                    ),
            ],
          ),
        ),
      ],
    );
  }
}
