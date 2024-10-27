import 'package:ecommerce_app/core/colors/myAppColors.dart';
import 'package:ecommerce_app/domain/entites/product_response_entity.dart';
import 'package:ecommerce_app/features/products_screen/add_to_cart/cubit/add_to_cart_view_model.dart';
import 'package:ecommerce_app/features/main_screen/favourite_screen/cubit/add_to_fav_view_model.dart'; // Import your fav view model
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class ProductItemWidget extends StatefulWidget {
  final ProductDataEntity productDataEntity;

  ProductItemWidget({required this.productDataEntity});

  @override
  State<ProductItemWidget> createState() => _ProductItemWidgetState();
}

class _ProductItemWidgetState extends State<ProductItemWidget> {
  bool isFavorite = false;

  void toggleFavorite() {
    setState(() {
      isFavorite = !isFavorite;
    });

    if (isFavorite) {
      AddToFavViewModel.get(context).addToFav(widget.productDataEntity.id ?? '');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 191.w,
      height: 240.h,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(25.r),
        border: Border.all(
          color: MyAppColors.strokeColor,
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(25.r),
              topRight: Radius.circular(25.r),
            ),
            child: Stack(
              children: [
                Image.network(
                  widget.productDataEntity.imageCover ?? '',
                  height: 160.h,
                  width: double.infinity,
                  fit: BoxFit.cover,
                  loadingBuilder: (context, child, progress) {
                    if (progress == null) {
                      return child;
                    } else {
                      return Center(
                        child: CircularProgressIndicator(
                          color: Theme.of(context).primaryColor,
                        ),
                      );
                    }
                  },
                  errorBuilder: (context, error, stackTrace) {
                    return Icon(
                      Icons.error,
                      color: Colors.grey,
                      size: 50.h,
                    );
                  },
                ),
                Positioned(
                  right: 10,
                  top: 10,
                  child: IconButton(
                    icon: Icon(
                      isFavorite
                          ? Icons.favorite
                          : Icons.favorite_outline_rounded,
                      color: MyAppColors.primaryColor,
                      size: 35.h,
                    ),
                    onPressed: toggleFavorite, // Use the toggle method here
                  ),
                )
              ],
            ),
          ),
          SizedBox(height: 8.h),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 8.w),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  widget.productDataEntity.title ?? 'No title available',
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: GoogleFonts.poppins(
                    textStyle: Theme.of(context).textTheme.bodyMedium,
                  ),
                ),
                SizedBox(height: 4.h),
                Text(
                  widget.productDataEntity.description ?? 'No description available',
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style: GoogleFonts.poppins(
                    textStyle: Theme.of(context).textTheme.bodySmall,
                  ),
                ),
                SizedBox(height: 4.h),
                Text(
                  'EGP ${widget.productDataEntity.price}',
                  style: GoogleFonts.poppins(
                    textStyle: Theme.of(context).textTheme.bodyMedium,
                  ),
                ),
                SizedBox(height: 4.h),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        Text(
                          'Review ${widget.productDataEntity.ratingsAverage}',
                          style: GoogleFonts.poppins(
                            textStyle: Theme.of(context).textTheme.bodySmall,
                          ),
                        ),
                        SizedBox(width: 4.w),
                        Icon(
                          Icons.star,
                          color: Colors.yellow,
                          size: 25.h,
                        ),
                      ],
                    ),
                    IconButton(
                      onPressed: () {
                        AddToCartViewModel.get(context).addToCart(widget.productDataEntity.id ?? '');
                        setState(() {});
                      },
                      icon: Icon(
                        Icons.add_circle,
                        color: MyAppColors.primaryColor,
                        size: 35.h,
                      ),
                    )
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
