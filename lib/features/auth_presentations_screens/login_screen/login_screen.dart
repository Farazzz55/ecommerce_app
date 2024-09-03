import 'package:ecommerce_app/core/colors/myAppColors.dart';
import 'package:ecommerce_app/features/auth_presentations_screens/register_screen/register_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../core/widget/CustomElevatedButton.dart';
import '../../../core/widget/CustomTextFormField.dart';
import '../../../core/widget/validator.dart';

class LoginScreen extends StatelessWidget{
  static String routeName='loginScreen';
  TextEditingController userNameController=TextEditingController();
  TextEditingController passwordController=TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MyAppColors.primaryColor,
     body: Padding(
       padding:  EdgeInsets.all(8.0.w),
       child: Column(
         crossAxisAlignment: CrossAxisAlignment.start,
         children: [
           SizedBox(height: 80.h,),
           Center(child: Image.asset('assets/images/route_logo.png')),
           SizedBox(height: 50.h,),
           Text('Welcome Back To Route',style: GoogleFonts.poppins(
             textStyle: Theme.of(context).textTheme.bodyLarge
           ),),
           Text('please sign in with your mail',style: GoogleFonts.poppins(
               textStyle: Theme.of(context).textTheme.titleSmall
           ),),
           SizedBox(height: 50.h,),
           Text('User Name' , style: GoogleFonts.poppins(
               textStyle: Theme.of(context).textTheme.titleMedium
           ),) ,
           CustomTextFormField(hintText: 'User Name',
               validator: (value){
                 AppValidator.validateUserName(value);
               },
               controller: userNameController),
           SizedBox(height: 30.h,),
           Text('Password' , style: GoogleFonts.poppins(
               textStyle: Theme.of(context).textTheme.titleMedium
           ),) ,
           CustomTextFormField(hintText: 'Password',
               validator: (value){
                 AppValidator.validatePassword(value);
               },
               controller: passwordController),
           InkWell(
             onTap: (){

             },
             child: Align(
               alignment: Alignment.topRight,
               child: Text('Forget password?' , style: GoogleFonts.poppins(
                 textStyle: Theme.of(context).textTheme.titleSmall
               ), textAlign: TextAlign.end,),
             ),
           ),
           SizedBox(height: 50.h,),
           CustomElevatedButton(label: 'Login', onTap: (){
           } , isStadiumBorder: false,) ,
           Row(
             mainAxisAlignment: MainAxisAlignment.center,
             children: [
               Text('Dont have account?' , style: GoogleFonts.poppins(
                 textStyle: Theme.of(context).textTheme.titleSmall
               ),),
               InkWell(
                 onTap: (){
                   Navigator.pushReplacementNamed(context, RegisterScreen.routeName);
                 },
                 child: Text('Create Account' , style: GoogleFonts.poppins(
                     textStyle: Theme.of(context).textTheme.titleSmall
                 ),),
               ),
             ],
           )
         ],
       ),
     ),
    );
  }

}