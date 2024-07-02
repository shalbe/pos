import 'package:bottom_bar_matu/bottom_bar/bottom_bar_bubble.dart';
import 'package:bottom_bar_matu/bottom_bar_item.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pos_project/features/dash_board_screen/presentian/cubit/dashboard_cubit.dart';
import 'package:pos_project/features/dash_board_screen/presentian/cubit/dashboard_state.dart';

class DashBoardScreen extends StatelessWidget {
  const DashBoardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => DashBoardCubit(),
      child: BlocConsumer<DashBoardCubit, DashBoardStates>(
          listener: (context, state) {},
          builder: (context, state) {
            DashBoardCubit cubit = DashBoardCubit.get(context);
            return Scaffold(
              backgroundColor: Colors.white,
              body: cubit.screen[cubit.indexScreen],
              bottomNavigationBar: BottomBarBubble(
                selectedIndex: cubit.indexScreen,
                items: [
                  BottomBarItem(iconData: Icons.person_2_outlined),
                  BottomBarItem(iconData: Icons.shopping_cart),
                  BottomBarItem(iconData: Icons.search_rounded),
                  BottomBarItem(iconData: CupertinoIcons.home),
                ],
                onSelect: (index) {
                  cubit.changeIndex(index);
                },
              ),
            );
          }),
    );
  }
}
