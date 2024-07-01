import 'package:bottom_bar_matu/bottom_bar/bottom_bar_bubble.dart';
import 'package:bottom_bar_matu/bottom_bar_item.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pos_project/core/colors/colors.dart';
import 'package:pos_project/core/componant/componant.dart';
import 'package:pos_project/core/const/const.dart';
import 'package:pos_project/features/dash_board_screen/presentian/cubit/dashboard_cubit.dart';
import 'package:pos_project/features/dash_board_screen/presentian/cubit/dashboard_state.dart';
import 'package:pos_project/features/home_screen/data/%20healthy.dart';
import 'package:pos_project/features/home_screen/presentian/componant/get_later_product.dart';
import 'package:pos_project/features/home_screen/presentian/componant/get_product.dart';
import 'package:pos_project/features/home_screen/presentian/componant/get_product_choosen_for_you.dart';
import 'package:pos_project/features/home_screen/presentian/cubit/home_cubit.dart';
import 'package:pos_project/features/home_screen/presentian/cubit/home_state.dart';
import 'package:pos_project/features/login/presentian/screens/login/login.dart';
import 'package:pos_project/features/products_category_screen/presentian/screens/products_category.dart';
import 'package:pos_project/features/products_category_screen/presentian/screens/products_category_for_you.dart';
import 'package:rate/rate.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

List<String> chooseList = [
  "دعم عمليه الهضم ",
  "مضادات الاكسدة",
  "زيت السمك والاميغا",
  "احماض امينية",
];
List<String> bestSellerList = [
  "المكملات",
  "الاستحمام والعنايه الشخصيه",
  "جمال",
  "رياضه",
  "البقالة",
  "الرضع والاطفال",
  "الحيوانات الاليفه",
];
List<Healthy> categoryList = [
  Healthy(
    image: 'assets/images/icons8-new-65.png',
    name: 'العروض الخاصة',
  ),
  Healthy(
    image: 'assets/images/schedule.png',
    name: 'الفرصه الاخيره',
  ),
  Healthy(
    image: 'assets/images/arthritis_9442044.png',
    name: 'عظام ومفاصل',
  ),
  Healthy(
    image: 'assets/images/icons8-vitamin-96.png',
    name: 'المكملات',
  ),
  Healthy(
    image: 'assets/images/icons8-shower-60.png',
    name: 'الاستحمام والعنايه الشخصيه',
  ),
  Healthy(
    image: 'assets/images/icons8-horse-100.png',
    name: 'الحيوانات الاليفه',
  ),
  Healthy(
    image: 'assets/images/sleeping_3171874.png',
    name: 'النوم',
  ),
  Healthy(
    image: 'assets/images/17_13528915.png',
    name: 'المزيد من الموضوعات',
  ),
];

List<Healthy> healthList = [
  Healthy(
    image: 'assets/images/immune-system_8743282.png',
    name: 'المناعه',
  ),
  Healthy(
    image: 'assets/images/brain_10870199.png',
    name: 'العقل والادراك',
  ),
  Healthy(
    image: 'assets/images/arthritis_9442044.png',
    name: 'عظام ومفاصل',
  ),
  Healthy(
    image: 'assets/images/eye_117945.png',
    name: 'العين والرؤيه',
  ),
  Healthy(
    image: 'assets/images/brain_10870199.png',
    name: 'الشعر والبشره',
  ),
  Healthy(
    image: 'assets/images/heart_259424.png',
    name: 'القلب',
  ),
  Healthy(
    image: 'assets/images/sleeping_3171874.png',
    name: 'النوم',
  ),
  Healthy(
    image: 'assets/images/17_13528915.png',
    name: 'المزيد من الموضوعات',
  ),
];

List<String> items = [
  "assets/images/7407777_3651960.jpg",
  "assets/images/1.jpg"
];
List<String> imageItem = [
  "assets/images/7043.jpg",
  "assets/images/18813.jpg",
  "assets/images/7408210_3637294.jpg"
];
List<String> imageItemForYou = [
  "assets/images/omega3_1.png",
  "assets/images/omega3_2.png",
  "assets/images/omega3_3.png"
];
List<String> imageItemPro = [
  "assets/images/later3.png",
 "assets/images/omega3_2.png",
  "assets/images/omega3_1.png",
  "assets/images/omega3_2.png",
  "assets/images/omega3_3.png",
  "assets/images/later2.png",
  "assets/images/later1.png"
];
List<String> imageItemProducts = [
  "assets/images/later3.png",
 "assets/images/omega3_2.png",
  "assets/images/later2.png",
  "assets/images/later1.png"
];
List<String> imageItemLater = [
  "assets/images/later3.png",
  "assets/images/later2.png",
  "assets/images/later1.png"
];

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int index1 = 0;
  bool swichVal = false;
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => HomeCubit(),
      child: BlocConsumer<HomeCubit, HomeStates>(
          listener: (context, state) {},
          builder: (context, state) {
            HomeCubit cubit = HomeCubit.get(context);
            return Directionality(
              textDirection: TextDirection.rtl,
              child: Scaffold(
                body: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        height: 120.h,
                        width: double.infinity,
                        decoration: BoxDecoration(
                          color: AppColors.mainColor,
                        ),
                        child: Padding(
                          padding: EdgeInsets.only(
                              top: 40.h, left: 15.w, right: 15.w),
                          child: Row(
                            children: [
                              Expanded(
                                  child: Container(
                                height: 45.h,
                                child: TextField(
                                  // textDirection: TextDirection.rtl,
                                  textAlign: TextAlign.right,
                                  cursorColor: Colors.black,
                                  decoration: InputDecoration(
                                      focusedBorder: OutlineInputBorder(
                                          // gapPadding: 2,
                                          borderSide: BorderSide(
                                              style: BorderStyle.none,
                                              width: .1,
                                              color: Colors.white),
                                          borderRadius: BorderRadius.circular(
                                            14,
                                          )),
                                      enabledBorder: OutlineInputBorder(
                                          // gapPadding: 2,
                                          borderSide: BorderSide(
                                              style: BorderStyle.none,
                                              width: .1,
                                              color: Colors.white),
                                          borderRadius: BorderRadius.circular(
                                            14,
                                          )),
                                      filled: true,
                                      prefixIcon: Icon(
                                        CupertinoIcons.search,
                                        color: Colors.grey.shade400,
                                      ),
                                      hintText:
                                          ' البحث في ' + AppConst.kAppName,
                                      hintStyle: TextStyle(
                                          color: Colors.grey.shade400,
                                          fontSize: 17.sp),
                                      fillColor: Colors.white),
                                ),
                              )),
                              SizedBox(
                                width: 20.w,
                              ),
                              Row(
                                children: [
                                  Icon(
                                    Icons.location_history,
                                    color: Colors.white,
                                  ),
                                  SizedBox(
                                    width: 15.w,
                                  ),
                                  Icon(
                                    Icons.share,
                                    color: Colors.white,
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.only(
                          left: 5.w,
                        ),
                        color: const Color.fromARGB(255, 217, 243, 187),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Expanded(
                              child: Stack(
                                alignment: Alignment.center,
                                children: [
                                  Image.asset(
                                    'assets/images/tag.png',
                                    height: 50.h,
                                    width: MediaQuery.sizeOf(context).width / 2,
                                    fit: BoxFit.cover,
                                  ),
                                  defaultText(
                                      txt: 'خصم 20% علي علاجات وآمصال',
                                      fontSize: 11.sp,
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold),
                                ],
                              ),
                            ),
                            Expanded(
                              child: defaultText(
                                  txt: 'احادي نيوكلونيد النيكوتيناميد',
                                  fontSize: 11.sp,
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold),
                            ),
                          ],
                        ),
                      ),

                      // Row(
                      //   children: [
                      //     Expanded(
                      //       child: Container(
                      //         padding: EdgeInsets.only(left: 5.w, right: 5.w),
                      //         height: 60.h,
                      //         // width: double.infinity,
                      //         decoration: BoxDecoration(
                      //             color:
                      //                 const Color.fromARGB(255, 206, 241, 208)),
                      //         child: Center(
                      //           child: defaultText(
                      //               txt:
                      //                   'خصم ١٥٪ علي الطلبات التي تزيد قيمتها عن  60\$ .  ',
                      //               fontSize: 13.sp,
                      //               color: AppColors.textColor,
                      //               fontWeight: FontWeight.bold),
                      //         ),
                      //       ),
                      //     ),
                      //     Expanded(
                      //       child: Container(
                      //         padding: EdgeInsets.only(left: 5.w, right: 5.w),
                      //         height: 60.h,
                      //         // width: double.infinity,
                      //         decoration:
                      //             BoxDecoration(color: AppColors.redColor),
                      //         child: Center(
                      //           child: defaultText(
                      //               txt: 'خصم 30٪ علي بروتين مصل اللبن  ',
                      //               fontSize: 13.sp,
                      //               color: Colors.white,
                      //               fontWeight: FontWeight.bold),
                      //         ),
                      //       ),
                      //     ),
                      //   ],
                      // ),

                      SizedBox(
                        height: 15.h,
                      ),
                      Container(
                        height: 490.h,
                        child: ListView(
                          padding: EdgeInsets.zero,
                          shrinkWrap: true,
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: [
                                CarouselSlider(
                                    items: items
                                        .map((e) => Container(
                                              height: 140.h,
                                              decoration: BoxDecoration(
                                                  borderRadius:
                                                      BorderRadius.circular(14),
                                                  image: DecorationImage(
                                                      fit: BoxFit.cover,
                                                      image: AssetImage(e))),
                                            ))
                                        .toList(),
                                    options: CarouselOptions(
                                      clipBehavior: Clip.antiAlias,
                                      height: 140,
                                      aspectRatio: 16 / 9,
                                      viewportFraction: 0.8,
                                      initialPage: 0,
                                      enableInfiniteScroll: true,
                                      reverse: true,
                                      autoPlay: true,
                                      autoPlayInterval: Duration(seconds: 3),
                                      autoPlayAnimationDuration:
                                          Duration(milliseconds: 800),
                                      autoPlayCurve: Curves.fastOutSlowIn,
                                      enlargeCenterPage: true,
                                      enlargeFactor: 0.3,
                                      onPageChanged:
                                          (int value, onPageChanged) {
                                        setState(() {
                                          index1 = value;
                                        });
                                      },
                                      scrollDirection: Axis.horizontal,
                                    )),
                                SizedBox(
                                  height: 10.h,
                                ),
                                Center(
                                  child: AnimatedSmoothIndicator(
                                      activeIndex: index1,
                                      effect: ExpandingDotsEffect(
                                          dotColor: Colors.grey,
                                          activeDotColor: AppColors.mainColor,
                                          dotHeight: 10.h,
                                          dotWidth: 10.w),
                                      count: items.length),
                                ),
                                SizedBox(
                                  height: 25.h,
                                ),
                                Container(
                                    margin: EdgeInsets.only(
                                        left: 12.w, right: 12.w),
                                    padding: EdgeInsets.only(
                                        right: 10.w,
                                        left: 10.w,
                                        top: 10.h,
                                        bottom: 10.h),
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(12),
                                      color: Colors.white,
                                      border: Border.all(width: .1),
                                      boxShadow: [
                                        BoxShadow(
                                            offset: Offset(0, 6),
                                            spreadRadius: 4,
                                            color: Colors.grey.shade300,
                                            blurRadius: 3)
                                      ],
                                    ),
                                    child: Column(
                                      children: [
                                        RichText(
                                          textAlign: TextAlign.center,
                                          textDirection: TextDirection.rtl,
                                          text: TextSpan(
                                            style: TextStyle(
                                              color: Colors.black,
                                              fontFamily: 'Tajawal',
                                            ),
                                            children: [
                                              TextSpan(
                                                text:
                                                    ' مرحبا بك ، يرجي تسجيل الدخول حتي نتمكن من تخصيص تجربتك علي  ',
                                              ),
                                              TextSpan(
                                                text: AppConst.kAppName,
                                              ),
                                            ],
                                          ),
                                        ),
                                        SizedBox(
                                          height: 5.h,
                                        ),
                                        InkWell(
                                          onTap: () {
                                            nextPage(context, Login());
                                          },
                                          child: defaultText(
                                              txt:
                                                  'قم بانشاء الحساب او تسجيل الدخول',
                                              fontSize: 15.sp,
                                              color: AppColors.blueColor,
                                              fontWeight: FontWeight.bold),
                                        )
                                      ],
                                    )),
                                SizedBox(
                                  height: 25.h,
                                ),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Container(
                                      padding: EdgeInsets.only(
                                          right: 10.w,
                                          left: 10.w,
                                          top: 10.h,
                                          bottom: 10.h),
                                      decoration: BoxDecoration(
                                        color: Colors.white,
                                        boxShadow: [
                                          BoxShadow(
                                              offset: Offset(0, 6),
                                              spreadRadius: 4,
                                              color: Colors.grey.shade300,
                                              blurRadius: 3)
                                        ],
                                      ),
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          defaultText(
                                              txt: 'تم عرضها مؤخرآ',
                                              fontSize: 18.sp,
                                              fontWeight: FontWeight.bold),
                                          SizedBox(
                                            height: 15.h,
                                          ),
                                          Container(
                                            height: 130.h,
                                            child: ListView.separated(
                                                scrollDirection:
                                                    Axis.horizontal,
                                                itemBuilder: (context, index) =>
                                                    Container(
                                                      // height: 240.h,
                                                      width: 130.w,
                                                      decoration: BoxDecoration(
                                                        color: Colors.white,
                                                      ),
                                                      child: GetLaterProducts(
                                                        index: index,
                                                      ),
                                                    ),
                                                separatorBuilder:
                                                    (context, index) =>
                                                        SizedBox(
                                                          width: 15.w,
                                                        ),
                                                itemCount:
                                                    imageItemLater.length),
                                          )
                                        ],
                                      ),
                                    ),
                                    SizedBox(
                                      height: 30.h,
                                    ),
                                    Container(
                                      padding: EdgeInsets.only(
                                          right: 10.w,
                                          left: 10.w,
                                          top: 10.h,
                                          bottom: 10.h),
                                      decoration: BoxDecoration(
                                        color: Colors.white,
                                        boxShadow: [
                                          BoxShadow(
                                              offset: Offset(0, 6),
                                              spreadRadius: 4,
                                              color: Colors.grey.shade300,
                                              blurRadius: 3)
                                        ],
                                      ),
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          defaultText(
                                              txt: 'ينصح بها لاجلك',
                                              fontSize: 18.sp,
                                              fontWeight: FontWeight.bold),
                                          SizedBox(
                                            height: 15.h,
                                          ),
                                          Container(
                                            height: 270.h,
                                            child: ListView.separated(
                                                scrollDirection:
                                                    Axis.horizontal,
                                                itemBuilder: (context, index) =>
                                                    Container(
                                                      // height: 240.h,
                                                      width: 130.w,
                                                      decoration: BoxDecoration(
                                                        color: Colors.white,
                                                      ),
                                                      child: GetProducts(
                                                        index: index,
                                                      ),
                                                    ),
                                                separatorBuilder:
                                                    (context, index) =>
                                                        SizedBox(
                                                          width: 15.w,
                                                        ),
                                                itemCount:
                                                    imageItemForYou.length),
                                          )
                                        ],
                                      ),
                                    ),
                                    SizedBox(
                                      height: 30.h,
                                    ),

                                    Container(
                                        padding: EdgeInsets.only(
                                            right: 10.w,
                                            left: 10.w,
                                            top: 10.h,
                                            bottom: 10.h),
                                        decoration: BoxDecoration(
                                          color: Colors.white,
                                          boxShadow: [
                                            BoxShadow(
                                                offset: Offset(0, 6),
                                                spreadRadius: 4,
                                                color: Colors.grey.shade300,
                                                blurRadius: 3)
                                          ],
                                        ),
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            defaultText(
                                                txt: 'التسوق حسب الفئــــــة',
                                                fontSize: 18.sp,
                                                fontWeight: FontWeight.bold),
                                            SizedBox(
                                              height: 20.h,
                                            ),
                                            Container(
                                              height: 320.h,
                                              child: GridView.builder(
                                                padding: EdgeInsets.zero,
                                                physics:
                                                    NeverScrollableScrollPhysics(),
                                                shrinkWrap: true,
                                                semanticChildCount: 2,
                                                gridDelegate:
                                                    SliverGridDelegateWithFixedCrossAxisCount(
                                                        crossAxisCount: 3,
                                                        childAspectRatio: 1 / 1,
                                                        crossAxisSpacing: 15,
                                                        mainAxisSpacing: 15),
                                                itemBuilder: (context, index) =>
                                                    InkWell(
                                                  onTap: () {
                                                    nextPage(context,
                                                        ProductsScreen());
                                                  },
                                                  child: Container(
                                                    height: 100.h,
                                                    child: Column(
                                                      children: [
                                                        Stack(
                                                          alignment:
                                                              Alignment.center,
                                                          children: [
                                                            Container(
                                                              height: 60.h,
                                                              width: 60.w,
                                                              decoration: BoxDecoration(
                                                                  shape: BoxShape
                                                                      .circle,
                                                                  border: Border.all(
                                                                      width: 4,
                                                                      color: Colors
                                                                          .grey
                                                                          .shade200)),
                                                            ),
                                                            Image.asset(
                                                              categoryList[
                                                                      index]
                                                                  .image
                                                                  .toString(),
                                                              height: 30.h,
                                                              width: 30.w,
                                                            )
                                                          ],
                                                        ),
                                                        SizedBox(
                                                          height: 1.h,
                                                        ),
                                                        Container(
                                                          width: 100.w,
                                                          child: Center(
                                                            child: defaultText(
                                                                txt:
                                                                    '${categoryList[index].name}',
                                                                fontSize: 12.sp,
                                                                // color: AppColors
                                                                //     .blueColor,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .normal),
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                ),
                                                itemCount: 8,
                                              ),
                                            )
                                          ],
                                        )),
                                    SizedBox(
                                      height: 25.h,
                                    ),
                                    Container(
                                      padding: EdgeInsets.only(
                                          right: 10.w,
                                          left: 10.w,
                                          top: 10.h,
                                          bottom: 10.h),
                                      decoration: BoxDecoration(
                                        color: Colors.white,
                                        boxShadow: [
                                          BoxShadow(
                                              offset: Offset(0, 6),
                                              spreadRadius: 4,
                                              color: Colors.grey.shade300,
                                              blurRadius: 3)
                                        ],
                                      ),
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.end,
                                        children: [
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              defaultText(
                                                  txt: 'عروض منتقاه من اجلك',
                                                  fontSize: 18.sp,
                                                  fontWeight: FontWeight.bold),
                                              InkWell(
                                                onTap: () {
                                                  nextPage(context,
                                                      ProductsForYouScreen());
                                                },
                                                child: Icon(
                                                  Icons.arrow_forward_ios,
                                                  size: 15,
                                                ),
                                              ),
                                            ],
                                          ),
                                          SizedBox(
                                            height: 15.h,
                                          ),
                                          Container(
                                            height: 270.h,
                                            child: ListView.separated(
                                                scrollDirection:
                                                    Axis.horizontal,
                                                itemBuilder: (context, index) =>
                                                    Container(
                                                      // height: 240.h,
                                                      width: 130.w,
                                                      decoration: BoxDecoration(
                                                        color: Colors.white,
                                                      ),
                                                      child: GetProducts(
                                                        index: index,
                                                      ),
                                                    ),
                                                separatorBuilder:
                                                    (context, index) =>
                                                        SizedBox(
                                                          width: 15.w,
                                                        ),
                                                itemCount: imageItem.length),
                                          )
                                        ],
                                      ),
                                    ),
                                    SizedBox(
                                      height: 30.h,
                                    ),
                                    Container(
                                      padding: EdgeInsets.only(
                                          right: 10.w,
                                          left: 10.w,
                                          top: 10.h,
                                          bottom: 10.h),
                                      decoration: BoxDecoration(
                                        color: Colors.white,
                                        boxShadow: [
                                          BoxShadow(
                                              offset: Offset(0, 6),
                                              spreadRadius: 4,
                                              color: Colors.grey.shade300,
                                              blurRadius: 3)
                                        ],
                                      ),
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.end,
                                        children: [
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              defaultText(
                                                  txt:
                                                      'مستوحي من سجل تصفحك في بروبيوتك',
                                                  fontSize: 18.sp,
                                                  fontWeight: FontWeight.bold),
                                              Icon(
                                                Icons.arrow_forward_ios,
                                                size: 15,
                                              ),
                                            ],
                                          ),
                                          SizedBox(
                                            height: 20.h,
                                          ),
                                          Container(
                                            height: 520.h,
                                            child: GridView.builder(
                                                physics:
                                                    NeverScrollableScrollPhysics(),
                                                gridDelegate:
                                                    SliverGridDelegateWithFixedCrossAxisCount(
                                                        crossAxisCount: 2,
                                                        crossAxisSpacing: 10,
                                                        mainAxisSpacing: 10,
                                                        childAspectRatio:
                                                            1 / 1.55),
                                                itemBuilder: (context, index) =>
                                                    Container(
                                                      // height: 240.h,
                                                      width: 130.w,
                                                      decoration: BoxDecoration(
                                                        color: Colors.white,
                                                      ),
                                                      child:
                                                          GetProductsChoosenForYou(
                                                              index: index),
                                                    ),
                                                itemCount: 4),
                                          ),
                                          Center(
                                            child: Container(
                                              padding: EdgeInsets.all(10),
                                              height: 50.h,
                                              width: double.infinity,
                                              decoration: BoxDecoration(
                                                  borderRadius:
                                                      BorderRadius.circular(14),
                                                  border: Border.all(width: .2),
                                                  color: Colors.white),
                                              child: Center(
                                                child: defaultText(
                                                    txt: 'استكشف المزيد',
                                                    fontWeight:
                                                        FontWeight.bold),
                                              ),
                                            ),
                                          )
                                        ],
                                      ),
                                    ),
                                    SizedBox(
                                      height: 30.h,
                                    ),
                                    Container(
                                      padding: EdgeInsets.only(
                                          right: 10.w,
                                          left: 10.w,
                                          top: 10.h,
                                          bottom: 10.h),
                                      decoration: BoxDecoration(
                                        color: Colors.white,
                                        boxShadow: [
                                          BoxShadow(
                                              offset: Offset(0, 6),
                                              spreadRadius: 4,
                                              color: Colors.grey.shade300,
                                              blurRadius: 3)
                                        ],
                                      ),
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.end,
                                        children: [
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              defaultText(
                                                  txt:
                                                      'مستوحي من التفكير في البنكرياتين',
                                                  fontSize: 17.sp,
                                                  fontWeight: FontWeight.bold),
                                              Icon(
                                                Icons.arrow_forward_ios,
                                                size: 15,
                                              ),
                                            ],
                                          ),
                                          SizedBox(
                                            height: 20.h,
                                          ),
                                          Container(
                                            height: 520.h,
                                            child: GridView.builder(
                                                physics:
                                                    NeverScrollableScrollPhysics(),
                                                gridDelegate:
                                                    SliverGridDelegateWithFixedCrossAxisCount(
                                                        crossAxisCount: 2,
                                                        crossAxisSpacing: 10,
                                                        mainAxisSpacing: 10,
                                                        childAspectRatio:
                                                            1 / 1.55),
                                                itemBuilder: (context, index) =>
                                                    Container(
                                                      // height: 240.h,
                                                      width: 130.w,
                                                      decoration: BoxDecoration(
                                                        color: Colors.white,
                                                      ),
                                                      child:
                                                          GetProductsChoosenForYou(
                                                        index: index,
                                                      ),
                                                    ),
                                                itemCount: imageItemPro.length),
                                          ),
                                          Center(
                                            child: Container(
                                              padding: EdgeInsets.all(10),
                                              height: 50.h,
                                              width: double.infinity,
                                              decoration: BoxDecoration(
                                                  borderRadius:
                                                      BorderRadius.circular(14),
                                                  border: Border.all(width: .2),
                                                  color: Colors.white),
                                              child: Center(
                                                child: defaultText(
                                                    txt: 'استكشف المزيد',
                                                    fontWeight:
                                                        FontWeight.bold),
                                              ),
                                            ),
                                          )
                                        ],
                                      ),
                                    ),
                                    SizedBox(
                                      height: 30.h,
                                    ),
                                    Container(
                                      padding: EdgeInsets.all(10),
                                      margin: EdgeInsets.only(
                                          left: 10.w, right: 10.w),
                                      height: 100.h,
                                      width: double.infinity,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(15),
                                        color: AppColors.mainColor,
                                      ),
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.end,
                                        children: [
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              defaultText(
                                                  txt: 'الحصول علي الاشعارات',
                                                  fontSize: 18.sp,
                                                  fontWeight: FontWeight.bold,
                                                  color: Colors.white),
                                              Icon(
                                                Icons.clear,
                                                color: Colors.white,
                                              ),
                                            ],
                                          ),
                                          SizedBox(
                                            height: 10.h,
                                          ),
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              defaultText(
                                                  txt:
                                                      'لا تفوت اي عروضنا وصفقاتنا',
                                                  fontSize: 15.sp,
                                                  fontWeight: FontWeight.bold,
                                                  color: Colors.white),
                                              Switch(
                                                  materialTapTargetSize:
                                                      MaterialTapTargetSize
                                                          .shrinkWrap,
                                                  mouseCursor:
                                                      MaterialStateMouseCursor
                                                          .textable,
                                                  trackOutlineColor:
                                                      MaterialStatePropertyAll(
                                                          Colors.blueGrey),
                                                  inactiveTrackColor:
                                                      Colors.grey,
                                                  activeTrackColor:
                                                      Colors.white,
                                                  activeColor:
                                                      Colors.orangeAccent,
                                                  focusColor:
                                                      Colors.grey.shade200,
                                                  value: swichVal,
                                                  onChanged: (val) {
                                                    setState(() {
                                                      swichVal = val;
                                                    });
                                                  }),
                                            ],
                                          )
                                        ],
                                      ),
                                    ),
                                    SizedBox(
                                      height: 30.h,
                                    ),
                                    //       SizedBox(
                                    //   height: 25.h,
                                    // ),
                                    Container(
                                        // margin: EdgeInsets.only(
                                        //     left: 12.w, right: 12.w),
                                        padding: EdgeInsets.only(
                                            right: 10.w,
                                            left: 10.w,
                                            top: 10.h,
                                            bottom: 10.h),
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(12),
                                          color: Colors.white,
                                          // border: Border.all(width: .1),
                                          boxShadow: [
                                            BoxShadow(
                                                offset: Offset(0, 6),
                                                spreadRadius: 4,
                                                color: Colors.grey.shade300,
                                                blurRadius: 3)
                                          ],
                                        ),
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            defaultText(
                                                txt: 'اخترنا لك',
                                                fontSize: 18.sp,
                                                fontWeight: FontWeight.bold),
                                            SizedBox(
                                              height: 15.h,
                                            ),
                                            Container(
                                              height: 40.h,
                                              child: ListView.separated(
                                                  scrollDirection:
                                                      Axis.horizontal,
                                                  itemBuilder:
                                                      (context, index) =>
                                                          InkWell(
                                                            onTap: () {},
                                                            child: Container(
                                                              height: 40.h,
                                                              decoration: BoxDecoration(
                                                                  borderRadius:
                                                                      BorderRadius
                                                                          .circular(
                                                                              14),
                                                                  color: Colors
                                                                      .grey
                                                                      .shade100),
                                                              child: Center(
                                                                child: defaultText(
                                                                    txt: '   ${chooseList[index]}  ',
                                                                    fontSize: 14.sp,
                                                                    // color: AppColors
                                                                    //     .blueColor,
                                                                    fontWeight: FontWeight.normal),
                                                              ),
                                                            ),
                                                          ),
                                                  separatorBuilder:
                                                      (context, index) =>
                                                          SizedBox(
                                                            width: 15.w,
                                                          ),
                                                  itemCount: chooseList.length),
                                            )
                                          ],
                                        )),
                                    SizedBox(
                                      height: 30.h,
                                    ),
                                    Container(
                                      padding: EdgeInsets.only(
                                          right: 10.w,
                                          left: 10.w,
                                          top: 10.h,
                                          bottom: 10.h),
                                      decoration: BoxDecoration(
                                        color: Colors.white,
                                        boxShadow: [
                                          BoxShadow(
                                              offset: Offset(0, 6),
                                              spreadRadius: 4,
                                              color: Colors.grey.shade300,
                                              blurRadius: 3)
                                        ],
                                      ),
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.end,
                                        children: [
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              defaultText(
                                                  txt: 'الجديـــــــد',
                                                  fontSize: 18.sp,
                                                  fontWeight: FontWeight.bold),
                                              Icon(
                                                Icons.arrow_forward_ios,
                                                size: 15,
                                              ),
                                            ],
                                          ),
                                          SizedBox(
                                            height: 15.h,
                                          ),
                                          Container(
                                            height: 270.h,
                                            child: ListView.separated(
                                                scrollDirection:
                                                    Axis.horizontal,
                                                itemBuilder: (context, index) =>
                                                    Container(
                                                      // height: 240.h,
                                                      width: 130.w,
                                                      decoration: BoxDecoration(
                                                        color: Colors.white,
                                                      ),
                                                      child: GetProducts(
                                                        index: index,
                                                      ),
                                                    ),
                                                separatorBuilder:
                                                    (context, index) =>
                                                        SizedBox(
                                                          width: 15.w,
                                                        ),
                                                itemCount: imageItem.length),
                                          )
                                        ],
                                      ),
                                    ),
                                    SizedBox(
                                      height: 25.h,
                                    ),

                                    Container(
                                        padding: EdgeInsets.only(
                                            right: 10.w,
                                            left: 10.w,
                                            top: 10.h,
                                            bottom: 10.h),
                                        decoration: BoxDecoration(
                                          color: Colors.white,
                                          boxShadow: [
                                            BoxShadow(
                                                offset: Offset(0, 6),
                                                spreadRadius: 4,
                                                color: Colors.grey.shade300,
                                                blurRadius: 3)
                                          ],
                                        ),
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            defaultText(
                                                txt:
                                                    'التسوق حسب موضوع عن الصحه',
                                                fontSize: 18.sp,
                                                fontWeight: FontWeight.bold),
                                            SizedBox(
                                              height: 20.h,
                                            ),
                                            Container(
                                              height: 350.h,
                                              child: GridView.builder(
                                                padding: EdgeInsets.zero,
                                                physics:
                                                    NeverScrollableScrollPhysics(),
                                                shrinkWrap: true,
                                                semanticChildCount: 2,
                                                gridDelegate:
                                                    SliverGridDelegateWithFixedCrossAxisCount(
                                                        crossAxisCount: 3,
                                                        childAspectRatio:
                                                            1 / 1.13,
                                                        crossAxisSpacing: 15,
                                                        mainAxisSpacing: 15),
                                                itemBuilder: (context, index) =>
                                                    Column(
                                                  children: [
                                                    Stack(
                                                      alignment:
                                                          Alignment.center,
                                                      children: [
                                                        Container(
                                                          height: 70.h,
                                                          width: 70.w,
                                                          decoration:
                                                              BoxDecoration(
                                                                  shape: BoxShape
                                                                      .circle,
                                                                  color: Colors
                                                                      .grey
                                                                      .shade200),
                                                        ),
                                                        Image.asset(
                                                          healthList[index]
                                                              .image
                                                              .toString(),
                                                          height: 40.h,
                                                          width: 40.w,
                                                          color: AppColors
                                                              .mainColor,
                                                        ),
                                                      ],
                                                    ),
                                                    defaultText(
                                                      txt: healthList[index]
                                                          .name
                                                          .toString(),
                                                      fontSize: 14.sp,
                                                    )
                                                  ],
                                                ),
                                                itemCount: 8,
                                              ),
                                            )
                                          ],
                                        )),
                                    SizedBox(
                                      height: 30.h,
                                    ),

                                    Container(
                                        // margin: EdgeInsets.only(
                                        //     left: 12.w, right: 12.w),
                                        padding: EdgeInsets.only(
                                            right: 10.w,
                                            left: 10.w,
                                            top: 10.h,
                                            bottom: 10.h),
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(12),
                                          color: Colors.white,
                                          // border: Border.all(width: .1),
                                          boxShadow: [
                                            BoxShadow(
                                                offset: Offset(0, 6),
                                                spreadRadius: 4,
                                                color: Colors.grey.shade300,
                                                blurRadius: 3)
                                          ],
                                        ),
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                Row(
                                                  children: [
                                                    defaultText(
                                                        txt: 'الافضل مبيعا',
                                                        fontSize: 18.sp,
                                                        fontWeight:
                                                            FontWeight.bold),
                                                    SizedBox(
                                                      width: 15.w,
                                                    ),
                                                    Container(
                                                      padding: EdgeInsets.only(
                                                          left: 10.w,
                                                          right: 10.w),
                                                      height: 37.h,
                                                      width: 90.w,
                                                      decoration: BoxDecoration(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(13),
                                                        border: Border.all(
                                                            width: .1),
                                                      ),
                                                      child: Row(
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .spaceBetween,
                                                        children: [
                                                          Center(
                                                            child: defaultText(
                                                                txt: 'مصــر',
                                                                fontSize: 13.sp,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .bold),
                                                          ),
                                                          Icon(
                                                            CupertinoIcons
                                                                .chevron_down,
                                                            size: 15,
                                                          ),
                                                        ],
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                                Icon(
                                                  Icons.arrow_forward_ios,
                                                  size: 17,
                                                ),
                                              ],
                                            ),
                                            SizedBox(
                                              height: 15.h,
                                            ),
                                            Container(
                                              height: 35.h,
                                              child: ListView.separated(
                                                  scrollDirection:
                                                      Axis.horizontal,
                                                  itemBuilder:
                                                      (context, index) =>
                                                          InkWell(
                                                            onTap: () {},
                                                            child: Container(
                                                              height: 35.h,
                                                              decoration: BoxDecoration(
                                                                  borderRadius:
                                                                      BorderRadius
                                                                          .circular(
                                                                              14),
                                                                  color: Colors
                                                                      .grey
                                                                      .shade100),
                                                              child: Center(
                                                                child: defaultText(
                                                                    txt: '   ${bestSellerList[index]}     ',
                                                                    fontSize: 14.sp,
                                                                    // color: AppColors
                                                                    //     .blueColor,
                                                                    fontWeight: FontWeight.normal),
                                                              ),
                                                            ),
                                                          ),
                                                  separatorBuilder:
                                                      (context, index) =>
                                                          SizedBox(
                                                            width: 15.w,
                                                          ),
                                                  itemCount:
                                                      bestSellerList.length),
                                            ),
                                            SizedBox(
                                              height: 20.h,
                                            ),
                                            Container(
                                              height: 270.h,
                                              child: ListView.separated(
                                                  scrollDirection:
                                                      Axis.horizontal,
                                                  itemBuilder: (context,
                                                          index) =>
                                                      Container(
                                                        // height: 240.h,
                                                        width: 130.w,
                                                        decoration:
                                                            BoxDecoration(
                                                          color: Colors.white,
                                                        ),
                                                        child: GetProducts(
                                                          index: index,
                                                        ),
                                                      ),
                                                  separatorBuilder:
                                                      (context, index) =>
                                                          SizedBox(
                                                            width: 15.w,
                                                          ),
                                                  itemCount: imageItem.length),
                                            )
                                          ],
                                        )),

                                    SizedBox(
                                      height: 30.h,
                                    ),

                                    Container(
                                        // margin: EdgeInsets.only(
                                        //     left: 12.w, right: 12.w),
                                        padding: EdgeInsets.only(
                                            right: 10.w,
                                            left: 10.w,
                                            top: 10.h,
                                            bottom: 10.h),
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(12),
                                          color: Colors.white,
                                          // border: Border.all(width: .1),
                                          boxShadow: [
                                            BoxShadow(
                                                offset: Offset(0, 6),
                                                spreadRadius: 4,
                                                color: Colors.grey.shade300,
                                                blurRadius: 3)
                                          ],
                                        ),
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Row(
                                              children: [
                                                Row(
                                                  children: [
                                                    defaultText(
                                                        txt:
                                                            'الاكثر تداولا اليوم',
                                                        fontSize: 18.sp,
                                                        fontWeight:
                                                            FontWeight.bold),
                                                    SizedBox(
                                                      width: 5.w,
                                                    ),
                                                    Icon(Icons.info_outline)
                                                  ],
                                                ),
                                                SizedBox(
                                                  width: 15.w,
                                                ),
                                                Container(
                                                  padding: EdgeInsets.only(
                                                      left: 10.w, right: 10.w),
                                                  height: 37.h,
                                                  width: 90.w,
                                                  decoration: BoxDecoration(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            13),
                                                    border:
                                                        Border.all(width: .1),
                                                  ),
                                                  child: Row(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .spaceBetween,
                                                    children: [
                                                      Center(
                                                        child: defaultText(
                                                            txt: 'مصــر',
                                                            fontSize: 13.sp,
                                                            fontWeight:
                                                                FontWeight
                                                                    .bold),
                                                      ),
                                                      Icon(
                                                        CupertinoIcons
                                                            .chevron_down,
                                                        size: 15,
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                              ],
                                            ),
                                            SizedBox(
                                              height: 20.h,
                                            ),
                                            Container(
                                              height: 270.h,
                                              child: ListView.separated(
                                                  scrollDirection:
                                                      Axis.horizontal,
                                                  itemBuilder: (context,
                                                          index) =>
                                                      Container(
                                                        // height: 240.h,
                                                        width: 130.w,
                                                        decoration:
                                                            BoxDecoration(
                                                          color: Colors.white,
                                                        ),
                                                        child: GetProducts(
                                                          index: index,
                                                        ),
                                                      ),
                                                  separatorBuilder:
                                                      (context, index) =>
                                                          SizedBox(
                                                            width: 15.w,
                                                          ),
                                                  itemCount: imageItem.length),
                                            )
                                          ],
                                        )),

                                    SizedBox(
                                      height: 30.h,
                                    ),
                                    Container(
                                        // margin: EdgeInsets.only(
                                        //     left: 12.w, right: 12.w),
                                        padding: EdgeInsets.only(
                                            right: 10.w,
                                            left: 10.w,
                                            top: 10.h,
                                            bottom: 10.h),
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(12),
                                          color: Colors.white,
                                          // border: Border.all(width: .1),
                                          boxShadow: [
                                            BoxShadow(
                                                offset: Offset(0, 6),
                                                spreadRadius: 4,
                                                color: Colors.grey.shade300,
                                                blurRadius: 3)
                                          ],
                                        ),
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                Row(
                                                  children: [
                                                    defaultText(
                                                        txt: AppConst.kAppName,
                                                        fontSize: 18.sp,
                                                        color:
                                                            AppColors.blueColor,
                                                        fontWeight:
                                                            FontWeight.bold),
                                                    defaultText(
                                                        txt: ' | ',
                                                        fontSize: 18.sp,
                                                        fontWeight:
                                                            FontWeight.bold),
                                                    defaultText(
                                                        txt: 'المدونة',
                                                        fontSize: 18.sp,
                                                        fontWeight:
                                                            FontWeight.bold),
                                                  ],
                                                ),
                                                Icon(
                                                  Icons.arrow_forward_ios,
                                                  size: 15,
                                                )
                                              ],
                                            ),
                                            SizedBox(
                                              height: 20.h,
                                            ),
                                            Container(
                                              // padding: EdgeInsets.only(
                                              //     left: 12.w, right: 12.w),
                                              // margin: EdgeInsets.only(
                                              //     left: 12.w, right: 12.w),
                                              height: 250.h,
                                              width: double.infinity,
                                              decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(13),
                                              ),
                                              child: Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  Container(
                                                    height: 180.h,
                                                    width: double.infinity,
                                                    decoration: BoxDecoration(
                                                      borderRadius:
                                                          BorderRadius.only(
                                                        topLeft:
                                                            Radius.circular(15),
                                                        topRight:
                                                            Radius.circular(15),
                                                      ),
                                                      image: DecorationImage(
                                                          fit: BoxFit.cover,
                                                          image: AssetImage(
                                                              'assets/images/health.jpg')),
                                                    ),
                                                  ),
                                                  SizedBox(
                                                    height: 5.h,
                                                  ),
                                                  defaultText(
                                                      txt: 'صحة',
                                                      color:
                                                          AppColors.blueColor,
                                                      fontSize: 14.sp,
                                                      fontWeight:
                                                          FontWeight.bold),
                                                  Text(
                                                    '3 طرق طبيعية لتقليل اعراض الحساسيه والمزيد',
                                                    maxLines: 2,
                                                    overflow:
                                                        TextOverflow.ellipsis,
                                                    textAlign: TextAlign.center,
                                                    style: TextStyle(
                                                      fontFamily: 'Tajawal',
                                                      fontSize: 14,
                                                      fontWeight:
                                                          FontWeight.bold,
                                                    ),
                                                  )
                                                ],
                                              ),
                                            ),
                                            SizedBox(
                                              height: 10.h,
                                            ),
                                            Row(
                                              children: [
                                                Expanded(
                                                  child: Container(
                                                    height: 250.h,
                                                    // width: double.infinity,
                                                    decoration: BoxDecoration(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              13),
                                                    ),
                                                    child: Column(
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .start,
                                                      children: [
                                                        Container(
                                                          height: 180.h,
                                                          width:
                                                              double.infinity,
                                                          decoration:
                                                              BoxDecoration(
                                                            borderRadius:
                                                                BorderRadius
                                                                    .only(
                                                              topLeft: Radius
                                                                  .circular(15),
                                                              topRight: Radius
                                                                  .circular(15),
                                                            ),
                                                            image: DecorationImage(
                                                                fit: BoxFit
                                                                    .cover,
                                                                image: AssetImage(
                                                                    'assets/images/life.jpg')),
                                                          ),
                                                        ),
                                                        SizedBox(
                                                          height: 5.h,
                                                        ),
                                                        defaultText(
                                                            txt: 'صحة',
                                                            color: AppColors
                                                                .blueColor,
                                                            fontSize: 14.sp,
                                                            fontWeight:
                                                                FontWeight
                                                                    .bold),
                                                        Text(
                                                          'افضل اشكال مكملات الفيتامينات : حبوب ام حقن',
                                                          maxLines: 2,
                                                          overflow: TextOverflow
                                                              .ellipsis,
                                                          textAlign:
                                                              TextAlign.center,
                                                          style: TextStyle(
                                                            fontFamily:
                                                                'Tajawal',
                                                            fontSize: 14,
                                                            fontWeight:
                                                                FontWeight.bold,
                                                          ),
                                                        )
                                                      ],
                                                    ),
                                                  ),
                                                ),
                                                SizedBox(
                                                  width: 15.w,
                                                ),
                                                Expanded(
                                                  child: Container(
                                                    height: 250.h,
                                                    // width: double.infinity,
                                                    decoration: BoxDecoration(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              13),
                                                    ),
                                                    child: Column(
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .start,
                                                      children: [
                                                        Container(
                                                          height: 180.h,
                                                          width:
                                                              double.infinity,
                                                          decoration:
                                                              BoxDecoration(
                                                            borderRadius:
                                                                BorderRadius
                                                                    .only(
                                                              topLeft: Radius
                                                                  .circular(15),
                                                              topRight: Radius
                                                                  .circular(15),
                                                            ),
                                                            image: DecorationImage(
                                                                fit: BoxFit
                                                                    .cover,
                                                                image: AssetImage(
                                                                    'assets/images/nutration.jpg')),
                                                          ),
                                                        ),
                                                        SizedBox(
                                                          height: 5.h,
                                                        ),
                                                        defaultText(
                                                            txt: 'تغذيه',
                                                            color: AppColors
                                                                .blueColor,
                                                            fontSize: 14.sp,
                                                            fontWeight:
                                                                FontWeight
                                                                    .bold),
                                                        Text(
                                                          'الفوائد الصحية للمورينجا + وصفات سهله',
                                                          maxLines: 2,
                                                          overflow: TextOverflow
                                                              .ellipsis,
                                                          textAlign:
                                                              TextAlign.center,
                                                          style: TextStyle(
                                                            fontFamily:
                                                                'Tajawal',
                                                            fontSize: 14,
                                                            fontWeight:
                                                                FontWeight.bold,
                                                          ),
                                                        )
                                                      ],
                                                    ),
                                                  ),
                                                )
                                              ],
                                            ),
                                            SizedBox(
                                              height: 10.h,
                                            ),
                                            Row(
                                              children: [
                                                Expanded(
                                                  child: Container(
                                                    height: 250.h,
                                                    // width: double.infinity,
                                                    decoration: BoxDecoration(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              13),
                                                    ),
                                                    child: Column(
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .start,
                                                      children: [
                                                        Container(
                                                          height: 180.h,
                                                          width:
                                                              double.infinity,
                                                          decoration:
                                                              BoxDecoration(
                                                            borderRadius:
                                                                BorderRadius
                                                                    .only(
                                                              topLeft: Radius
                                                                  .circular(15),
                                                              topRight: Radius
                                                                  .circular(15),
                                                            ),
                                                            image: DecorationImage(
                                                                fit: BoxFit
                                                                    .cover,
                                                                image: AssetImage(
                                                                    'assets/images/doc.jpg')),
                                                          ),
                                                        ),
                                                        SizedBox(
                                                          height: 5.h,
                                                        ),
                                                        defaultText(
                                                            txt:
                                                                'مكملات غذائية',
                                                            color: AppColors
                                                                .blueColor,
                                                            fontSize: 14.sp,
                                                            fontWeight:
                                                                FontWeight
                                                                    .bold),
                                                        Text(
                                                          'افضل اشكال مكملات الفيتامينات : حبوب ام حقن',
                                                          maxLines: 2,
                                                          overflow: TextOverflow
                                                              .ellipsis,
                                                          textAlign:
                                                              TextAlign.center,
                                                          style: TextStyle(
                                                            fontFamily:
                                                                'Tajawal',
                                                            fontSize: 14,
                                                            fontWeight:
                                                                FontWeight.bold,
                                                          ),
                                                        )
                                                      ],
                                                    ),
                                                  ),
                                                ),
                                                SizedBox(
                                                  width: 15.w,
                                                ),
                                                Expanded(
                                                  child: Container(
                                                    height: 250.h,
                                                    // width: double.infinity,
                                                    decoration: BoxDecoration(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              13),
                                                    ),
                                                    child: Column(
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .start,
                                                      children: [
                                                        Container(
                                                          height: 180.h,
                                                          width:
                                                              double.infinity,
                                                          decoration:
                                                              BoxDecoration(
                                                            borderRadius:
                                                                BorderRadius
                                                                    .only(
                                                              topLeft: Radius
                                                                  .circular(15),
                                                              topRight: Radius
                                                                  .circular(15),
                                                            ),
                                                            image: DecorationImage(
                                                                fit: BoxFit
                                                                    .cover,
                                                                image: AssetImage(
                                                                    'assets/images/doc1.jpg')),
                                                          ),
                                                        ),
                                                        SizedBox(
                                                          height: 5.h,
                                                        ),
                                                        defaultText(
                                                            txt: 'صحه',
                                                            color: AppColors
                                                                .blueColor,
                                                            fontSize: 14.sp,
                                                            fontWeight:
                                                                FontWeight
                                                                    .bold),
                                                        Text(
                                                          'الفوائد الصحية للمورينجا + وصفات سهله',
                                                          maxLines: 2,
                                                          overflow: TextOverflow
                                                              .ellipsis,
                                                          textAlign:
                                                              TextAlign.center,
                                                          style: TextStyle(
                                                            fontFamily:
                                                                'Tajawal',
                                                            fontSize: 14,
                                                            fontWeight:
                                                                FontWeight.bold,
                                                          ),
                                                        )
                                                      ],
                                                    ),
                                                  ),
                                                )
                                              ],
                                            )
                                          ],
                                        )),
                                  ],
                                ),
                              ],
                            ),
                            SizedBox(
                              height: 80.h,
                            )
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              ),
            );
          }),
    );
  }
}
