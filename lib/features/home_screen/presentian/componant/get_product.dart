import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pos_project/core/colors/colors.dart';
import 'package:pos_project/core/componant/componant.dart';
import 'package:pos_project/features/home_screen/presentian/screens/home_screen.dart';
import 'package:pos_project/features/products_details/presentian/screens/products_details.dart';
import 'package:rate/rate.dart';

class GetProducts extends StatelessWidget {
  var index;
   GetProducts({super.key,this.index});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        nextPage(context, ProductsDetails());
      },
      child: Container(
        decoration: BoxDecoration(
          // color: Colors.white,
          // boxShadow: [
          //   BoxShadow(
          //       offset: Offset(0, 3),
          //       spreadRadius: 3,
          //       color: Colors.grey.shade300,
          //       blurRadius: 2)
          // ],
          borderRadius: BorderRadius.circular(12),
          // color: Colors.grey
        ),
        child: Column(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(12),
              child: Image.asset(
                imageItemForYou[index],
                height: 100.h,
                width: 130.w,
                fit: BoxFit.cover,
              ),
            ),
            SizedBox(
              height: 10.h,
            ),
            Container(
              padding: EdgeInsets.only(left: 5.w, right: 5.w),
              child: Column(
                children: [
                  Text(
                    ' كال ، تورات المغنيسيوم 400 ملجم ، 90 قرصا (200 ملجم لكل قرص(',
                    textAlign: TextAlign.center,
                    maxLines: 3,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                      color: Colors.black,
                      fontFamily: 'Tajawal',
                      fontSize: 13.sp,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Row(
                    children: [
                      defaultText(txt: '2990'),
                      SizedBox(
                        width: 10.w,
                      ),
                      Rate(
                        iconSize: 12,
                        color: Colors.amber,
                        allowHalf: true,
                        allowClear: true,
                        initialValue: 4,
                        readOnly: false,
                        onChange: (value) => print(value),
                      ),
                    ],
                  ),
                  defaultText(
                    txt: '978.89 EGP',
                    fontSize: 17.sp,
                    fontWeight: FontWeight.bold,
                    color: AppColors.redColor,
                  ),
                  Text(
                    '1,138.89',
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
                  defaultText(
                    txt: 'خصم بمعدل %15',
                    fontSize: 14.sp,
                    fontWeight: FontWeight.bold,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
