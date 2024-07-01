import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pos_project/core/colors/colors.dart';
import 'package:pos_project/core/componant/build_text_field.dart';
import 'package:pos_project/core/componant/componant.dart';
import 'package:pos_project/core/componant/default_button.dart';
import 'package:pos_project/core/const/const.dart';
import 'package:pos_project/features/login/presentian/cubit/login_cubit.dart';
import 'package:pos_project/features/login/presentian/cubit/login_state.dart';
import 'package:pos_project/features/login/presentian/screens/login/password_page.dart';
import 'package:svg_flutter/svg.dart';
import 'package:password_strength_checker/password_strength_checker.dart';

class Login extends StatelessWidget {
  const Login({super.key});

  @override
  Widget build(BuildContext context) {
    final passNotifier = ValueNotifier<PasswordStrength?>(null);

    return BlocProvider(
      create: (context) => LoginCubit(),
      child: BlocConsumer<LoginCubit, LoginState>(
          listener: (context, state) {},
          builder: (context, state) {
            return Directionality(
              textDirection: TextDirection.rtl,
              child: Scaffold(
                body: SingleChildScrollView(
                  physics: NeverScrollableScrollPhysics(),
                  child: Padding(
                    padding:
                        EdgeInsets.only(top: 70.h, left: 15.w, right: 15.w),
                    child: Column(
                      children: [
                        Row(
                          children: [
                            InkWell(
                                onTap: () {
                                  pop(context);
                                },
                                child: Icon(Icons.clear)),
                            SizedBox(
                              width: 100.w,
                            ),
                            defaultText(
                              txt: AppConst.kAppName,
                              color: AppColors.mainColor,
                              fontWeight: FontWeight.bold,
                              fontSize: 30.sp,
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 15.h,
                        ),
                        defaultText(
                          txt: 'تسجيل الدخول او انشاء حساب',
                          // color: AppColors.mainColor,
                          fontWeight: FontWeight.bold,
                          fontSize: 20.sp,
                        ),
                        SizedBox(
                          height: 10.h,
                        ),
                        defaultText(
                          txt:
                              'آدخل بريدك الالكتروني او رقم هاتف المحمول للبدء . اذا كان لديك حساب مسبق فسنجده لك.',
                          color: AppColors.textColor,
                          fontWeight: FontWeight.bold,
                          fontSize: 13.sp,
                        ),
                        SizedBox(
                          height: 20.h,
                        ),
                        BuildTextFiled(
                          validator: (value) {
                            if (value == null || value.isEmpty == true) {
                              return "أدخل اسم المشروع";
                            }
                          },
                          hint: 'البريد الالكتروني او رقم الهاتف',
                          label: 'البريد الالكتروني او رقم الهاتف',
                          changed: (val) {},
                        ),
                        SizedBox(
                          height: 20.h,
                        ),
                        DefaultButton(
                          text: 'متابعة',
                          press: () {
                            nextPage(context, PasswordPage());
                          },
                        ),
                        SizedBox(
                          height: 15.h,
                        ),
                        defaultText(
                          txt: 'هل تحتاج الي مساعدة',
                          color: AppColors.blueColor,
                          fontWeight: FontWeight.bold,
                          fontSize: 12.sp,
                        ),
                        SizedBox(
                          height: 25.h,
                        ),
                        defaultText(
                          txt:
                              'ــــــــــــــــــــــــــــــــــــــــ او ــــــــــــــــــــــــــــــــــــــــ',
                          color: AppColors.textColor,
                          fontWeight: FontWeight.bold,
                          fontSize: 14.sp,
                        ),
                        SizedBox(
                          height: 15.h,
                        ),
                        Container(
                          height: 45.h,
                          padding: EdgeInsets.only(left: 15.w, right: 15.w),
                          width: double.infinity,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(13),
                              border: Border.all(
                                  width: .4, color: AppColors.textColor)),
                          child: Row(
                            children: [
                              SvgPicture.asset('assets/images/google-icon.svg'),
                              SizedBox(
                                width: 40.w,
                              ),
                              defaultText(
                                  txt: 'تسجيل الدخول مع جوجل',
                                  fontSize: 14.sp,
                                  fontWeight: FontWeight.bold)
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 15.h,
                        ),
                        Container(
                          height: 45.h,
                          width: double.infinity,
                          padding: EdgeInsets.only(left: 15.w, right: 15.w),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(13),
                              border: Border.all(
                                  width: .4, color: AppColors.textColor)),
                          child: Row(
                            children: [
                              SvgPicture.asset('assets/images/facebook-2.svg'),
                              SizedBox(
                                width: 40.w,
                              ),
                              defaultText(
                                  txt: 'تسجيل الدخول مع الفيس بوك',
                                  fontSize: 14.sp,
                                  fontWeight: FontWeight.bold)
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 15.h,
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
                      ],
                    ),
                  ),
                ),
              ),
            );
          }),
    );
  }
}
