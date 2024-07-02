import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pos_project/core/database/api/dio_consumer.dart';
import 'package:pos_project/core/database/bloc_observer.dart';
import 'package:pos_project/core/database/cache/cache_helper.dart';
import 'package:pos_project/core/fonts/fonts.dart';
import 'package:pos_project/features/splash_screen/splash_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await CacheHelper.init();
  await DioHelper.init();
  Bloc.observer = MyBlocObserver();
  // uid = CacheHelper.getShared(key: AppConst.kLogin) != null
  //     ? CacheHelper.getShared(key: AppConst.kLogin)
  //     : null;
  // print('===========$uid');
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  // static GlobalKey<NavigatorState> navKey = GlobalKey<NavigatorState>();

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
        designSize: const Size(360, 690),
        minTextAdapt: true,
        splitScreenMode: true,
        builder: (context, child) {
          return MaterialApp(
            // navigatorKey: navKey,
            debugShowCheckedModeBanner: false,
            title: 'Kalde client',
            home: Splash(),
            theme: ThemeData(
                // backgroundColor: Color(0xffE2E7ED),
                textSelectionTheme: const TextSelectionThemeData(
                    selectionHandleColor: Colors.transparent,
                    selectionColor: Color.fromARGB(100, 66, 76, 88)),
                colorScheme: const ColorScheme.light(
                  brightness: Brightness.light,
                  background: Colors.white,
                  primary: Color(0xffF3F5F7),
                  secondary: Color(0xff142B6F),
                  tertiary: Color(0xff424C58),
                ),
                fontFamily: FontFamilies.GE_SS_TWO),
          );
        });
  }
}
