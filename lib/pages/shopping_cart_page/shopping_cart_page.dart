import 'package:e_commerce_ebs/pages/shopping_cart_page/cart_controller.dart';
import 'package:e_commerce_ebs/themes/app_text_styles.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:input_quantity/input_quantity.dart';
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
      body: Column(
        children: [
          if (cartItems.isEmpty) Container(color: Colors.lightGreen),

          Expanded(
            child: Obx(()=> ListView.builder(
                physics: NeverScrollableScrollPhysics(),
                itemCount: cartItems.length,
                itemBuilder: (context, index) {
                  final item = cartItems[index];
                  return Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8),
                    child: Row(

                      children: [
                        Padding(
                          padding: const EdgeInsets.only(right: 8),
                          child: Column(
                            children: [
                              SizedBox(
                                width: 20,
                                height: 20,
                                child: Checkbox(
                                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4)),
                                  side: BorderSide(color: Colors.grey.shade300, width: 2),
                                  activeColor: AppColors.primary,
                                  value: item.isSelected,
                                  onChanged: (bool? value) {
                                    setState(() {
                                      item.isSelected = value!;
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

                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(item.title, style: AppTextsStyle.medium),
                              SizedBox(height: 4),
                              Text(
                                '${item.specification?.title} - ${item.specification?.value}',
                                style: AppTextsStyle.medium.copyWith(fontSize: 11, fontWeight: FontWeight.w400),
                              ),
                              Text(
                                '\$${item.price}',
                                style: AppTextsStyle.bold.copyWith(fontSize: 14, color: Colors.grey.shade500),
                              ),
                              SizedBox(height: 4),
                              Text(
                                'Total: \$${item.price * item.quantity}',
                                style: AppTextsStyle.bold.copyWith(fontSize: 14),
                              ),
                            ],
                          ),
                        ),
                        Spacer(),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.end,
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            InputQty.int(
                              qtyFormProps: QtyFormProps(enableTyping: false),
                              decoration: QtyDecorationProps(
                                btnColor: AppColors.primary,
                                enabledBorder: InputBorder.none,
                                isBordered: false,
                                width: 8,
                                /*plusBtn: Container( child:
                                            Icon(Icons.arrow_back_ios_new_rounded)
                                            ),*/
                                borderShape: BorderShapeBtn.roundedRect,
                              ),
                              initVal: item.quantity,
                              minVal: 1,
                              onQtyChanged: (val) {
                                print(val);

                                item.quantity = val;
                                cartController.cartItems.refresh();
                              },
                            ),
                          ],
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
