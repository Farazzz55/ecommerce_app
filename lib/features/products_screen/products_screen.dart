import 'package:ecommerce_app/core/colors/myAppColors.dart';
import 'package:ecommerce_app/di.dart';
import 'package:ecommerce_app/features/main_screen/home_screen/widget/topOfPage.dart';
import 'package:ecommerce_app/features/products_screen/cubit/products_screen_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ecommerce_app/features/products_screen/cubit/products_screen_view_model.dart';
import 'package:ecommerce_app/features/products_screen/widget/productItemWidget.dart';
import 'package:ecommerce_app/features/products_details_screen/product_details_screen.dart';

class ProductsScreen extends StatelessWidget {
  static String routeName='ProductsScreen';
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt<ProductsScreenViewModel>()..getPrdouctsData(),
      child: Scaffold(
        backgroundColor: Colors.white,
        body: BlocBuilder<ProductsScreenViewModel, ProductScreenState>(
          builder: (context, state) {
            if (state is ProductScreenLoadingState) {
              return Center(
                child: CircularProgressIndicator(
                  color: MyAppColors.primaryColor,
                ),
              );
            } else if (state is ProductScreenSuccessState) {
              var viewModel = context.read<ProductsScreenViewModel>();
              return viewModel.productList.isEmpty
                  ? Center(
                child: Text(
                  'No Products Available',
                  style: TextStyle(fontSize: 18.sp, color: Colors.black54),
                ),
              )
                  : Padding(
                padding: EdgeInsets.all(10.w),
                child: Column(
                  children: [
                    TopOfPage(),
                    SizedBox(height: 15.h),
                    Expanded(
                      child: GridView.builder(
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          crossAxisSpacing: 8.w,
                          mainAxisSpacing: 8.h,
                          childAspectRatio: 6 / 10,
                        ),
                        scrollDirection: Axis.vertical,
                        itemCount: viewModel.productList.length,
                        itemBuilder: (context, index) {
                          return InkWell(
                            onTap: () {
                              Navigator.pushNamed(
                                context,
                                ProductDetailsScreen.routeName,
                                arguments: viewModel.productList[index],
                              );
                            },
                            child: ProductItemWidget(
                              productDataEntity: viewModel.productList[index],

                            ),
                          );
                        },
                      ),
                    ),
                  ],
                ),
              );
            } else {
              return Center(
                child: CircularProgressIndicator(
                  color: MyAppColors.primaryColor,
                ),
              );
            }
          },
        ),
      ),
    );
  }
}
