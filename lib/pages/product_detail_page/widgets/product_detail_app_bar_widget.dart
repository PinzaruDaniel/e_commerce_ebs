import 'package:carousel_slider/carousel_slider.dart';
import 'package:e_commerce_ebs/view/product_view_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class ProductDetailAppBarWidget extends StatefulWidget {
  const ProductDetailAppBarWidget({super.key, required this.item});

  final ProductViewModel item;

  @override
  State<ProductDetailAppBarWidget> createState() => _ProductDetailAppBarWidgetState();
}

class _ProductDetailAppBarWidgetState extends State<ProductDetailAppBarWidget> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Align(
          heightFactor: 1,
          child: CarouselSlider.builder(
            itemCount: widget.item.imageUrl.length,
            options: CarouselOptions(viewportFraction: 1, height: 300),
            itemBuilder: (BuildContext context, int itemIndex, int pageViewIndex) {
              final images = widget.item.imageUrl[itemIndex];
              return Container( width: double.infinity, child: Image.asset(images, fit: BoxFit.cover));
            },
          ),
        ),
        AppBar(
          backgroundColor: Colors.transparent,
          toolbarHeight: 80,
          actions: [IconButton(onPressed: () {}, icon: SvgPicture.asset('assets/icons/Cart icon.svg'))],
        ),
      ],
    );
  }
}
