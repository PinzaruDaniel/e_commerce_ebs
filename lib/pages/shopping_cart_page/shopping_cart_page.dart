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

  List<bool?> isCheckedList = [];

  @override
  void initState() {
    super.initState();
    Get.put(CartController());

    isCheckedList = List.filled(cartController.cartItems.length, true);
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
            if (cartItems.isEmpty) Container(color: Colors.lightGreen),

            Expanded(
              child: ListView.builder(
                physics: NeverScrollableScrollPhysics(),
                itemCount: cartItems.length,
                itemBuilder: (context, index) {
                  final item = cartItems[index];
                  return Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8),
                    child: Container(color: Colors.orange,
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(top: 28.0, right: 8),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                SizedBox(
                                  width: 20,
                                  height: 20,
                                  child: Checkbox(
                                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4)),
                                    side: BorderSide(color: Colors.grey.shade300, width: 2),
                                    activeColor: AppColors.primary,
                                    value: isCheckedList[index],
                                    onChanged: (bool? value) {
                                      setState(() {
                                        isCheckedList[index] = value;
                                      });
                                    },
                                  ),
                                ),
                              ],
                            ),
                          ),

                          ClipRRect(
                            borderRadius: BorderRadiusGeometry.circular(16),
                            child: Image.asset(item.imageUrl, width: 80, height: 80, fit: BoxFit.cover),
                          ),

                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(item.title, style: AppTextsStyle.medium),
                              Text('\$${item.price}'),
                              Text('Total: \$ ${item.price*item.quantity}')
                            ],
                          ),
                        ],
                      ),
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
