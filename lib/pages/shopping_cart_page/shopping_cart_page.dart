import 'package:e_commerce_ebs/themes/app_text_styles.dart';
import 'package:e_commerce_ebs/view/product_view_model.dart';
import 'package:flutter/material.dart';

import '../../themes/app_colors.dart';

class ShoppingCartPage extends StatefulWidget {
  const ShoppingCartPage({super.key, this.items});
  final ProductViewModel? items;

  @override
  State<ShoppingCartPage> createState() => _ShoppingCartPageState();
}

class _ShoppingCartPageState extends State<ShoppingCartPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios_new_rounded, color: AppColors.primary, size: 20),
          onPressed: () => Navigator.pop(context),
        ),
        backgroundColor: Colors.white,
        surfaceTintColor: Colors.white,
        title: Text('Shopping Cart', style: AppTextsStyle.boldBig,),
      ),
    );
  }
}
