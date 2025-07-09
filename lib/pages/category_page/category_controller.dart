import 'package:get/get.dart';

import '../../view/category_view_model.dart';

class CategoryController extends GetxController {
  RxList<CategoryViewModel> categories = RxList([]);

  void initCategory() {
    categories.value = [
      CategoryViewModel(
        title: "Electronics",
        subCategory: [
          "Headphones",
          "Audio Devices",
          "Cameras",
          "Wearables",
          "Smart Devices",
          "TV & Video",
          "Speakers",
          "Photography",
        ],
      ),
      CategoryViewModel(
        title: "Mobile Phones",
        subCategory: [
          "Android",
          "iOS",
          "Feature Phones",
          "Flagship",
          "Smartphones"
        ],
      ),
      CategoryViewModel(
          title: "Computers",
          subCategory: [
            "Laptops",
            "Desktops",
            "Gaming",
            "Accessories"
          ],
      ),
      CategoryViewModel(
        title: "Home Appliances",
        subCategory: [
          "Refrigerators",
          "Microwaves",
          "Air Conditioners",
          "Vacuum Cleaners",
          "Entertainment",
          "Kitchen"],
      ),
      CategoryViewModel(
          title:
          "Fashion",
          subCategory: [
            "Men",
            "Women",
            "Kids",
            "Accessories",
            "Sportswear"
          ],
      ),
      CategoryViewModel(
          title: "Accessories",
          subCategory: [
            "Wireless",
            "Gadgets",
            "Portable Devices"
          ],
      ),
      CategoryViewModel(
          title: "Gadgets",
          subCategory: ["Smartphones"]),
    ];
  }
}
