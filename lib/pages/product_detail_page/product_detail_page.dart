
import 'package:e_commerce_ebs/pages/product_detail_page/widgets/product_detail_app_bar_widget.dart';
import 'package:e_commerce_ebs/pages/product_detail_page/widgets/product_detail_expanded_app_bar.dart';
import 'package:e_commerce_ebs/pages/product_detail_page/widgets/product_detail_page_body_widget.dart';
import 'package:e_commerce_ebs/pages/product_detail_page/widgets/product_detail_price_widget.dart';
import 'package:e_commerce_ebs/pages/product_detail_page/widgets/product_detail_tags_widget.dart';
import 'package:e_commerce_ebs/pages/product_detail_page/widgets/product_detail_title_widget.dart';
import 'package:e_commerce_ebs/view/product_view_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

class ProductDetailPage extends HookWidget {
  const ProductDetailPage({super.key, required this.item});

  final ProductViewModel item;

  @override
  Widget build(BuildContext context) {
    const collapseBarHeight = 60.00;
    const expandedBarHeight = 300.00;

    final scrollController = useScrollController();
    final isCollapsed = useState(false);
    final didAddFeedback = useState(false);

    return NotificationListener<ScrollNotification>(
      onNotification: (notification) {
        isCollapsed.value =
            scrollController.hasClients && scrollController.offset > (expandedBarHeight - 120);
        if (isCollapsed.value && !didAddFeedback.value) {
          HapticFeedback.lightImpact();
          didAddFeedback.value = true;
        } else if (!isCollapsed.value) {
          didAddFeedback.value = false;
        }
        return false;
      },
      child: CustomScrollView(
        controller: scrollController,
        slivers: <Widget>[
          SliverAppBar(
            expandedHeight: expandedBarHeight,
            collapsedHeight: collapseBarHeight,
            floating: true,
            centerTitle: false,
            //pinned: true,
            title: AnimatedOpacity(
              opacity: isCollapsed.value ? 1 : 0,
              duration: Duration(milliseconds: 400),
              child: ProductDetailAppBarWidget(item: item),
            ),
            elevation: 0,
            backgroundColor: isCollapsed.value ? Colors.white : Colors.transparent,
            leading: IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: Icon(Icons.arrow_back_ios_new_rounded, color: Color(0xff003bd1), size: 20),
            ),
            flexibleSpace: FlexibleSpaceBar(

                background: ProductDetailExpandedAppBar(item: item)),
          ),


           SliverToBoxAdapter(
            child: ConstrainedBox(
              constraints: BoxConstraints(minHeight: MediaQuery.of(context).size.height),
              child: Material(
                elevation: 7,
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
    );
  }
}
