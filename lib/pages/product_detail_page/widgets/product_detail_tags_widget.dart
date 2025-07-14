import 'package:e_commerce_ebs/themes/app_colors.dart';
import 'package:e_commerce_ebs/util/widgets/header_title_widget.dart';
import 'package:e_commerce_ebs/themes/app_text_styles.dart';
import 'package:e_commerce_ebs/view/product_view_model.dart';
import 'package:flutter/material.dart';
class ProductDetailTagsWidget extends StatelessWidget {
  const ProductDetailTagsWidget({super.key, required this.item});
  final ProductViewModel item;

  @override
  Widget build(BuildContext context) {
    return Column(
      spacing: 6,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(top:16, left: 8.0),
          child: HeaderTitleWidget(title: 'MARKS', showDivider: false)
        ),
        Padding(
          padding: const EdgeInsets.only(left: 16.0),
          child: Wrap(
            spacing: 8,
            runSpacing: 8,
            children: item.marks.map((tag){
              return Container(
                padding: EdgeInsets.symmetric(horizontal: 16, vertical: 6),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(4),
                  color: AppColors.primary,
                ),
                child: Text(tag, style: AppTextsStyle.medium.copyWith(color: Colors.white),),
              );
            }).toList(),
          ),
        ),
      ],
    );
  }
}
