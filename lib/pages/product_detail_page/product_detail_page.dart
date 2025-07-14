import 'package:e_commerce_ebs/pages/product_detail_page/widgets/product_detail_collapsed_app_bar_widget.dart';
import 'package:e_commerce_ebs/pages/product_detail_page/widgets/product_detail_expanded_app_bar.dart';
import 'package:e_commerce_ebs/pages/product_detail_page/widgets/product_detail_page_body_widget.dart';
import 'package:e_commerce_ebs/view/product_view_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import '../../themes/app_colors.dart';

class ProductDetailPage extends StatefulWidget {
  const ProductDetailPage({super.key, required this.item});

  final ProductViewModel item;

  @override

  State<ProductDetailPage> createState() => _ProductDetailPageState();
}

class _ProductDetailPageState extends State<ProductDetailPage> {
  late ScrollController scrollController;
  bool isCollapsed = false;

  @override
  void initState() {
    super.initState();
    scrollController = ScrollController();
    scrollController.addListener(_scrollListener);
  }

  void _scrollListener() {
    final collapsed = scrollController.hasClients &&
        scrollController.offset > (300 - 120);
    if (collapsed != isCollapsed) {
      setState(() => isCollapsed = collapsed);
    }
  }

  @override
  void dispose() {
    scrollController.removeListener(_scrollListener);
    scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        controller: scrollController,
        physics: const ClampingScrollPhysics(),
        slivers: [
          SliverAppBar(
            expandedHeight: 300,
            collapsedHeight: 60,
            pinned: true,
            centerTitle: false,
            title: AnimatedOpacity(
              opacity: isCollapsed ? 1.0 : 0.0,
              duration: const Duration(milliseconds: 1000),
              child: isCollapsed
                  ? ProductDetailCollapsedAppBarWidget(item: widget.item)
                  : const SizedBox.shrink(),
            ),
            backgroundColor: Colors.white,
            surfaceTintColor: Colors.white,
            foregroundColor: Colors.black,
            leading: IconButton(
              icon: const Icon(Icons.arrow_back_ios_new_rounded, color: Color(0xff003bd1), size: 20),
              onPressed: () => Navigator.pop(context),
            ),
            actions: [
              IconButton(
                onPressed: () {},
                icon: SvgPicture.asset('assets/icons/Cart icon.svg'),
              )
            ],
            flexibleSpace: FlexibleSpaceBar(
              background: ProductDetailExpandedAppBar(item: widget.item),
            ),
          ),
          SliverToBoxAdapter(
            child: ConstrainedBox(
              constraints: BoxConstraints(
                minHeight: MediaQuery.of(context).size.height,
              ),
              child: Material(
                borderRadius: const BorderRadius.vertical(top: Radius.circular(15)),
                elevation: 0,
                child: ProductDetailPageBodyWidget(item: widget.item),
              ),
            ),
          ),
        ],
      ),
      bottomNavigationBar: Container(
        width: double.infinity,
        decoration: BoxDecoration(
          color: Colors.white,
          boxShadow: [BoxShadow(color: Colors.grey.shade300, spreadRadius: 1, blurRadius: 10)],
        ),
        padding: const EdgeInsets.fromLTRB(16, 8, 16, 16),
        child: TextButton(
          style: TextButton.styleFrom(
            backgroundColor: AppColors.primary,
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
            elevation: 2,
          ),
          onPressed: () {},
          child: const Text(
            'add to cart',
            style: TextStyle(color: Colors.white, fontSize: 14, fontWeight: FontWeight.bold),
          ),
        ),
      ),
    );
  }
}
