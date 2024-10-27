import 'package:ecommerce_app/core/colors/myAppColors.dart';
import 'package:ecommerce_app/domain/entites/get_fav_entity.dart';
import 'package:ecommerce_app/features/main_screen/favourite_screen/cubit/get_fav_view_model.dart';
import 'package:ecommerce_app/features/main_screen/favourite_screen/cubit/remove_fav_view_model.dart';
import 'package:ecommerce_app/features/products_screen/add_to_cart/cubit/add_to_cart_view_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class FavScreenItemWidget extends StatefulWidget {
  final GetFavDataEntity dataEntity;

  FavScreenItemWidget({
    required this.dataEntity,
  });

  @override
  State<FavScreenItemWidget> createState() => _FavScreenItemWidgetState();
}

class _FavScreenItemWidgetState extends State<FavScreenItemWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(color: MyAppColors.strokeColor),
        borderRadius: BorderRadius.circular(5.r),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Container(
            clipBehavior: Clip.antiAlias,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10.r),
            ),
            child: Image.network(
              widget.dataEntity.imageCover ?? '',
              width: 120.w,
              height: 140.h,
              fit: BoxFit.cover,
              loadingBuilder: (context, child, progress) {
                return progress == null
                    ? child
                    : Center(
                  child: CircularProgressIndicator(
                    color: Theme.of(context).primaryColor,
                  ),
                );
              },
              errorBuilder: (context, error, stackTrace) {
                return Icon(
                  Icons.error,
                  color: Colors.grey,
                  size: 50.h,
                );
              },
            ),
          ),
          SizedBox(width: 5.w),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  widget.dataEntity.title ?? '',
                  style: GoogleFonts.poppins(
                    textStyle: Theme.of(context).textTheme.headlineLarge,
                  ),
                ),
                SizedBox(height: 30.h),
                Text(
                  'EGP ${widget.dataEntity.price ?? ''}',style: GoogleFonts.poppins(
                  textStyle: Theme.of(context).textTheme.headlineLarge,
                ),
                ),
              ],
            ),
          ),
          Column(
            children: [
              Padding(
                padding: EdgeInsets.only(left: 50.w, bottom: 50.h),
                child: IconButton(
                  onPressed: () {
                   RemoveFavViewModel.get(context).removeFav(widget.dataEntity.id??'',
                       onRemoved: () {
                         GetFavViewModel.get(context).getFav();
                       });
                    ;
                  },
                  icon: Icon(
                    Icons.delete_outline,
                    color: MyAppColors.primaryColor,
                    size: 35.w,
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(bottom: 5.h),
                child: InkWell(
                  onTap: (){
                    AddToCartViewModel.get(context).addToCart(widget.dataEntity.id??'');
                    setState(() {

                    });
                  },
                  child: Container(
                    width: 120.w,
                    height: 30.h,
                    decoration: BoxDecoration(
                      color: MyAppColors.primaryColor,
                      borderRadius: BorderRadius.circular(30.r),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text('Add To Cart',style: GoogleFonts.poppins(
                          textStyle: Theme.of(context).textTheme.titleMedium,
                        ),)
                      ],
                    ),
                  ),
                ),
              )
            ],
          ),
        ],
      ),
    );
  }
}
