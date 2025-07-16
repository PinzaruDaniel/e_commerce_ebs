import 'package:e_commerce_ebs/controllers/main_app_controller.dart';
import 'package:e_commerce_ebs/pages/product_detail_page/widgets/add_to_cart/add_to_cart_controller.dart';
import 'package:e_commerce_ebs/view/cart_products_view_model.dart';

import 'package:get/get.dart';

class CartController extends GetxController {
  RxList<CartItem> cartItems = Get.find<MainAppController>().cartItems;

}
