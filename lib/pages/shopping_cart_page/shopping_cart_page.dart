import 'package:e_commerce_ebs/pages/shopping_cart_page/cart_controller.dart';
import 'package:e_commerce_ebs/themes/app_text_styles.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../themes/app_colors.dart';

class ShoppingCartPage extends StatefulWidget {
  const ShoppingCartPage({super.key});

  @override
  State<ShoppingCartPage> createState() => _ShoppingCartPageState();
}

class _ShoppingCartPageState extends State<ShoppingCartPage> {
  CartController get cartController => Get.find();
  @override
  void initState() {
    super.initState();
    Get.put(CartController());
  }

  @override
  Widget build(BuildContext context) {
    final cartItems = cartController.cartItems;
    return Scaffold(
      appBar: AppBar(
        leading: Row(
          children: [
            IconButton(
              icon: const Icon(Icons.arrow_back_ios_new_rounded, color: AppColors.primary, size: 20),
              onPressed: () => Navigator.pop(context),
            ),
          ],
        ),
        backgroundColor: Colors.white,
        surfaceTintColor: Colors.white,
        title: Text('Shopping Cart', style: AppTextsStyle.boldBig),
      ),
      body: Container(

        child: Column(
          children: [
            if(cartItems.isEmpty)
              Container(color: Colors.lightGreen,),

            Expanded(
              child: ListView.builder(
                physics: NeverScrollableScrollPhysics(),
                itemCount: cartItems.length,
                itemBuilder: (context, index) {
                  final item = cartItems[index];
                  return Container(

                    color: Colors.lightGreen,
                    child: Row(
                      children: [Text(item.title)],
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),

    );
  }
}
