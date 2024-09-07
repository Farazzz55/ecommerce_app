import 'package:ecommerce_app/features/main_screen/category_screen/category_screen.dart';
import 'package:ecommerce_app/features/main_screen/cubit/home_screen_state.dart';
import 'package:ecommerce_app/features/main_screen/favourite_screen/favourite_screen.dart';
import 'package:ecommerce_app/features/main_screen/home_screen/home_screen.dart';
import 'package:ecommerce_app/features/main_screen/user_screen/user_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeScreenViewModel extends  Cubit<HomeScreenState>{
    HomeScreenViewModel():super(HomeScreenInitState());
    int selectedIndex=0;
    List<Widget>tabs=[HomeScreen(),CategoryScreen(),FavouriteScreen(),UserScreen()];
   void changeSelectedIndex(int newIndex){
       selectedIndex=newIndex;
       emit(ChangeSelectedIndexState());
   }
}