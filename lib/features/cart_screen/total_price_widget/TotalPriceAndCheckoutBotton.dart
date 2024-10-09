import 'package:ecommerce_app/core/colors/myAppColors.dart';
import 'package:ecommerce_app/core/widget/CustomElevatedButton.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class TotalPriceAndCheckoutBotton extends StatelessWidget {
  const TotalPriceAndCheckoutBotton({
    super.key,
    required this.totalPrice,
    required this.checkoutButtonOnTap,
  });

  final int totalPrice;
  final void Function() checkoutButtonOnTap;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 10.h), // Added padding for spacing
      child: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Total price',
                  style: Theme.of(context).textTheme.displayLarge,
                ),
                SizedBox(height: 4.h),
                Text(
                  'EGP $totalPrice',
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style: Theme.of(context).textTheme.displayLarge,
                ),
              ],
            ),
          ),
          SizedBox(width: 10.w),
          Expanded(
            child: CustomElevatedButton(
              backgroundColor: MyAppColors.primaryColor,
              label: 'Check Out',
              textStyle: Theme.of(context).textTheme.titleMedium,
              onTap: checkoutButtonOnTap,
              suffixIcon: Icon(
                Icons.arrow_forward,
                color: Colors.white,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
