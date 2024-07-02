import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pos_project/core/colors/colors.dart';
import 'package:pos_project/core/componant/componant.dart';
import 'package:rate/rate.dart';

class GetProductsCategory extends StatelessWidget {
  const GetProductsCategory({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          // height: 240.h,
          // width: 130.w,
          decoration: BoxDecoration(
            color: Colors.white,
          ),
          child: Container(
            width: double.infinity,
            padding: EdgeInsets.all(12),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Image.asset(
                  'assets/images/vitamin-e_10638138.png',
                  height: 80.h,
                  width: 60.w,
                ),
                SizedBox(
                  width: 15.w,
                ),
                Container(
                  width: 240.w,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'زيت السمك الممتاز بأوميجا 3، 100 كبسولة هلامية من جيلاتين السمك',
                        maxLines: 3,
                        overflow: TextOverflow.ellipsis,
                        // textAlign:
                        //     TextAlign.center,
                        style: TextStyle(
                          // color: color,
                          fontFamily: 'Tajawal',
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Row(
                        children: [
                          Rate(
                            iconSize: 12,
                            color: Colors.amber,
                            allowHalf: true,
                            allowClear: true,
                            initialValue: 4,
                            readOnly: false,
                            onChange: (value) => print(value),
                          ),
                          SizedBox(
                            width: 10.w,
                          ),
                          defaultText(txt: '2990'),
                        ],
                      ),
                    
                      defaultText(
                        txt: 'المزيد من الخيارات المتاحه',
                        color: AppColors.blueColor,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            children: [
                              SizedBox(
                                height: 15.h,
                              ),
                              Row(
                                children: [
                                  defaultText(
                                    txt: '978.89 EGP',
                                    fontSize: 17.sp,
                                    fontWeight: FontWeight.bold,
                                    color: AppColors.redColor,
                                  ),
                                  SizedBox(
                                    width: 10.w,
                                  ),
                                  Text(
                                    '1,138.89 EGP',
                                    style: TextStyle(
                                      decoration: TextDecoration.lineThrough,
                                      decorationColor: Colors.grey.shade700,
                                      // decorationThickness: 1,
                                      color: AppColors.textColor,
                                      fontFamily: 'Tajawal',
                                      fontSize: 17.sp,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ],
                              ),
                              defaultText(
                                txt: 'خصم بمعدل %15',
                                fontSize: 14.sp,
                                fontWeight: FontWeight.bold,
                              ),
                            ],
                          ),
                          Container(
                            height: 40.h,
                            width: 40.w,
                            decoration: BoxDecoration(
                                color: Colors.white,
                                border: Border.all(
                                    width: .8, color: Colors.orangeAccent),
                                shape: BoxShape.circle),
                            child: Icon(
                              CupertinoIcons.cart_badge_plus,
                              size: 22,
                              color: Colors.orangeAccent,
                            ),
                          )
                        ],
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
        Stack(
          alignment: Alignment.center,
          children: [
            Icon(
              CupertinoIcons.bookmark_fill,
              size: 40,
              color: AppColors.redColor,
            ),
            defaultText(
                txt: 'مميز',
                fontSize: 8,
                fontWeight: FontWeight.bold,
                color: Colors.white)
          ],
        ),
      ],
    );
  }
}
