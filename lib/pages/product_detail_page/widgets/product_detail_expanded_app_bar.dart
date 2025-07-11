import 'package:carousel_slider/carousel_slider.dart';
import 'package:e_commerce_ebs/view/product_view_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class ProductDetailExpandedAppBar extends StatefulWidget {
  const ProductDetailExpandedAppBar({super.key, required this.item});

  final ProductViewModel item;

  @override
  State<ProductDetailExpandedAppBar> createState() => _ProductDetailExpandedAppBarState();
}

class _ProductDetailExpandedAppBarState extends State<ProductDetailExpandedAppBar> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CarouselSlider.builder(
          itemCount: widget.item.imageUrl.length,
          options: CarouselOptions(viewportFraction: 1, height: 329.333),
          itemBuilder: (BuildContext context, int itemIndex, int pageViewIndex) {
            final images = widget.item.imageUrl[itemIndex];
            return SizedBox( width: double.infinity, child: Image.asset(images, fit: BoxFit.cover, ));
          },
        ),
        /*AppBar(
          backgroundColor: Colors.transparent,
          toolbarHeight: 80,
          leading: IconButton(
              onPressed: (){
                Navigator.pop(context);
              },
              icon: Icon(Icons.arrow_back_ios_new_rounded, color: Color(0xff003bd1), size: 20,)),
          actions: [IconButton(onPressed: () {}, icon: SvgPicture.asset('assets/icons/Cart icon.svg'))],
        ),*/
      ],
    );
  }
}
