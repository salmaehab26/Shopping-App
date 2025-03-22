import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shopping/Features/Home/Cubit/HomeScreenStates.dart';

class HomeScreenViewModel extends Cubit<HomeScreenStates> {
  HomeScreenViewModel():super(HomeInitState());



}