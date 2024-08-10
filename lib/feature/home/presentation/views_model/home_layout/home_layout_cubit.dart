import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rahaf/feature/home/presentation/views/home_screen.dart';
import 'package:rahaf/feature/home/presentation/views_model/home_layout/home_layout_state.dart';


class HomeLayoutCubit extends Cubit<HomeLayoutStates> {
  HomeLayoutCubit() : super(HomeLayoutInitialState());


  static HomeLayoutCubit get(context) => BlocProvider.of(context);

  List<Widget> screens = [
    Container(),
    const HomeScreen(),
    Container()
  ];

  int index = 1;

  void changeIndex(int newIndex, BuildContext context) {
    index = newIndex;
    emit(HomeLayoutBottomNavState());
  }

}
