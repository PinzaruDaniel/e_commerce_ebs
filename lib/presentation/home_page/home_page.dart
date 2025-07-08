import 'package:e_commerce_ebs/general_widgets/header_title_widget.dart';
import 'package:e_commerce_ebs/presentation/home_page/widgets/home_ad_banner_widget.dart';
import 'package:e_commerce_ebs/presentation/home_page/widgets/new_products_widgets/home_new_products_list_widget.dart';
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
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        shape: Border(bottom: BorderSide(color: Colors.black12)),
        backgroundColor: Colors.white,
        actions: [
          IconButton(onPressed: () {}, icon: SvgPicture.asset('assets/icons/filters.svg')),
          IconButton(onPressed: () {}, icon: SvgPicture.asset('assets/icons/Cart icon.svg')),
        ],
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            HomeAdBannerWidget(),
            HeaderTitleWidget(title: 'NEW PRODUCTS'),
            HomeNewProductsListWidget(item: homeController.products.value),
          ]),
    );
  }
}
