import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../Screens/FavouriteScreen.dart';
import '../../Screens/HomeScreen.dart';
import '../../Screens/ProductsScreen.dart';
import '../../Screens/ProfileTab.dart';
import 'MainScreenStates.dart';

class MainScreenViewModel extends Cubit<MainScreenStates> {
  MainScreenViewModel() : super(MainScreenInitState());
  int currentIndex = 0;

  void Changeselectindex(int selectedIndex) {
    emit(MainScreenInitState());
    currentIndex = selectedIndex;
    emit(ChangeSelectedIndexState());
  }

  List<Widget> Tabs = [
    HomeScreen(),
    ProductsScreen(),
    FavouriteScreen(),
    ProfileTab(),
  ];
}
