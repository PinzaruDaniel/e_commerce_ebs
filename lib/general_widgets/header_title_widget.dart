import 'package:e_commerce_ebs/themes/app_colors.dart';
import 'package:e_commerce_ebs/themes/app_text_styles.dart';
import 'package:flutter/material.dart';

class HeaderTitleWidget extends StatelessWidget {
  const HeaderTitleWidget({super.key, required this.title});
  final String title;


  @override
  Widget build(BuildContext context) {
    return Padding(padding: EdgeInsets.only(top:24, bottom:8, left: 16),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(title, style: AppTextsStyle.boldSmall),
        Divider(thickness: 3, radius: BorderRadiusGeometry.circular(24), color: AppColors.secondary, endIndent:350 ,)
      ],
    ));
  }
}
