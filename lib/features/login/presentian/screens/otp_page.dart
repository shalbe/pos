// ignore_for_file: unnecessary_null_comparison

import 'package:flutter/material.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pos_project/core/colors/colors.dart';
import 'package:pos_project/core/componant/componant.dart';
import 'package:timer_count_down/timer_controller.dart';
import 'package:timer_count_down/timer_count_down.dart';

class OtpPage extends StatefulWidget {
  const OtpPage({super.key});

  @override
  State<OtpPage> createState() => _OtpPageState();
}

class _OtpPageState extends State<OtpPage> {
  String? resend;
  var controller = CountdownController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.only(top: 60.h, left: 15.w, right: 15.w),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                defaultText(
                  txt: 'تحقق',
                  fontSize: 20.sp,
                  fontWeight: FontWeight.bold,
                ),
                SizedBox(
                  width: 100.w,
                ),
                InkWell(
                  onTap: () {
                    pop(context);
                  },
                  child: defaultText(
                    txt: 'الغاء',
                    color: AppColors.blueColor,
                    fontSize: 20.sp,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 45.h,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                resend == null
                    ? Row(
                        children: [
                          defaultText(
                            txt: 'Resend ',
                            color: AppColors.textColor,
                            fontSize: 14.sp,
                            fontWeight: FontWeight.bold,
                          ),
                          SizedBox(
                            width: 10.w,
                          ),
                          Countdown(
                            // controller: controller,
                            seconds: 60,
                            build: (BuildContext context, double time) => Text(
                              time.toString(),
                              style: TextStyle(
                                  color: AppColors.mainColor,
                                  fontWeight: FontWeight.bold),
                            ),
                            interval: Duration(
                              seconds: 1,
                            ),
                            onFinished: () {
                              setState(() {
                                resend = 'اعاده ارسال';
                              });
                              print(resend);
                            },
                          ),
                        ],
                      )
                    : InkWell(
                        onTap: () {
                          setState(() {
                            resend = null;
                            controller.autoStart;
                          });

                          // print('resend');
                        },
                        child: defaultText(
                            txt: resend,
                            color: AppColors.blueColor,
                            fontSize: 14)),
                defaultText(
                  txt: 'تم ارسال الرمز',
                  // color: AppColors.buttonblueColor,
                  fontSize: 14.sp,
                  fontWeight: FontWeight.bold,
                ),
              ],
            ),
            SizedBox(
              height: 25.h,
            ),
            defaultText(
              txt:
                  ' يرجي التحقق من رقم هاتفك المحمول . ادخل الرقم الذي ارسلناه الي  : -  ',
              color: AppColors.textColor,
              fontSize: 14.sp,
              fontWeight: FontWeight.bold,
            ),
            SizedBox(
              height: 15.h,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                defaultText(
                  txt: '+2 01276156334',
                  // color: AppColors.textColor,
                  fontSize: 20.sp,
                  fontWeight: FontWeight.bold,
                ),
              ],
            ),
            SizedBox(
              height: 35.h,
            ),
            OtpTextField(
              numberOfFields: 4,
              borderColor: AppColors.mainColor,
              focusedBorderColor: AppColors.mainColor,
              //set to true to show as box or false to show as dash
              showFieldAsBox: true,
              borderRadius: BorderRadius.circular(14),
              fieldWidth: 60,
              //runs when a code is typed in
              onCodeChanged: (String code) {
                //handle validation or checks here
              },
              //runs when every textfield is filled
              onSubmit: (String verificationCode) {
                showDialog(
                    context: context,
                    builder: (context) {
                      return AlertDialog(
                        title: Text("Verification Code"),
                        content: Text('Code entered is $verificationCode'),
                      );
                    });
              }, // end onSubmit
            ),
          ],
        ),
      ),
    );
  }
}
