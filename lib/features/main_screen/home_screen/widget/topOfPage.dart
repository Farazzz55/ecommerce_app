import 'package:ecommerce_app/core/colors/myAppColors.dart';
import 'package:ecommerce_app/features/products_screen/add_to_cart/cubit/add_to_cart_view_model.dart';
import 'package:ecommerce_app/features/products_screen/cubit/products_screen_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class TopOfPage extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          width: 350.w,
          height: 50.h,
          decoration: BoxDecoration(
              border: Border.all(color: MyAppColors.primaryColor),
              borderRadius: BorderRadius.circular(30.r)
          ),
          child: TextField(
            decoration: InputDecoration(
              border: InputBorder.none,
              focusedBorder: InputBorder.none,
              enabledBorder: InputBorder.none,
              hintText: 'What do you search for ?',
              hintStyle: TextStyle(
                  color: MyAppColors.descColor
              ),
              prefixIcon: Icon(
                Icons.search,
                color: MyAppColors.primaryColor,
                size: 35,
              ),
            ),
            style: TextStyle(
                color:MyAppColors.primaryColor,
                fontSize: 17.sp,
                fontWeight: FontWeight.normal

            ),
          ),
        ),
        SizedBox(width: MediaQuery.of(context).size.width*0.05,),
        BlocBuilder<AddToCartViewModel, ProductScreenState>(
          builder: (context, state) {
            final cartItems = AddToCartViewModel.get(context).numOfCartItem;
            return Badge(
              backgroundColor: MyAppColors.primaryColor,
              textStyle: TextStyle(
                fontSize: 15.sp
              ),
              label: Text('$cartItems'),
              child: ImageIcon(
                AssetImage('assets/images/shoppingCarIcon.png'),
                color: MyAppColors.primaryColor,
              ),
            );
          },
        ),      ],
    );

  }

}