import 'package:bottom_bar_matu/bottom_bar/bottom_bar_bubble.dart';
import 'package:bottom_bar_matu/bottom_bar_item.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pos_project/features/dash_board_screen/presentian/cubit/dashboard_cubit.dart';
import 'package:pos_project/features/dash_board_screen/presentian/cubit/dashboard_state.dart';
import 'package:pos_project/features/home_screen/presentian/cubit/home_cubit.dart';
import 'package:pos_project/features/home_screen/presentian/cubit/home_state.dart';
import 'package:pos_project/features/profile_screen/presentian/cubit/profile_cubit.dart';
import 'package:pos_project/features/profile_screen/presentian/cubit/profile_state.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ProfileCubit(),
      child: BlocConsumer<ProfileCubit, ProfileStates>(
          listener: (context, state) {},
          builder: (context, state) {
            ProfileCubit cubit = ProfileCubit.get(context);
            return Scaffold(
             
            );
          }),
    );
  }
}
