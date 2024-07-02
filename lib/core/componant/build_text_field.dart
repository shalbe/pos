import 'dart:core';

import 'package:flutter/material.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pos_project/core/colors/colors.dart';

class BuildTextFiled extends StatelessWidget {
  TextEditingController? controller;
  String? hint;
  String? label;
  IconData? icon;
  final String? Function(String?)? validator;
  final String? Function(String?)? changed;
  IconData? suffixIcon;
  bool? obscure;
  bool? autoFocus;
  TextInputType? type;
  final FormFieldSetter<String>? onSaved;
  Function()? press;
  Function()? ontap;
  List<TextInputFormatter>? inputFormatters;

  BuildTextFiled({
    super.key,
    this.changed,
    this.autoFocus = false,
    this.onSaved,
    this.controller,
    this.hint,
    this.icon,
    this.label,
    this.obscure = false,
    this.ontap,
    this.press,
    this.suffixIcon,
    this.type,
    this.validator,
    this.inputFormatters,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      validator: validator,
      
      onChanged: changed,
      cursorColor: Colors.black,
      autofocus: autoFocus!,
      decoration: InputDecoration(
        contentPadding: EdgeInsets.only(left: 14.w, right: 10.w),
        border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(14),
            borderSide: BorderSide(color: Colors.grey.shade400)),
        focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(14),
            borderSide: BorderSide(color: Colors.grey.shade400)),
        enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(14),
            borderSide: BorderSide(color: Colors.grey.shade400)),
        labelStyle: TextStyle(color: AppColors.mainColor),
        labelText: label,
        hintText: hint,
        hintStyle: TextStyle(color: Colors.grey.shade500, fontSize: 13),

        floatingLabelBehavior: FloatingLabelBehavior.always,
        // suffixIcon: CustomSurffixIcon(svgIcon: "assets/icons/Mail.svg"),
      ),
      inputFormatters: inputFormatters,
    );
  }
}
