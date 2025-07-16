import 'package:e_commerce_ebs/controllers/controller_imports.dart';
import 'package:e_commerce_ebs/pages/product_detail_page/widgets/add_to_cart/add_to_cart_controller.dart';
import 'package:e_commerce_ebs/pages/product_detail_page/widgets/product_detail_price_widget.dart';
import 'package:e_commerce_ebs/pages/shopping_cart_page/cart_controller.dart';
import 'package:e_commerce_ebs/pages/shopping_cart_page/shopping_cart_page.dart';
import 'package:e_commerce_ebs/themes/app_text_styles.dart';
import 'package:e_commerce_ebs/view/cart_products_view_model.dart';
import 'package:e_commerce_ebs/view/product_view_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:input_quantity/input_quantity.dart';
import '../../../../themes/app_colors.dart';
import '../../../../util/widgets/header_title_widget.dart';
import 'package:get/get.dart';

class ProductDetailAddToCartBottomSheetWidget extends StatefulWidget {
  const ProductDetailAddToCartBottomSheetWidget({super.key, required this.item});

  final ProductViewModel item;

  @override
  State<ProductDetailAddToCartBottomSheetWidget> createState() => _ProductDetailAddToCartBottomSheetWidgetState();
}

class _ProductDetailAddToCartBottomSheetWidgetState extends State<ProductDetailAddToCartBottomSheetWidget> {
  AddToCartController get addCartController => Get.find();

  @override
  void initState() {
    super.initState();
    Get.put(AddToCartController());
    //cartController.initCartItem(widget.item);
    addCartController.initCartItem(widget.item);
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.only(left: 16),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(16),
                    child: Image.asset(widget.item.imageUrl[0], height: 100, width: 100, fit: BoxFit.cover),
                  ),
                ],
              ),
              Container(
                width: MediaQuery
                    .of(context)
                    .size
                    .width * 0.7,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: EdgeInsets.only(left: 8.0, top: 8, bottom: 4),
                      child: RichText(
                        text: TextSpan(
                          style: AppTextsStyle.bold.copyWith(color: Colors.black),
                          children: [
                            TextSpan(text: '${widget.item.title} From ${widget.item.company} '),
                            if (widget.item.sale > 0)
                              WidgetSpan(
                                alignment: PlaceholderAlignment.middle,
                                child: Container(
                                  padding: EdgeInsets.symmetric(vertical: 3, horizontal: 4),
                                  decoration: BoxDecoration(
                                    color: Color(0xfff8dcde),
                                    borderRadius: BorderRadius.circular(4),
                                  ),
                                  child: Text(
                                    '${widget.item.sale}%',
                                    style: AppTextsStyle.boldSmall.copyWith(color: Color(0xffcf1c0c)),
                                  ),
                                ),
                              ),
                          ],
                        ),
                      ),
                    ),
                    ProductDetailPriceWidget(item: widget.item, showDiscount: false),
                  ],
                ),
              ),
            ],
          ),
        ),
        Padding(
          padding: EdgeInsets.only(top: 30, left: 24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              HeaderTitleWidget(title: 'QUANTITY', showDivider: false),
              SizedBox(height: 12),
              InputQty(
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
                initVal: 1,
                minVal: 1,
                onQtyChanged: (val) {
                  print(val);
                  // cartController.cartItem.value?.quantity==val;
                  addCartController.cartItem.value?.quantity = val;

                },
              ),
            ],
          ),
        ),

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
            onPressed: () {
              // cartController.addToCart(addCartController.cartItem.value);
              addCartController.initCartItem(widget.item);
              final item = addCartController.cartItem.value;
              if (item != null) {
                mainAppController.addToCart(item);
                Navigator.push(Get.context!, MaterialPageRoute(builder: (context) => ShoppingCartPage()));
              }
              },
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
