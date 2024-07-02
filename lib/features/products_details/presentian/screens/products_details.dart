import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pos_project/core/colors/colors.dart';
import 'package:pos_project/core/componant/componant.dart';
import 'package:pos_project/core/componant/default_button.dart';
import 'package:pos_project/core/const/const.dart';
import 'package:pos_project/features/home_screen/data/%20healthy.dart';
import 'package:pos_project/features/products_category_screen/presentian/componant/get_blog_widget.dart';
import 'package:pos_project/features/products_category_screen/presentian/componant/get_product_category.dart';
import 'package:pos_project/features/products_category_screen/presentian/cubit/products_cubit.dart';
import 'package:pos_project/features/products_category_screen/presentian/cubit/products_state.dart';
import 'package:pos_project/features/products_details/presentian/cubit/products__details_state.dart';
import 'package:pos_project/features/products_details/presentian/cubit/products_details_cubit.dart';
import 'package:rate/rate.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'dart:ui' as ui;

import 'package:vertical_tab_bar_view/vertical_tab_bar_view.dart';

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

List<String> items = [
  "assets/images/omega3_1.png",
  "assets/images/omega3_2.png",
  "assets/images/omega3_3.png",
];
List<String> imageItem = [
  "assets/images/7043.jpg",
  "assets/images/18813.jpg",
  "assets/images/7408210_3637294.jpg"
];

class ProductsDetails extends StatefulWidget {
  const ProductsDetails({super.key});

  @override
  State<ProductsDetails> createState() => _ProductsDetailsState();
}

class _ProductsDetailsState extends State<ProductsDetails>
    with SingleTickerProviderStateMixin {
  int index1 = 0;
  bool swichVal = false;
  TabController? _tabController;
  late ScrollController _scrollController;
  Color _textColor = Colors.white;
  static const kExpandedHeight = 200.0;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _tabController = TabController(length: 4, vsync: this);

    _scrollController = ScrollController()
      ..addListener(() {
        setState(() {
          _textColor = _isSliverAppBarExpanded ? Colors.white : Colors.black;
        });
      });
  }

  bool get _isSliverAppBarExpanded {
    return _scrollController.hasClients &&
        _scrollController.offset > kExpandedHeight - kToolbarHeight;
  }

  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ProductsDetailsCubit(),
      child: BlocConsumer<ProductsDetailsCubit, ProductsDetailsStates>(
          listener: (context, state) {},
          builder: (context, state) {
            ProductsDetailsCubit cubit = ProductsDetailsCubit.get(context);
            return Directionality(
                textDirection: TextDirection.rtl,
                child: Scaffold(
                    body: NestedScrollView(
                  controller: _scrollController,
                  floatHeaderSlivers: true,
                  headerSliverBuilder:
                      (BuildContext context, bool innerBoxIsScrolled) {
                    return <Widget>[
                      SliverAppBar(
                        expandedHeight: 720.0,
                        floating: true,
                        pinned: true,
                        snap: true,
                        // titleSpacing: 1,
                        title: _isSliverAppBarExpanded
                            ? TabBar(controller: _tabController, tabs: [
                                defaultText(txt: 'desc'),
                                defaultText(txt: 'view'),
                                defaultText(txt: 'review'),
                                defaultText(txt: 'settings'),
                              ])
                            : null,
                        automaticallyImplyLeading: false,
                        flexibleSpace: _isSliverAppBarExpanded
                            ? null
                            : FlexibleSpaceBar(
                                // expandedTitleScale: 1.2,

                                // // titlePadding: EdgeInsets.only(left: 10, right: 10),
                                // // centerTitle: true,
                                // // title: Container(
                                // //     // margin: EdgeInsets.only(
                                // //     //     left: 12.w, right: 12.w),
                                // //     // padding: EdgeInsets.only(
                                // //     //     right: 10.w,
                                // //     //     left: 10.w,
                                // //     //     // top: 10.h,
                                // //     //     bottom: 10.h),
                                // //     decoration: BoxDecoration(
                                // //       borderRadius: BorderRadius.circular(12),
                                // //       color: Colors.white,
                                // //       // border: Border.all(width: .1),
                                // //       // boxShadow: [
                                // //       //   BoxShadow(
                                // //       //       offset: Offset(0, 6),
                                // //       //       spreadRadius: 4,
                                // //       //       color: Colors.grey.shade300,
                                // //       //       blurRadius: 3)
                                // //       // ],
                                // //     ),
                                // //     child: Row(
                                // //       mainAxisAlignment:
                                // //           MainAxisAlignment.spaceBetween,
                                // //       children: [
                                // //         Row(
                                // //           children: [
                                // //             Icon(CupertinoIcons.square_grid_2x2),
                                // //             SizedBox(
                                // //               width: 10.w,
                                // //             ),
                                // //             defaultText(
                                // //                 txt: '299920',
                                // //                 fontSize: 14.sp,
                                // //                 fontWeight: FontWeight.normal),
                                // //             SizedBox(
                                // //               width: 5.w,
                                // //             ),
                                // //             defaultText(
                                // //                 txt: 'نتائج',
                                // //                 fontSize: 14.sp,
                                // //                 fontWeight: FontWeight.normal),
                                // //           ],
                                // //         ),
                                // //         SizedBox(
                                // //           width: 15.w,
                                // //         ),
                                // //         Container(
                                // //           padding: EdgeInsets.only(
                                // //               left: 10.w, right: 10.w),
                                // //           height: 37.h,
                                // //           width: 100.w,
                                // //           decoration: BoxDecoration(
                                // //             borderRadius: BorderRadius.circular(13),
                                // //             border: Border.all(width: .1),
                                // //           ),
                                // //           child: Center(
                                // //             child: defaultText(
                                // //                 txt: 'فرز وتصنيف',
                                // //                 fontSize: 13.sp,
                                // //                 fontWeight: FontWeight.bold),
                                // //           ),
                                // //         ),
                                // //       ],
                                // //     )),

                                background: SingleChildScrollView(
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Container(
                                        height: 120.h,
                                        width: double.infinity,
                                        decoration: BoxDecoration(
                                          color: AppColors.mainColor,
                                        ),
                                        child: Padding(
                                          padding: EdgeInsets.only(
                                              top: 40.h,
                                              left: 15.w,
                                              right: 15.w),
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
                                                                  style:
                                                                      BorderStyle
                                                                          .none,
                                                                  width: .1,
                                                                  color: Colors
                                                                      .white),
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                14,
                                                              )),
                                                      enabledBorder:
                                                          OutlineInputBorder(
                                                              // gapPadding: 2,
                                                              borderSide: BorderSide(
                                                                  style:
                                                                      BorderStyle
                                                                          .none,
                                                                  width: .1,
                                                                  color: Colors
                                                                      .white),
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                14,
                                                              )),
                                                      filled: true,
                                                      prefixIcon: Icon(
                                                        CupertinoIcons.search,
                                                        color: Colors
                                                            .grey.shade400,
                                                      ),
                                                      hintText:
                                                          ' البحث في '+ AppConst.kAppName,
                                                      hintStyle: TextStyle(
                                                          color: Colors
                                                              .grey.shade400,
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
                                        color: const Color.fromARGB(
                                            255, 217, 243, 187),
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
                                                    width: MediaQuery.sizeOf(
                                                                context)
                                                            .width /
                                                        2,
                                                    fit: BoxFit.cover,
                                                  ),
                                                  defaultText(
                                                      txt:
                                                          'خصم 20% علي علاجات وآمصال',
                                                      fontSize: 12.sp,
                                                      color: Colors.white,
                                                      fontWeight:
                                                          FontWeight.bold),
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
                                      SizedBox(
                                        height: 10.h,
                                      ),
                                      Container(
                                          width: double.infinity,
                                          margin: EdgeInsets.only(
                                              left: 12.w, right: 12.w),
                                          padding: EdgeInsets.only(
                                              right: 10.w,
                                              left: 10.w,
                                              top: 10.h,
                                              bottom: 10.h),
                                          decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(12),
                                            color: Color.fromARGB(
                                                255, 255, 238, 238),
                                            // border: Border.all(width: .1),
                                          ),
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              defaultText(
                                                  txt: 'خاص ! خصم خاص 30% ',
                                                  fontSize: 14.sp,
                                                  color: AppColors.redColor,
                                                  fontWeight: FontWeight.bold),
                                              defaultText(
                                                  txt:
                                                      'لفترة محدودة فقط لا يمكن الجمع مع عروض آخري',
                                                  fontSize: 11.sp,
                                                  color: AppColors.textColor,
                                                  fontWeight: FontWeight.bold),
                                            ],
                                          )),
                                      // SizedBox(
                                      //   height: 10.h,
                                      // ),
                                      Container(
                                        padding: EdgeInsets.only(
                                          left: 5.w,
                                        ),
                                        // color: const Color.fromARGB(
                                        //     255, 217, 243, 187),
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          children: [
                                            Stack(
                                              alignment: Alignment.center,
                                              children: [
                                                Image.asset(
                                                  'assets/images/ribbon.png',
                                                  color: AppColors.redColor,
                                                  height: 40.h,
                                                  width: 130,
                                                  fit: BoxFit.fitWidth,
                                                ),
                                                Center(
                                                  child: defaultText(
                                                      txt: 'مميز',
                                                      fontSize: 14.sp,
                                                      color: Colors.white,
                                                      fontWeight:
                                                          FontWeight.bold),
                                                ),
                                              ],
                                            ),
                                            SizedBox(
                                              width: 20.w,
                                            ),
                                            Stack(
                                              alignment: Alignment.center,
                                              children: [
                                                Image.asset(
                                                  'assets/images/ribbon.png',
                                                  height: 26.h,
                                                  color: Colors.lightBlue,
                                                  width: 190.w,
                                                  fit: BoxFit.fitWidth,
                                                ),
                                                defaultText(
                                                    txt:
                                                        'علامات iHerb التجاريه',
                                                    fontSize: 12.sp,
                                                    color: Colors.white,
                                                    fontWeight:
                                                        FontWeight.bold),
                                              ],
                                            ),
                                          ],
                                        ),
                                      ),
                                      SizedBox(
                                        height: 10.h,
                                      ),
                                      Container(
                                        margin: EdgeInsets.only(
                                            left: 12.w, right: 12.w),
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              'كاليفورنيا غولد نيوتريش',
                                              // textAlign: TextAlign.center,
                                              style: TextStyle(
                                                decoration:
                                                    TextDecoration.underline,
                                                color: Colors.green,
                                                fontFamily: 'Tajawal',
                                                fontSize: 15.sp,
                                                fontWeight: FontWeight.bold,
                                              ),
                                            ),
                                            SizedBox(
                                              height: 10.h,
                                            ),
                                            defaultText(
                                                txt:
                                                    'زيت سمك أوميجا 800 فائق التركيز الغني بأوميجا-3، أحد أشكال الدهون الثلاثية المستخلصة بتقنية kd-pur،‏ 1,000 ملجم، 90 كبسولة هلامية من جيلاتين السمك',
                                                fontSize: 15.sp,
                                                // color: Colors.green.shade300,
                                                fontWeight: FontWeight.bold),
                                            SizedBox(
                                              height: 10.h,
                                            ),
                                            Row(
                                              children: [
                                                Rate(
                                                  iconSize: 19,
                                                  color: Colors.amber,
                                                  allowHalf: true,
                                                  allowClear: true,
                                                  initialValue: 4,
                                                  readOnly: false,
                                                  onChange: (value) =>
                                                      print(value),
                                                ),
                                                SizedBox(
                                                  width: 10.w,
                                                ),
                                                defaultText(
                                                    txt: '2990',
                                                    fontSize: 15.sp,
                                                    fontWeight: FontWeight.bold,
                                                    color: Colors.green),
                                              ],
                                            ),
                                            SizedBox(
                                              height: 10.h,
                                            ),
                                            Stack(
                                              alignment: Alignment.topLeft,
                                              children: [
                                                CarouselSlider(
                                                    items: items
                                                        .map((e) => Container(
                                                              height: 140.h,
                                                              decoration: BoxDecoration(
                                                                  borderRadius:
                                                                      BorderRadius
                                                                          .circular(
                                                                              14),
                                                                  image: DecorationImage(
                                                                      fit: BoxFit
                                                                          .cover,
                                                                      image: AssetImage(
                                                                          e))),
                                                            ))
                                                        .toList(),
                                                    options: CarouselOptions(
                                                      clipBehavior:
                                                          Clip.antiAlias,
                                                      height: 340,
                                                      aspectRatio: 16 / 9,
                                                      viewportFraction: 1,
                                                      initialPage: 0,
                                                      enableInfiniteScroll:
                                                          true,
                                                      reverse: true,
                                                      autoPlay: true,
                                                      autoPlayInterval:
                                                          Duration(seconds: 3),
                                                      autoPlayAnimationDuration:
                                                          Duration(
                                                              milliseconds:
                                                                  800),
                                                      autoPlayCurve:
                                                          Curves.fastOutSlowIn,
                                                      enlargeCenterPage: true,
                                                      enlargeFactor: 0.3,
                                                      onPageChanged: (int value,
                                                          onPageChanged) {
                                                        setState(() {
                                                          index1 = value;
                                                        });
                                                      },
                                                      scrollDirection:
                                                          Axis.horizontal,
                                                    )),
                                                Container(
                                                  height: 40.h,
                                                  width: 40.w,
                                                  decoration: BoxDecoration(
                                                      shape: BoxShape.circle,
                                                      border: Border.all(
                                                          width: 3,
                                                          color: Colors
                                                              .orangeAccent)),
                                                  child: Icon(
                                                    Icons.share,
                                                    color: Colors.orangeAccent,
                                                  ),
                                                )
                                              ],
                                            ),
                                            SizedBox(
                                              height: 10.h,
                                            ),
                                            Center(
                                              child: AnimatedSmoothIndicator(
                                                  activeIndex: index1,
                                                  effect: ExpandingDotsEffect(
                                                      dotColor: Colors.grey,
                                                      activeDotColor:
                                                          AppColors.mainColor,
                                                      dotHeight: 10.h,
                                                      dotWidth: 10.w),
                                                  count: items.length),
                                            ),
                                            SizedBox(
                                              height: 10.h,
                                            ),
                                            Center(
                                              child: defaultText(
                                                  txt: 'متوفر حاليا',
                                                  fontSize: 12.sp,
                                                  color: AppColors.mainColor,
                                                  fontWeight: FontWeight.bold),
                                            ),
                                            SizedBox(
                                              height: 10.h,
                                            ),
                                            defaultText(
                                                txt: ' خصم بمعدل 30%  ',
                                                fontSize: 14.sp,
                                                // color: AppColors.mainColor,
                                                fontWeight: FontWeight.bold),
                                            SizedBox(
                                              height: 10.h,
                                            ),
                                            defaultText(
                                                txt: '332.39 EGP',
                                                fontSize: 17.sp,
                                                color: AppColors.redColor,
                                                fontWeight: FontWeight.bold),
                                            Text(
                                              '300.990 EGP',
                                              // textAlign: TextAlign.center,
                                              style: TextStyle(
                                                decoration:
                                                    TextDecoration.lineThrough,
                                                color: AppColors.textColor,
                                                fontFamily: 'Tajawal',
                                                fontSize: 12.sp,
                                                fontWeight: FontWeight.bold,
                                              ),
                                            ),
                                            Text(
                                              '12.33 EGP / للجرعه',
                                              // textAlign: TextAlign.center,
                                              style: TextStyle(
                                                // decoration:
                                                //     TextDecoration.lineThrough,
                                                color: AppColors.textColor,
                                                fontFamily: 'Tajawal',
                                                fontSize: 12.sp,
                                                fontWeight: FontWeight.bold,
                                              ),
                                            ),
                                            defaultText(
                                                txt: 'اصلي 100%',
                                                fontSize: 17.sp,
                                                color: AppColors.mainColor,
                                                fontWeight: FontWeight.bold),
                                            defaultText(
                                                txt:
                                                    'يفضل استهلاكه قبل : 12/2026 ',
                                                fontSize: 17.sp,
                                                // color: AppColors.mainColor,
                                                fontWeight: FontWeight.bold),
                                            SizedBox(
                                              height: 10.h,
                                            ),
                                            Divider(
                                              thickness: 5,
                                              color: Colors.grey.shade300,
                                            ),
                                            SizedBox(
                                              height: 10.h,
                                            ),
                                            Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                defaultText(
                                                    txt: 'الخيارات المتاحة',
                                                    fontSize: 17.sp,
                                                    // color: AppColors.mainColor,
                                                    fontWeight:
                                                        FontWeight.bold),
                                                Icon(Icons.arrow_forward_ios)
                                              ],
                                            ),
                                            SizedBox(
                                              height: 15.h,
                                            ),
                                            Row(
                                              children: [
                                                Expanded(
                                                  child: Container(
                                                    padding: EdgeInsets.all(10),
                                                    decoration: BoxDecoration(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(12),
                                                        border: Border.all(
                                                            width: 3,
                                                            color: Colors.grey
                                                                .shade400)),
                                                    child: Column(
                                                      children: [
                                                        defaultText(
                                                          txt: '30 وحده',
                                                          fontWeight:
                                                              FontWeight.normal,
                                                        ),
                                                        Row(
                                                          children: [
                                                            defaultText(
                                                              txt: '368.45 EGP',
                                                              fontSize: 13.sp,
                                                              color: AppColors
                                                                  .redColor,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .bold,
                                                            ),
                                                            Text(
                                                              '300.990 EGP',
                                                              // textAlign: TextAlign.center,
                                                              style: TextStyle(
                                                                decoration:
                                                                    TextDecoration
                                                                        .lineThrough,
                                                                color: AppColors
                                                                    .textColor,
                                                                fontFamily:
                                                                    'Tajawal',
                                                                fontSize: 12.sp,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .bold,
                                                              ),
                                                            ),
                                                          ],
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                ),
                                                SizedBox(
                                                  width: 15.w,
                                                ),
                                                Expanded(
                                                  child: Container(
                                                    padding: EdgeInsets.all(10),
                                                    decoration: BoxDecoration(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(12),
                                                        border: Border.all(
                                                            width: 3,
                                                            color: Colors.grey
                                                                .shade400)),
                                                    child: Column(
                                                      children: [
                                                        defaultText(
                                                          txt: '30 وحده',
                                                          fontWeight:
                                                              FontWeight.normal,
                                                        ),
                                                        Row(
                                                          children: [
                                                            defaultText(
                                                              txt: '368.45 EGP',
                                                              color: AppColors
                                                                  .redColor,
                                                              fontSize: 13.sp,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .bold,
                                                            ),
                                                            Text(
                                                              '300.990 EGP',
                                                              // textAlign: TextAlign.center,
                                                              style: TextStyle(
                                                                decoration:
                                                                    TextDecoration
                                                                        .lineThrough,
                                                                color: AppColors
                                                                    .textColor,
                                                                fontFamily:
                                                                    'Tajawal',
                                                                fontSize: 12.sp,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .bold,
                                                              ),
                                                            ),
                                                          ],
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            ),
                                            SizedBox(
                                              height: 15.h,
                                            ),
                                            Container(
                                                padding: EdgeInsets.all(10),
                                                decoration: BoxDecoration(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            12),
                                                    border: Border.all(
                                                        width: 1,
                                                        color: Colors
                                                            .grey.shade400)),
                                                child: Column(
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment.end,
                                                    children: [
                                                      Text(
                                                        '300.990 EGP',
                                                        // textAlign: TextAlign.center,
                                                        style: TextStyle(
                                                          decoration:
                                                              TextDecoration
                                                                  .lineThrough,
                                                          color: AppColors
                                                              .textColor,
                                                          fontFamily: 'Tajawal',
                                                          fontSize: 12.sp,
                                                          fontWeight:
                                                              FontWeight.bold,
                                                        ),
                                                      ),
                                                      Row(
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .spaceBetween,
                                                        children: [
                                                          defaultText(
                                                            txt: 'مميز!',
                                                            fontSize: 15.sp,
                                                            color: AppColors
                                                                .redColor,
                                                            fontWeight:
                                                                FontWeight.bold,
                                                          ),
                                                          defaultText(
                                                            txt: '368.45 EGP',
                                                            fontSize: 17.sp,
                                                            color: AppColors
                                                                .redColor,
                                                            fontWeight:
                                                                FontWeight.bold,
                                                          ),
                                                        ],
                                                      ),
                                                      Text(
                                                        '12.33 EGP / للجرعه',
                                                        // textAlign: TextAlign.center,
                                                        style: TextStyle(
                                                          // decoration:
                                                          //     TextDecoration.lineThrough,
                                                          color: AppColors
                                                              .textColor,
                                                          fontFamily: 'Tajawal',
                                                          fontSize: 12.sp,
                                                          fontWeight:
                                                              FontWeight.bold,
                                                        ),
                                                      ),
                                                      Row(
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .spaceBetween,
                                                        children: [
                                                          defaultText(
                                                            txt: 'لقد وفرت: ',
                                                            fontSize: 13.sp,
                                                            color: AppColors
                                                                .redColor,
                                                            fontWeight:
                                                                FontWeight.bold,
                                                          ),
                                                          defaultText(
                                                            txt:
                                                                ' 158.34 EGP(30%)',
                                                            fontSize: 13.sp,
                                                            // color: AppColors
                                                            //     .redColor,
                                                            fontWeight:
                                                                FontWeight.bold,
                                                          ),
                                                        ],
                                                      ),
                                                      SizedBox(
                                                        height: 10.h,
                                                      ),
                                                      Container(
                                                        width: 100.w,
                                                        decoration:
                                                            BoxDecoration(
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .circular(
                                                                            14),
                                                                border:
                                                                    Border.all(
                                                                  width: .1,
                                                                )),
                                                        padding:
                                                            EdgeInsets.all(5),
                                                        child: Row(
                                                          mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .spaceBetween,
                                                          children: [
                                                            Icon(Icons.remove),
                                                            defaultText(
                                                                txt: '1',
                                                                fontSize: 14.sp,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .bold),
                                                            Icon(Icons.add),
                                                          ],
                                                        ),
                                                      ),
                                                      SizedBox(
                                                        height: 15.h,
                                                      ),
                                                      SizedBox(
                                                        width: double.infinity,
                                                        height: 45.h,
                                                        child: TextButton(
                                                          style: TextButton
                                                              .styleFrom(
                                                            shape: RoundedRectangleBorder(
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .circular(
                                                                            12)),
                                                            backgroundColor:
                                                                Colors.orange,
                                                          ),
                                                          onPressed: () {},
                                                          child: Text(
                                                            'اضف الي السله',
                                                            style: TextStyle(
                                                              fontSize: 18.sp,
                                                              color:
                                                                  Colors.white,
                                                            ),
                                                          ),
                                                        ),
                                                      ),
                                                      SizedBox(
                                                        height: 7.h,
                                                      ),
                                                      DefaultButton(
                                                        text: 'اشتر الان',
                                                      ),
                                                    ])),
                                            SizedBox(
                                              height: 10.h,
                                            ),
                                            Container(
                                                padding: EdgeInsets.all(10),
                                                decoration: BoxDecoration(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            12),
                                                    border: Border.all(
                                                        width: 1,
                                                        color: Colors
                                                            .grey.shade400)),
                                                child: Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.center,
                                                  children: [
                                                    defaultText(
                                                        txt: 'اضف الي القائمة',
                                                        fontWeight:
                                                            FontWeight.bold),
                                                   SizedBox(width: 10.w,),
                                                    Icon(Icons.favorite_border),
                                                  ],
                                                ))
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                      ),
                    ];
                  },
                  body:
                      VerticalTabBarView(controller: _tabController, children: [
                    MyWidget(),
                    MyWidget(),
                    MyWidget(),
                    MyWidget(),
                  ]),
                )));
          }),
    );
  }
}

class MyWidget extends StatelessWidget {
  const MyWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
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
                    return GetProductsCategory(index: index,);
                  }
                },
                separatorBuilder: (context, index) => Divider(
                      color: Colors.grey,
                      height: 1,
                    ),
                itemCount: lists.length),
          ),
        ],
      ),
    );
  }
}
