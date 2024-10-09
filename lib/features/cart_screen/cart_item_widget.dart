import 'package:ecommerce_app/core/colors/myAppColors.dart';
import 'package:ecommerce_app/domain/entites/get_cart_entity.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class CartItemWidget extends StatelessWidget {
  GetCartProductsEntity dataEntity;
   CartItemWidget({
    required this.dataEntity
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        left: 5.w,
        right: 5.w
      ),
      child: Container(
        decoration: BoxDecoration(
            border: Border.all(
              color: MyAppColors.strokeColor,
            ),
            borderRadius: BorderRadius.circular(5.r)
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Container(
              clipBehavior: Clip.antiAlias,
               decoration: BoxDecoration(
                 borderRadius: BorderRadius.circular(10.r),

               ),

              child: Image.network(dataEntity.product?.imageCover??' ',
              width: 120.w,
              height: 140.h,
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
                },),
            ),
            SizedBox(width: 5.w,),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(
                    dataEntity.product?.title??'',
                    style: GoogleFonts.poppins(
                      textStyle: Theme.of(context).textTheme.headlineLarge,
                    ),
                  ),
                  SizedBox(height: 30.h,),
                  Text(
                    'EGP ${dataEntity.price??''}',
                    style: GoogleFonts.poppins(
                      textStyle: Theme.of(context).textTheme.headlineLarge,
                    ),
                  ),
                ],
              ),
            ),
               Column(
                children: [
                  Padding(
                    padding:EdgeInsets.only(
                        left: 50.w,
                        bottom: 50.h
                    ),
                    child: IconButton(onPressed: (){

                    }, icon: Icon(Icons.delete_outline , color: MyAppColors.primaryColor,size: 35.w
                      ,)),
                  ),
                  Padding(
                    padding: EdgeInsets.only(
                      bottom: 5.h,
                    ),
                    child: Container(
                      width: 150.w,
                      height: 35.h,
                      decoration: BoxDecoration(
                        color: MyAppColors.primaryColor,
                        borderRadius: BorderRadius.circular(30.r),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          IconButton(
                            onPressed: () {},
                            icon: Icon(
                              Icons.remove_circle_outline,
                              color: MyAppColors.whiteColor,
                              size: 24.sp,
                            ),
                          ),
                          Text(
                            '${dataEntity.count??''}',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 15.sp,
                            ),
                          ),
                          IconButton(
                            onPressed: () {},
                            icon: Icon(
                              Icons.add_circle_outline_sharp,
                              color: MyAppColors.whiteColor,
                              size: 24.sp,
                            ),
                          ),
                        ],
                      ),
                    ),
                  )
                ],
              ),



          ],

        ),
      ),
    );
  }
}