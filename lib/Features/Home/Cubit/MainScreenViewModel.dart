import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../pages/FavouriteScreen.dart';
import '../pages/HomeScreen.dart';
import '../pages/ProductsScreen.dart';
import '../pages/ProfileTab.dart';
import 'MainScreenStates.dart';

class HomeViewModel extends Cubit<MainScreenStates> {
  HomeViewModel():super(MainScreenInitState());
  int currentIndex = 0;
  void Changeselectindex(int selectedIndex) {
    emit(MainScreenInitState());
    currentIndex = selectedIndex ;
    emit(ChangeSelectedIndexState());
  }
  List<Widget> Tabs = [
    HomeScreen(),
    ProductsScreen(),
    FavouriteScreen(),
    ProfileTab(),
  ];

}