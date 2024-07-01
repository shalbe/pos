import 'package:bottom_bar_matu/bottom_bar/bottom_bar_bubble.dart';
import 'package:bottom_bar_matu/bottom_bar_item.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pos_project/features/carts_screen/presentian/cubit/carts_cubit.dart';
import 'package:pos_project/features/carts_screen/presentian/cubit/carts_state.dart';
import 'package:pos_project/features/dash_board_screen/presentian/cubit/dashboard_cubit.dart';
import 'package:pos_project/features/dash_board_screen/presentian/cubit/dashboard_state.dart';
import 'package:pos_project/features/home_screen/presentian/cubit/home_cubit.dart';
import 'package:pos_project/features/home_screen/presentian/cubit/home_state.dart';

class CartsScreen extends StatelessWidget {
  const CartsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => CartsCubit(),
      child: BlocConsumer<CartsCubit, CartsStates>(
          listener: (context, state) {},
          builder: (context, state) {
            CartsCubit cubit = CartsCubit.get(context);
            return Scaffold(
             
            );
          }),
    );
  }
}
