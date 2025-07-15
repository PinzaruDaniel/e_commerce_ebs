import 'package:e_commerce_ebs/view/product_view_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../themes/app_colors.dart';

class ProductDetailAddToCartBottomSheetWidget extends StatefulWidget {
  const ProductDetailAddToCartBottomSheetWidget({super.key, required this.item});
  final ProductViewModel item;
  @override
  State<ProductDetailAddToCartBottomSheetWidget> createState() => _ProductDetailAddToCartBottomSheetWidgetState();
}

class _ProductDetailAddToCartBottomSheetWidgetState extends State<ProductDetailAddToCartBottomSheetWidget> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(height: 100, color: Colors.lightGreen,),
        Spacer(),
        Container(
          width: double.infinity,
          decoration: BoxDecoration(
            color: Colors.white,
            boxShadow: [BoxShadow(color: Colors.grey.shade300, blurRadius: 12)],
          ),
          padding: const EdgeInsets.only(left: 16, top: 8, right: 16, bottom: 28),
          child: TextButton(
            style: TextButton.styleFrom(
              backgroundColor: AppColors.primary,
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
              elevation: 2,
            ),
            onPressed: () {},
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SvgPicture.asset('assets/icons/Union.svg', height: 14),
                SizedBox(width: 6),
                Text(
                  'Add to cart',
                  style: TextStyle(color: Colors.white, fontSize: 14, fontWeight: FontWeight.bold),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
