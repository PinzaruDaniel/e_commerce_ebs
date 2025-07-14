import 'package:e_commerce_ebs/pages/product_detail_page/widgets/product_detail_collapsed_app_bar_widget.dart';
import 'package:e_commerce_ebs/pages/product_detail_page/widgets/product_detail_expanded_app_bar.dart';
import 'package:e_commerce_ebs/pages/product_detail_page/widgets/product_detail_page_body_widget.dart';
import 'package:e_commerce_ebs/view/product_view_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_svg/svg.dart';

import '../../themes/app_colors.dart';

class ProductDetailPage extends HookWidget {
  const ProductDetailPage({super.key, required this.item});

  final ProductViewModel item;

  @override
  Widget build(BuildContext context) {
    final scrollController = useScrollController();
    final isCollapsed = useState(true);

    return Scaffold(
      body: CustomScrollView(
        physics: ClampingScrollPhysics(),
        controller: scrollController,
        slivers: <Widget>[
          SliverAppBar(
            expandedHeight: 300,
            collapsedHeight: 60,
            centerTitle: false,
            pinned: true,
            title: AnimatedOpacity(
              opacity: isCollapsed.value ? 0 : 1,
              duration: Duration(milliseconds: 500),
              child: ProductDetailCollapsedAppBarWidget(item: item),
            ),
            surfaceTintColor: Colors.white,
            backgroundColor: Colors.white,
            foregroundColor: isCollapsed.value ? Colors.black : Colors.black,
            leading: IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: Icon(Icons.arrow_back_ios_new_rounded, color: Color(0xff003bd1), size: 20),
            ),
            actions: [IconButton(onPressed: () {}, icon: SvgPicture.asset('assets/icons/Cart icon.svg'))],
            flexibleSpace: FlexibleSpaceBar(background: ProductDetailExpandedAppBar(item: item)),
          ),

          SliverToBoxAdapter(
            child: ConstrainedBox(
              constraints: BoxConstraints(minHeight: MediaQuery.of(context).size.height),
              child: Material(
                elevation: 0,
                borderRadius: BorderRadius.only(topLeft: Radius.circular(15), topRight: Radius.circular(15)),
                child: ProductDetailPageBodyWidget(item: item),
              ),
            ),
          ),

          /*
            *  ProductDetailTitleWidget(item: widget.item),

          ProductDetailPriceWidget(item: widget.item),

          ProductDetailTagsWidget(item: widget.item),
            * */
        ],
      ),

      bottomNavigationBar: Padding(
        padding: EdgeInsets.all(0),

        child: Container(
          width: double.infinity,
          decoration: BoxDecoration(
            color: Colors.white,
            boxShadow: [BoxShadow(color: Colors.grey.shade300, spreadRadius: 1, blurRadius: 10)],
          ),
          child: Padding(
            padding: const EdgeInsets.only(left: 16.0, right: 16, bottom: 16, top: 8),
            child: TextButton(
              style: TextButton.styleFrom(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12), // Set the radius here
                ),
                backgroundColor: AppColors.primary,
                elevation: 2,
              ),
              onPressed: () {},
              child: Text(
                'add to cart',
                style: TextStyle(color: Colors.white, fontSize: 14, fontWeight: FontWeight.bold),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
