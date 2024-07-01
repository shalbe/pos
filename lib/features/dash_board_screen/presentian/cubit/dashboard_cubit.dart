import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pos_project/features/carts_screen/presentian/screens/carts_screen.dart';
import 'package:pos_project/features/dash_board_screen/presentian/cubit/dashboard_state.dart';
import 'package:pos_project/features/home_screen/presentian/screens/home_screen.dart';
import 'package:pos_project/features/profile_screen/presentian/screens/profile_screen.dart';
import 'package:pos_project/features/search_screen/presentian/screens/search_screen.dart';

//
class DashBoardCubit extends Cubit<DashBoardStates> {
  DashBoardCubit() : super(IntitialDashBoardState());
  static DashBoardCubit get(context) => BlocProvider.of(context);

  List<Widget> screen = [
    ProfileScreen(),
    CartsScreen(),
    SearchScreen(),
    HomeScreen(),
    // ProductsScreen(),
  ];

  int indexScreen = 3;

  changeIndex(index) {
    indexScreen = index;
    emit(ChangeIndexState());
  }

  // changeIndexToProductScreen() {
  //   indexScreen = 4;
  //   emit(ChangeIndexState());
  // }
}
