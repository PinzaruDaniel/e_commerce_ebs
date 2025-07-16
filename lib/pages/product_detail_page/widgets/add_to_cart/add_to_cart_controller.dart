import 'package:get/get.dart';

import '../../../../view/cart_products_view_model.dart';
import '../../../../view/product_view_model.dart';

class AddToCartController extends GetxController{
  RxList<CartItem> cartItems = RxList([]);
  Rxn<CartItem> cartItem = Rxn();

  initCartItem(ProductViewModel item) {
    cartItem.value = CartItem(id: item.id, title: item.title, imageUrl: item.imageUrl[0], price: item.price);
    cartItem.refresh();
  }
}