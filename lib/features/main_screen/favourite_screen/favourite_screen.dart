import 'package:ecommerce_app/core/colors/myAppColors.dart';
import 'package:ecommerce_app/features/main_screen/favourite_screen/cubit/get_fav_state.dart';
import 'package:ecommerce_app/features/main_screen/favourite_screen/cubit/get_fav_view_model.dart';
import 'package:ecommerce_app/features/main_screen/favourite_screen/fav_screen_item_widget/FavScreenItemWidget.dart';
import 'package:ecommerce_app/features/main_screen/home_screen/widget/topOfPage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class FavouriteScreen extends StatefulWidget {
  @override
  _FavouriteScreenState createState() => _FavouriteScreenState();
}

class _FavouriteScreenState extends State<FavouriteScreen> {
  @override
  void initState() {
    super.initState();
    // Fetch favorites when the screen is initialized
    GetFavViewModel.get(context).getFav();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GetFavViewModel, GetFavState>(
      builder: (context, state) {
        if (state is GetFavLoadingState) {
          return Center(
            child: CircularProgressIndicator(
              color: MyAppColors.primaryColor,
            ),
          );
        }
        if (state is GetFavSuccessState) {
          return Padding(
            padding: EdgeInsets.all(10.w),
            child: Column(
              children: [
                TopOfPage(),
                SizedBox(height: 20.h,),
                Expanded(
                  child: ListView.separated(
                    itemBuilder: (context, index) {
                      return FavScreenItemWidget(
                        dataEntity: state.favEntity.data![index],
                      );
                    },
                    separatorBuilder: (context, index) => SizedBox(height: 12.h),
                    itemCount: state.favEntity.data!.length,
                  ),
                ),
              ],
            ),
          );
        }
        if (state is GetFavErrorState) {
          return Center(
            child: Text(
              "Error: ${state.failures.errorMessage}",
              style: TextStyle(color: Colors.red),
            ),
          );
        }
        // Fallback for other cases, if needed.
        return Center(
          child: Text("Unexpected State"),
        );
      },
    );
  }
}
