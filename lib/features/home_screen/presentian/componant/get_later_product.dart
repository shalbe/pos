import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pos_project/core/colors/colors.dart';
import 'package:pos_project/core/componant/componant.dart';
import 'package:pos_project/features/home_screen/presentian/screens/home_screen.dart';
import 'package:pos_project/features/products_details/presentian/screens/products_details.dart';
import 'package:rate/rate.dart';

class GetLaterProducts extends StatelessWidget {
  var index;
   GetLaterProducts({super.key,this.index});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        nextPage(context, ProductsDetails());
      },
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          boxShadow: [
            BoxShadow(
                offset: Offset(0, 3),
                spreadRadius: 3,
                color: Colors.grey.shade300,
                blurRadius: 2)
          ],
          borderRadius: BorderRadius.circular(12),
          // color: Colors.grey
        ),
        child: Stack(
          alignment: Alignment.bottomLeft,
          children: [
            Container(
              height: 120.h,
              child: Stack(
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(12),
                    child: Image.asset(
                      imageItemLater[index],
                      height: 100.h,
                      width: 130.w,
                      fit: BoxFit.cover,
                    ),
                  ),
                ],
              ),
            ),
            Container(
              height: 40.h,
              width: 40.w,
              decoration: BoxDecoration(
                  color: Colors.white,
                  border: Border.all(width: .8, color: Colors.orangeAccent),
                  shape: BoxShape.circle),
              child: Icon(
                CupertinoIcons.cart_badge_plus,
                size: 22,
                color: Colors.orangeAccent,
              ),
            )
          ],
        ),
      ),
    );
  }
}
