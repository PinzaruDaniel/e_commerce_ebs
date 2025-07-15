import 'package:common/common.dart';
import 'package:e_commerce_ebs/pages/shopping_cart_page/shopping_cart_page.dart';
import 'package:e_commerce_ebs/util/widgets/horizontal_products_list_widget.dart';
import 'package:e_commerce_ebs/pages/home_page/widgets/home_all_products_list_widget.dart';
import 'package:e_commerce_ebs/pages/home_page/widgets/home_ad_banner_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'home_controller.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  HomeController get homeController=>Get.find();

  @override
  void initState(){
    super.initState();
    Get.put(HomeController());
    homeController.initProduct();
    homeController.getNewProducts();
    homeController.getSaleProducts();
    testFunction();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        shape: Border(bottom: BorderSide(color: Colors.black12)),
        backgroundColor: Colors.white,
        surfaceTintColor: Colors.white,
        actions: [
          Image.asset('assets/icons/icon.png'),
          Spacer(),
          IconButton(onPressed: () {}, icon: SvgPicture.asset('assets/icons/filters.svg')),
          IconButton(onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => ShoppingCartPage()),
            );
          }, icon: SvgPicture.asset('assets/icons/Cart icon.svg')),
        ],
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              HomeAdBannerWidget(),
              HorizontalProductsListWidget(items: homeController.newProducts, type: ProductType.newProducts),

              HorizontalProductsListWidget(items: homeController.saleProducts, type: ProductType.saleProducts),

              AllProductsListWidget(item: homeController.products),
            ],
          ),
        ),
      ),
    );
  }
}
