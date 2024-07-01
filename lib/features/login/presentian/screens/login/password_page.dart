import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:password_strength_checker/password_strength_checker.dart';
import 'package:pos_project/core/colors/colors.dart';
import 'package:pos_project/core/componant/build_text_field.dart';
import 'package:pos_project/core/componant/componant.dart';
import 'package:pos_project/core/componant/default_button.dart';
import 'package:pos_project/core/const/const.dart';
import 'package:pos_project/features/login/presentian/screens/otp_page.dart';

class PasswordPage extends StatelessWidget {
  const PasswordPage({super.key});

  @override
  Widget build(BuildContext context) {
    final passNotifier = ValueNotifier<PasswordStrength?>(null);

    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        body: SingleChildScrollView(
          physics: NeverScrollableScrollPhysics(),
          child: Padding(
            padding: EdgeInsets.only(top: 60.h, left: 15.w, right: 15.w),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    defaultText(
                      txt: 'انشاء حساب جديد',
                      fontSize: 20.sp,
                      fontWeight: FontWeight.bold,
                    ),
                    SizedBox(
                      width: 60.w,
                    ),
                    InkWell(
                      onTap: () {
                        pop(context);
                      },
                      child: Icon(
                        Icons.arrow_forward_ios,
                        size: 17,
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 15.h,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    defaultText(
                      txt: 'رقم الهاتف المحمول : ',
                      fontSize: 14.sp,
                      fontWeight: FontWeight.normal,
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    defaultText(
                      txt: '+201276156334',
                      fontSize: 14.sp,
                      fontWeight: FontWeight.normal,
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    InkWell(
                      onTap: () {
                        pop(context);
                      },
                      child: defaultText(
                        txt: 'تغيير',
                        fontSize: 14.sp,
                        color: AppColors.blueColor,
                        fontWeight: FontWeight.normal,
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 15.h,
                ),
                defaultText(
                  txt:
                      'لم نعثر علي حساب برقم الهاتف المحمول هذا . قم بانشاء كلمه مرور لانشاء حساب جديد .',
                  fontSize: 14.sp,
                  fontWeight: FontWeight.normal,
                ),
                SizedBox(
                  height: 15.h,
                ),
                BuildTextFiled(
                  // autoFocus: true,
                  hint: 'انشاء كلمه السر',
                  label: 'انشاء كلمه السر',
                  validator: (value) {
                    if (value == null || value.isEmpty == true) {
                      return "أدخل اسم المشروع";
                    }
                  },
                  changed: (value) {
                    passNotifier.value =
                        PasswordStrength.calculate(text: value.toString());
                  },
                ),
                const SizedBox(height: 20),
                PasswordStrengthChecker(
                  strength: passNotifier,
                  configuration: PasswordStrengthCheckerConfiguration(
                      height: 10,
                      borderWidth: .2,
                      hasBorder: false,
                      statusMargin: EdgeInsets.only(left: 10, right: 10)),
                ),
                SizedBox(
                  height: 10,
                ),
                Row(
                  children: [
                    defaultText(
                      txt: 'متابعتك يعني انك قرآت ووافقت علي  ',
                      color: AppColors.textColor,
                      fontWeight: FontWeight.bold,
                      fontSize: 10.sp,
                    ),
                    defaultText(
                      txt: 'الشروط والاحكام',
                      color: AppColors.blueColor,
                      fontWeight: FontWeight.bold,
                      fontSize: 10.sp,
                    ),
                    defaultText(
                      txt: ' و  ',
                      color: AppColors.textColor,
                      fontWeight: FontWeight.bold,
                      fontSize: 10.sp,
                    ),
                    defaultText(
                      txt: 'سياسة الخصوصية',
                      color: AppColors.blueColor,
                      fontWeight: FontWeight.bold,
                      fontSize: 10.sp,
                    ),
                  ],
                ),
                defaultText(
                  txt:
                      'تطبق اسعار الرسائل وبيانات الانترنت لايقاف تلقي الاشعارات غير " تفضيلات التواصل " من صفحه حسابي"',
                  color: AppColors.textColor,
                  fontWeight: FontWeight.bold,
                  fontSize: 10.sp,
                ),
                SizedBox(
                  height: 15,
                ),
                DefaultButton(
                  press: () {
                    FocusManager.instance.primaryFocus?.unfocus();

                    nextPage(context, OtpPage());
                  },
                  text: 'انشاء حساب',
                ),
                SizedBox(
                  height: 15.h,
                ),
                defaultText(
                  txt: ' هل تحتاج الي مساعدة في انشاء حساب؟',
                  color: AppColors.blueColor,
                  fontWeight: FontWeight.bold,
                  fontSize: 12.sp,
                ),
                SizedBox(
                  height: 25.h,
                ),
                defaultText(
                  txt: AppConst.kAppName+' لماذا ',
                  fontSize: 20.sp,
                  fontWeight: FontWeight.bold,
                ),
                SizedBox(
                  height: 10.h,
                ),
                Column(
                  children: [
                    Row(
                      children: [
                        Icon(
                          Icons.check,
                          color: AppColors.mainColor,
                        ),
                        SizedBox(
                          width: 10.w,
                        ),
                        defaultText(
                          txt:
                              'يمكن التحكم بدرجه حراره جميع المرافق لضمان الجوده',
                          fontSize: 13.sp,
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 10.h,
                    ),
                    Row(
                      children: [
                        Icon(
                          Icons.check,
                          color: AppColors.mainColor,
                        ),
                        SizedBox(
                          width: 10.w,
                        ),
                        defaultText(
                          txt: 'تقييمات معتمده من عملاء حقيقين',
                          fontSize: 13.sp,
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 10.h,
                    ),
                    Row(
                      children: [
                        Icon(
                          Icons.check,
                          color: AppColors.mainColor,
                        ),
                        SizedBox(
                          width: 10.w,
                        ),
                        defaultText(
                          txt:
                              'يمكن التحكم بدرجه حراره جميع المرافق لضمان الجوده',
                          fontSize: 13.sp,
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 10.h,
                    ),
                    Row(
                      children: [
                        Icon(
                          Icons.check,
                          color: AppColors.mainColor,
                        ),
                        SizedBox(
                          width: 10.w,
                        ),
                        defaultText(
                          txt: 'تواريخ انتهاء الصلاحيه موجوده في وصف المنتج',
                          fontSize: 13.sp,
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 10.h,
                    ),
                    Row(
                      children: [
                        Icon(
                          Icons.check,
                          color: AppColors.mainColor,
                        ),
                        SizedBox(
                          width: 10.w,
                        ),
                        defaultText(
                          txt:
                              'يمكن التحكم بدرجه حراره جميع المرافق لضمان الجوده',
                          fontSize: 13.sp,
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 10.h,
                    ),
                    Row(
                      children: [
                        Icon(
                          Icons.check,
                          color: AppColors.mainColor,
                        ),
                        SizedBox(
                          width: 10.w,
                        ),
                        defaultText(
                          txt:
                              'خدمه عملاء ٢٤/٧ . سهوله الارجاع واسترداد الاموال.',
                          fontSize: 13.sp,
                        ),
                      ],
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
