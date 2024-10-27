import 'package:ecommerce_app/core/colors/myAppColors.dart';
import 'package:ecommerce_app/features/cart_screen/cart_item_widget.dart';
import 'package:ecommerce_app/features/cart_screen/cubit/cart_screen_state.dart';
import 'package:ecommerce_app/features/cart_screen/cubit/cart_screen_view_model.dart';
import 'package:ecommerce_app/features/cart_screen/total_price_widget/TotalPriceAndCheckoutBotton.dart';
import 'package:ecommerce_app/features/products_screen/add_to_cart/cubit/add_to_cart_view_model.dart';
import 'package:ecommerce_app/features/products_screen/cubit/products_screen_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class CartScreen extends StatelessWidget {
  static String routeName = 'CartScreen';

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CartScreenViewModel,CartScreenState>(
      bloc: CartScreenViewModel.get(context)..getCart(),
      builder: (context,state){
        return Scaffold(
          backgroundColor: Colors.white,
          appBar: AppBar(
            backgroundColor: Colors.white,
            title: Text(
              'Cart',
              style: GoogleFonts.poppins(
                textStyle: Theme.of(context).textTheme.displayLarge,
              ),
            ),
            centerTitle: true,
            actions: [
              Icon(
                Icons.search,
                size: 35.h,
                color: MyAppColors.primaryColor,
              ),
              SizedBox(width: 20.w),
              BlocBuilder<AddToCartViewModel, ProductScreenState>(
                builder: (context,state){
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
                );}
              ),
              SizedBox(width: 10.w),
            ],
            leading: IconButton(
              icon: Icon(
                Icons.arrow_back,
                color: MyAppColors.primaryColor,
                size: 35.h,
              ),
              onPressed: () {
                Navigator.pop(context);
              },
            ),
          ),
          body: Column(
            children: [
              state is CartScreenSuccessState ?
              Expanded(
                child: Column(
                  children:[ Expanded(
                    child: ListView.separated(
                      shrinkWrap: true,
                      itemBuilder: (context, index) {
                        return CartItemWidget(
                       dataEntity: state.getCartEntity.data!.products![index],
                        );
                      },
                      separatorBuilder: (context, index) => SizedBox(height: 12.h),
                      itemCount: state.getCartEntity.data!.products!.length,
                    ),
                  ),
                    TotalPriceAndCheckoutBotton(
                      totalPrice: state.getCartEntity.data!.totalCartPrice!.toInt(),
                      checkoutButtonOnTap: () {
                        // Handle checkout button tap
                      },
                    ),
                  SizedBox(height: 10.h,)],
                ),

              ):
                  Center(
                    child: CircularProgressIndicator(
                      color: MyAppColors.primaryColor,
                    ),
                  ),

            ],
          ),

        );
      },

    );
  }
}
