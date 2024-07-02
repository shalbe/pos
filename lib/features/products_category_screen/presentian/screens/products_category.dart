import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
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
import 'package:pos_project/features/home_screen/presentian/screens/home_screen.dart';
import 'package:pos_project/features/login/presentian/screens/login/login.dart';
import 'package:pos_project/features/products_category_screen/presentian/componant/get_blog_widget.dart';
import 'package:pos_project/features/products_category_screen/presentian/componant/get_product_category.dart';
import 'package:pos_project/features/products_category_screen/presentian/cubit/products_cubit.dart';
import 'package:pos_project/features/products_category_screen/presentian/cubit/products_state.dart';
import 'package:rate/rate.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'dart:ui' as ui;

List<String> lists = [
  "assets/images/orange_14124630.png",
  "assets/images/orange_14124630.png",
  "assets/images/orange_14124630.png",
  "assets/images/orange_14124630.png",
  "assets/images/orange_14124630.png",
  "assets/images/orange_14124630.png",
  "assets/images/orange_14124630.png",
  "assets/images/orange_14124630.png",
  "assets/images/orange_14124630.png",
  "assets/images/orange_14124630.png",
  "assets/images/orange_14124630.png",
];
List<String> list = [
  "الفيتامينات",
  "معادن",
  "اعشاب",
  "دعم عمليه الهضم",
  "نوم",
  "مضادات الاكسده",
  "العظام والمفاصل والغضاريف",
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

List<String> imageItem = [
  "assets/images/7043.jpg",
  "assets/images/18813.jpg",
  "assets/images/7408210_3637294.jpg"
];

class ProductsScreen extends StatefulWidget {
  const ProductsScreen({super.key});

  @override
  State<ProductsScreen> createState() => _ProductsScreenState();
}

class _ProductsScreenState extends State<ProductsScreen> {
  int index1 = 0;
  bool swichVal = false;
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ProductsCubit(),
      child: BlocConsumer<ProductsCubit, ProductsStates>(
          listener: (context, state) {},
          builder: (context, state) {
            ProductsCubit cubit = ProductsCubit.get(context);
            return Directionality(
                textDirection: TextDirection.rtl,
                child: Scaffold(
                  body: NestedScrollView(
                    floatHeaderSlivers: true,
                    headerSliverBuilder:
                        (BuildContext context, bool innerBoxIsScrolled) {
                      return <Widget>[
                        SliverAppBar(
                          foregroundColor: Colors.white,
                          shadowColor: Colors.white,
                          backgroundColor: Colors.white,
                          expandedHeight: 330.0,
                          floating: false,
                          pinned: true,
                          titleSpacing: 1,
                          automaticallyImplyLeading: false,
                          flexibleSpace: FlexibleSpaceBar(
                            expandedTitleScale: 1.2,

                            titlePadding: EdgeInsets.only(left: 10, right: 10),
                            // centerTitle: true,
                            title: Container(
                                // margin: EdgeInsets.only(
                                //     left: 12.w, right: 12.w),
                                // padding: EdgeInsets.only(
                                //     right: 10.w,
                                //     left: 10.w,
                                //     // top: 10.h,
                                //     bottom: 10.h),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(12),
                                  color: Colors.white,
                                  // border: Border.all(width: .1),
                                  // boxShadow: [
                                  //   BoxShadow(
                                  //       offset: Offset(0, 6),
                                  //       spreadRadius: 4,
                                  //       color: Colors.grey.shade300,
                                  //       blurRadius: 3)
                                  // ],
                                ),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Row(
                                      children: [
                                        Icon(CupertinoIcons.square_grid_2x2),
                                        SizedBox(
                                          width: 10.w,
                                        ),
                                        defaultText(
                                            txt: '299920',
                                            fontSize: 14.sp,
                                            fontWeight: FontWeight.normal),
                                        SizedBox(
                                          width: 5.w,
                                        ),
                                        defaultText(
                                            txt: 'نتائج',
                                            fontSize: 14.sp,
                                            fontWeight: FontWeight.normal),
                                      ],
                                    ),
                                    SizedBox(
                                      width: 15.w,
                                    ),
                                    Container(
                                      padding: EdgeInsets.only(
                                          left: 10.w, right: 10.w),
                                      height: 37.h,
                                      width: 100.w,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(13),
                                        border: Border.all(width: .1),
                                      ),
                                      child: Center(
                                        child: defaultText(
                                            txt: 'فرز وتصنيف',
                                            fontSize: 13.sp,
                                            fontWeight: FontWeight.bold),
                                      ),
                                    ),
                                  ],
                                )),
                            background: Column(
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
                                                focusedBorder:
                                                    OutlineInputBorder(
                                                        // gapPadding: 2,
                                                        borderSide: BorderSide(
                                                            style: BorderStyle
                                                                .none,
                                                            width: .1,
                                                            color:
                                                                Colors.white),
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(
                                                          14,
                                                        )),
                                                enabledBorder:
                                                    OutlineInputBorder(
                                                        // gapPadding: 2,
                                                        borderSide: BorderSide(
                                                            style: BorderStyle
                                                                .none,
                                                            width: .1,
                                                            color:
                                                                Colors.white),
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(
                                                          14,
                                                        )),
                                                filled: true,
                                                prefixIcon: Icon(
                                                  CupertinoIcons.search,
                                                  color: Colors.grey.shade400,
                                                ),
                                                hintText: ' البحث في ' +
                                                    AppConst.kAppName,
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
                                  color:
                                      const Color.fromARGB(255, 217, 243, 187),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Expanded(
                                        child: Stack(
                                          alignment: Alignment.center,
                                          children: [
                                            Image.asset(
                                              'assets/images/tag.png',
                                              height: 50.h,
                                              width: MediaQuery.sizeOf(context)
                                                      .width /
                                                  2,
                                              fit: BoxFit.cover,
                                            ),
                                            defaultText(
                                                txt:
                                                    'خصم 20% علي علاجات وآمصال',
                                                fontSize: 12.sp,
                                                color: Colors.white,
                                                fontWeight: FontWeight.bold),
                                          ],
                                        ),
                                      ),
                                      Expanded(
                                        child: defaultText(
                                            txt:
                                                'احادي نيوكلونيد النيكوتيناميد',
                                            fontSize: 12.sp,
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
                                //         padding: EdgeInsets.only(
                                //             left: 5.w, right: 5.w),
                                //         height: 60.h,
                                //         // width: double.infinity,
                                //         decoration: BoxDecoration(
                                //             color: Color.fromARGB(
                                //                 255, 121, 67, 116)),
                                //         child: Center(
                                //           child: defaultText(
                                //               txt: 'خصم 20% علي علاجات وآمصال',
                                //               fontSize: 13.sp,
                                //               color: Colors.white,
                                //               fontWeight: FontWeight.bold),
                                //         ),
                                //       ),
                                //     ),
                                //     Expanded(
                                //       child: Container(
                                //         padding: EdgeInsets.only(
                                //             left: 5.w, right: 5.w),
                                //         height: 60.h,
                                //         // width: double.infinity,
                                //         decoration: BoxDecoration(
                                //             color: const Color.fromARGB(
                                //                 255, 159, 205, 226)),
                                //         child: Center(
                                //           child: defaultText(
                                //               txt:
                                //                   'احادي نيوكلونيد النيكوتيناميد',
                                //               fontSize: 13.sp,
                                //               color: AppColors.textColor,
                                //               fontWeight: FontWeight.bold),
                                //         ),
                                //       ),
                                //     ),
                                //   ],
                                // ),

                                SizedBox(
                                  height: 10.h,
                                ),
                                Container(
                                    // margin: EdgeInsets.only(
                                    //     left: 12.w, right: 12.w),
                                    padding: EdgeInsets.only(
                                        right: 10.w,
                                        left: 10.w,
                                        // top: 10.h,
                                        bottom: 10.h),
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(12),
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
                                            txt: 'المكملات ',
                                            fontSize: 18.sp,
                                            fontWeight: FontWeight.bold),
                                        SizedBox(
                                          height: 15.h,
                                        ),
                                        Container(
                                          height: 35.h,
                                          child: ListView.separated(
                                              scrollDirection: Axis.horizontal,
                                              itemBuilder: (context, index) =>
                                                  InkWell(
                                                    onTap: () {},
                                                    child: Container(
                                                      height: 35.h,
                                                      decoration: BoxDecoration(
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(14),
                                                          color: Colors
                                                              .grey.shade100),
                                                      child: Center(
                                                        child: defaultText(
                                                            txt:
                                                                '   ${list[index]}     ',
                                                            fontSize: 14.sp,
                                                            // color: AppColors
                                                            //     .blueColor,
                                                            fontWeight:
                                                                FontWeight
                                                                    .normal),
                                                      ),
                                                    ),
                                                  ),
                                              separatorBuilder:
                                                  (context, index) => SizedBox(
                                                        width: 15.w,
                                                      ),
                                              itemCount: list.length),
                                        ),
                                      ],
                                    )),
                              ],
                            ),
                          ),
                        ),
                      ];
                    },
                    body: Container(
                      height: 590.h,
                      child: Column(
                        children: [
                          Divider(
                            color: Colors.grey.shade300,
                            thickness: 8,
                          ),
                          Expanded(
                            // height: 560.h,
                            child: ListView.separated(
                                padding: EdgeInsets.zero,
                                // physics:
                                //     NeverScrollableScrollPhysics(),
                                // scrollDirection:
                                //     Axis.horizontal,
                                itemBuilder: (context, index) {
                                  if (index == 3) {
                                    return BlogWidget();
                                  } else {
                                    return GetProductsCategory(
                                      index: index,
                                    );
                                  }
                                },
                                separatorBuilder: (context, index) => Divider(
                                      color: Colors.grey,
                                      height: 1,
                                    ),
                                itemCount: imageItemPro.length),
                          ),
                        ],
                      ),
                    ),
                  ),
                ));
          }),
    );
  }
}
