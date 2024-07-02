import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pos_project/core/colors/colors.dart';
import 'package:pos_project/core/componant/componant.dart';
import 'package:pos_project/core/const/const.dart';
import 'package:pos_project/features/dash_board_screen/presentian/screens/dash_board_screen.dart';
import 'package:pos_project/features/on_boarding_screen/on_boarding_screen.dart';

class Splash extends StatefulWidget {
  static int themeType = 1;

  @override
  State<Splash> createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  Widget page = OnBoarding();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    Timer(
        Duration(seconds: 3), () => nextPageUntil(context, DashBoardScreen()));
  }

  Widget build(BuildContext context) {
    var h = MediaQuery.of(context).size.height;
    var w = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: AppColors.mainColor,
      body: Center(
        child: Image.asset('assets/images/New Project.png'),
        // child: SingleChildScrollView(
        //   child: Column(
        //     mainAxisAlignment: MainAxisAlignment.center,
        //     children: [
        // Container(
        //   height: h,
        //   width: w,
        //   decoration: BoxDecoration(
        //       color: Colors.black,
        //       image: DecorationImage(
        //           fit: BoxFit.fill,
        //           image: AssetImage(
        //               'assets/images/splash.jpeg'))),
        // ),

        // CachedNetworkImage(
        //   fit: BoxFit.fill,
        //   height: MySize.screenHeight! * 0.5,
        //   width: MySize.screenWidth,
        //   imageUrl: Config().splashScreen,
        //   placeholder: (context, url) => Transform.scale(
        //     scale: 0.1,
        //     child: CircularProgressIndicator(),
        //   ),
        //   errorWidget: (context, url, error) =>
        //       Image.asset('assets/images/splash_screen.png'),
        // ),
        // Text(AppLocalizations.of(context).translate('welcome'),
        //     style: AppTheme.getTextStyle(themeData.textTheme.headline4,
        //         color: themeData.colorScheme.onSurface)),
        // ElevatedButton.icon(
        //   onPressed: () async {},
        //   icon: Icon(Icons.navigate_next,
        //       color: themeData.colorScheme.primary),
        //   label: Text(AppLocalizations.of(context).translate('login'),
        //       style: AppTheme.getTextStyle(themeData.textTheme.bodyText1,
        //           color: themeData.colorScheme.primary, fontWeight: 600)),
        //   style: ElevatedButton.styleFrom(
        //       primary: themeData.colorScheme.onPrimary,
        //       shadowColor: themeData.colorScheme.primary),
        // ),
        // Visibility(
        //   visible: Config().showRegister,
        //   child: Padding(
        //     padding: EdgeInsets.all(MySize.size10!),
        //     child: GestureDetector(
        //       child: Text(
        //           AppLocalizations.of(context).translate('register'),
        //           style: AppTheme.getTextStyle(
        //               themeData.textTheme.bodyText1,
        //               color: themeData.colorScheme.onBackground,
        //               fontWeight: 600)),
        //       onTap: () async {
        //         await launch('${Config.baseUrl}business/register');
        //       },
        //     ),
        //   ),
        // )
        //   ],
        // ),
        // ),
      ),
    );
  }
}

enum _SupportState {
  unknown,
  supported,
  unsupported,
}
