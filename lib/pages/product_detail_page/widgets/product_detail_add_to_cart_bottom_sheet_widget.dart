import 'package:e_commerce_ebs/pages/product_detail_page/widgets/product_detail_price_widget.dart';
import 'package:e_commerce_ebs/themes/app_text_styles.dart';
import 'package:e_commerce_ebs/view/product_view_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:input_quantity/input_quantity.dart';
import '../../../themes/app_colors.dart';
import '../../../util/widgets/header_title_widget.dart';

class ProductDetailAddToCartBottomSheetWidget extends StatefulWidget {
  const ProductDetailAddToCartBottomSheetWidget({super.key, required this.item});

  final ProductViewModel item;

  @override
  State<ProductDetailAddToCartBottomSheetWidget> createState() => _ProductDetailAddToCartBottomSheetWidgetState();
}

class _ProductDetailAddToCartBottomSheetWidgetState extends State<ProductDetailAddToCartBottomSheetWidget> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.only(left: 16),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(16),
                    child: Image.asset(widget.item.imageUrl[0], height: 100, width: 100, fit: BoxFit.cover),
                  ),
                ],
              ),
               Container(
                 width: 290,
                 child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 8.0, right: 8, top: 8, bottom: 4),
                        child: Row(
                          children: [
                            Expanded(
                              child: Text(
                                maxLines: 2,
                                overflow: TextOverflow.ellipsis,
                                '${widget.item.title} From ${widget.item.company}',
                                style: AppTextsStyle.bold,
                                //softWrap: true,
                              ),
                            ),
                          ],
                        ),
                      ),
                      ProductDetailPriceWidget(item: widget.item),
                    ],
                  ),
               ),
            ],
          ),
        ),
        Padding(
          padding: EdgeInsets.only(top: 30, left: 24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              HeaderTitleWidget(title: 'QUANTITY', showDivider: false),
              SizedBox(height: 12),
              InputQty(
                qtyFormProps: QtyFormProps(
                  enableTyping: false
                ),
                decoration: QtyDecorationProps(
                  border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
                  enabledBorder: InputBorder.none,
                  isBordered: false,
                  width: 8,
                  borderShape: BorderShapeBtn.roundedRect,
                ),
                initVal: 1,
                minVal: 1,
                onQtyChanged: (val) {
                  print(val);
                },
              ),
            ],
          ),
        ),

        Spacer(),
        Container(
          width: double.infinity,
          decoration: BoxDecoration(
            color: Colors.white,
            boxShadow: [BoxShadow(color: Colors.grey.shade300, blurRadius: 12)],
          ),
          padding: const EdgeInsets.only(left: 16, top: 8, right: 16, bottom: 28),
          child: TextButton(
            style: TextButton.styleFrom(
              backgroundColor: AppColors.primary,
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
              elevation: 2,
            ),
            onPressed: () {},
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SvgPicture.asset('assets/icons/Union.svg', height: 14),
                SizedBox(width: 6),
                Text(
                  'Add to cart',
                  style: TextStyle(color: Colors.white, fontSize: 14, fontWeight: FontWeight.bold),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
