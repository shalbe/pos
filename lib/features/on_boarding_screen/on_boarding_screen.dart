import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pos_project/core/colors/colors.dart';
import 'package:pos_project/core/componant/componant.dart';
import 'package:pos_project/core/componant/default_button.dart';
import 'package:pos_project/core/const/const.dart';
import 'package:pos_project/features/login/presentian/screens/login/login.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:svg_flutter/svg.dart';

class OnBoardingModel {
  final String? title;
  final String? image;
  final String? body;
  OnBoardingModel({this.body, this.title, this.image});
}

var pageController = PageController();
List<OnBoardingModel> OnBoardingList = [
  OnBoardingModel(
      image: 'assets/images/boaring1.svg', title:   AppConst.kAppName+'  مرحبا بك في متجر '),
  OnBoardingModel(
      image: 'assets/images/boaring2.svg', title: 'نحن نسهل عليك التسوق'),
  OnBoardingModel(
      image: 'assets/images/boaring3.svg',
      title: AppConst.kAppName+' متعه التسوق والامان علي ',
      body: 'just stay of home with us'),
];

class OnBoarding extends StatefulWidget {
  OnBoarding({Key? key}) : super(key: key);

  @override
  State<OnBoarding> createState() => _OnBoardingState();
}

class _OnBoardingState extends State<OnBoarding> {
  int currentPage = 0;

  @override
  Widget build(BuildContext context) {
    // SizeConfig().init(context);
    return Scaffold(
      body: SafeArea(
        child: SizedBox(
          height: 700.h,
          width: double.infinity,
          child: Column(
            children: <Widget>[
              Padding(
                padding: EdgeInsets.only(top: 20.h, left: 15.w, right: 15.w),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    // SmoothPageIndicator(
                    //     controller: pageController,
                    //     effect: WormEffect(
                    //         dotColor: Colors.grey.shade300,
                    //         activeDotColor: AppColors.mainColor,
                    //         dotHeight: 5.h,
                    //         dotWidth: 20.w),
                    //     count: OnBoardingList.length),
                  ],
                ),
              ),
              Container(
                height: 500.h,
                width: 350.w,
                child: PageView.builder(
                  onPageChanged: (value) {
                    setState(() {
                      currentPage = value;
                    });
                  },
                  itemCount: OnBoardingList.length,
                  controller: pageController,
                  itemBuilder: (context, index) => Column(
                    children: <Widget>[
                      // Spacer(),
                      // Image.asset(
                      //                                             'assets/images/WhatsApp Image 2023-08-23 at 10.01.02 PM.jpeg',

                      //   width: 235.w,
                      // ),
                      // Spacer(flex: 2),
                      SizedBox(height: 50.h),
                      SvgPicture.asset(
                        OnBoardingList[index].image!,
                        height: 265.h,
                        width: 235.w,
                      ),
                      SizedBox(height: 80.h),
                      defaultText(
                          txt: OnBoardingList[index].title!,
                          fontSize: 17.sp,
                          fontWeight: FontWeight.bold
                          // textAlign: TextAlign.center,
                          ),
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: 90.h,
              ),
              Padding(
                padding: EdgeInsets.only(left: 15.w, right: 15.w),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    SmoothPageIndicator(
                        controller: pageController,
                        effect: WormEffect(
                            dotColor: Colors.grey.shade300,
                            activeDotColor: AppColors.mainColor,
                            dotHeight: 5.h,
                            dotWidth: 10.w),
                        count: OnBoardingList.length),
                    InkWell(
                      onTap: () {
                        nextPageUntil(context, Login());
                      },
                      child: defaultText(
                          txt: "تخطي »",
                          fontSize: 17.sp,
                          fontWeight: FontWeight.bold
                          // press: () {

                          // if (types == '1') {
                          //   page = HomeUser();
                          // } else {
                          //   page = NursesHome();
                          // }
                          // nextPageUntil(context,
                          //     page: uid != null ? page! : LoginAuth());
                          // },
                          ),
                    ),
                  ],
                ),
              ),
              Spacer(),
            ],
          ),
        ),
      ),
    );
  }

  AnimatedContainer buildDot({int? index}) {
    return AnimatedContainer(
      duration: Duration(seconds: 3),
      margin: EdgeInsets.only(right: 5),
      height: 6,
      width: currentPage == index ? 20 : 6,
      decoration: BoxDecoration(
        color: currentPage == index ? AppColors.mainColor : Color(0xFFD8D8D8),
        borderRadius: BorderRadius.circular(3),
      ),
    );
  }
}
