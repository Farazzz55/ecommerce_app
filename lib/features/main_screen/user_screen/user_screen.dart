import 'package:ecommerce_app/core/colors/myAppColors.dart';
import 'package:ecommerce_app/core/widget/CustomTextFormField.dart';
import 'package:ecommerce_app/core/widget/shared_preferences_utils.dart';
import 'package:ecommerce_app/features/auth_presentations_screens/login_screen/login_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class UserScreen extends StatelessWidget{
  TextEditingController userNameController=TextEditingController();
  TextEditingController emailController=TextEditingController();
  TextEditingController passwordController=TextEditingController();
  TextEditingController mobileNumberController=TextEditingController();
  TextEditingController addressController=TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding:  EdgeInsets.all(8.w),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('Welcome',style: GoogleFonts.poppins(
                    textStyle: Theme.of(context).textTheme.labelLarge
                  ),),
                  IconButton(onPressed: (){
                    logout(context);
                    Navigator.pushAndRemoveUntil(
                      context,
                      MaterialPageRoute(builder: (context) => LoginScreen()),
                          (Route<dynamic> route) => false,
                    );                  }, icon: Icon(Icons.logout,color: MyAppColors.primaryColor,
                    size:35.h ,))
                ],
              ),
              SizedBox(height: 30.h,),
              Text('Your full name',style: GoogleFonts.poppins(
                  textStyle: Theme.of(context).textTheme.titleLarge
              ),),
              CustomTextFormField(hintText: '', validator: (p0) {}, controller: userNameController,
              editIcon: Icon(Icons.edit),),
              SizedBox(height: 15.h,),
              Text('Your E-mail',style: GoogleFonts.poppins(
                  textStyle: Theme.of(context).textTheme.titleLarge
              ),),
              CustomTextFormField(hintText: '', validator: (p0) {}, controller: emailController,editIcon: Icon(Icons.edit)),
              SizedBox(height: 15.h,),
              Text('Your Password',style: GoogleFonts.poppins(
                  textStyle: Theme.of(context).textTheme.titleLarge
              ),),
              CustomTextFormField(
                  hintText: '', validator: (p0) {}, controller: passwordController,editIcon: Icon(Icons.edit),
              obscureText: true,),
              SizedBox(height: 15.h,),
              Text('Your mobile number',style: GoogleFonts.poppins(
                  textStyle: Theme.of(context).textTheme.titleLarge
              ),),
              CustomTextFormField(hintText: '', validator: (p0) {}, controller: mobileNumberController,editIcon: Icon(Icons.edit)),
              SizedBox(height: 15.h,),
              Text('Your Address',style: GoogleFonts.poppins(
                  textStyle: Theme.of(context).textTheme.titleLarge
              ),),
              CustomTextFormField(hintText: '', validator: (p0) {}, controller: addressController,editIcon: Icon(Icons.edit))

            ],
          ),
        ),
      ),

    );
  }
  void logout(BuildContext context) async {
    await SharedPreferencesUtils.removeData(key: 'token');
  }

}