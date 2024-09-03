import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class DialogUtliz  {
  static void showLoading({required BuildContext context,required String messege}){
    showDialog(
       barrierDismissible: false,
        context: context, builder: (context){
      return AlertDialog(
        content: Row(
          children: [
          CircularProgressIndicator(),
          Padding(
            padding:  EdgeInsets.all(8.0.w),
            child: Text(messege),
          )
        ],
        ),

      );

    });
  }
  static void hideLoading(BuildContext context){
    Navigator.pop(context);
  }
  static showMessege({required BuildContext context, required String content ,
  String title='' , String ? ButtonOneName , Function ? ButtonOne ,String ? ButtonTwoName , Function ? ButtonTwo}){
    List<Widget>actions=[];
    if(ButtonOneName!=null){
      actions.add(TextButton(onPressed: (){
        ButtonOne?.call();
      }, child: Text(ButtonOneName)));
    }
    if(ButtonTwoName!=null){
      actions.add(TextButton(onPressed: (){
        ButtonTwo?.call();
      }, child: Text(ButtonTwoName)));
    }
    showDialog(context: context, builder: (context){
      return AlertDialog(
        content: Text(content),
        title: Text(''),
        actions: actions
        

      );
    });
  }

  
}