import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pos_project/core/colors/colors.dart';
import 'package:pos_project/core/componant/componant.dart';
import 'package:rate/rate.dart';

class BlogWidget extends StatelessWidget {
  const BlogWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(left: 12.w, right: 12.w),
      margin: EdgeInsets.only( top: 12, bottom: 12),
      // height: 250.h,
      // width: double.infinity,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(13),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              defaultText(
                txt: 'مقالات المدونه ذات الصله',
                fontSize: 14.sp,
                fontWeight: FontWeight.bold,
              ),
              // Icon(Icons.clear)
            ],
          ),
          SizedBox(
            height: 10.h
          ),
          Container(
            height: 60.h,
            // width: 250.w,
            child: ListView.separated(
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) => Container(
                      width: 250.w,
                      padding: EdgeInsets.all(10),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        border: Border.all(width: .1),
                      ),
                      child: Row(
                        children: [
                          Container(
                            height: 40.h,
                            width: 60.w,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              image: DecorationImage(
                                  fit: BoxFit.cover,
                                  image:
                                      AssetImage('assets/images/health.jpg')),
                            ),
                          ),
                          Expanded(
                              child: defaultText(
                                  txt: 'افضل المكملات للحيوانات الاليفه'))
                        ],
                      ),
                    ),
                separatorBuilder: (context, index) => SizedBox(
                      width: 10.w,
                    ),
                itemCount: 4),
          )
        ],
      ),
    );
  }
}
