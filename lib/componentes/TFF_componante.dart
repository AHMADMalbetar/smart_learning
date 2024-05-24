import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:smart_learning/core/my_color.dart';

Widget defTextFormField({
  IconData? pre,
  IconData? suf,
  required var Controller,
  required bool save,
  required String Label,
  Function()? sufWork,
  Function()? onFiledSubmet,
  Function()? validate,
  Function()? ttfTap,
  FocusNode? focusNode,
  TextInputType? writeType,
  Color? defColor = Colors.teal,
}) =>
    SizedBox(
      height: 40.h,
      child: TextFormField(
        onTap: ttfTap,
        obscureText: save,
        controller: Controller,
        focusNode: focusNode,
        decoration: InputDecoration(
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(15.r),
            borderSide: BorderSide(
              color: MyTheme.numColor,
            ),
          ),
          focusColor: MyTheme.numColor,
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(
              color: MyTheme.numColor,
            ),
            borderRadius: BorderRadius.circular(15.r),
          ),
          prefixIcon: Icon(
            pre,
            color: defColor,
          ),
          suffixIcon: IconButton(
            onPressed: sufWork,
            icon: Icon(suf, color: defColor),
          ),
          labelText: Label,
          labelStyle: const TextStyle(
            color: Colors.white,
            fontSize: 12,
          ),
        ),
        style: const TextStyle(
            color: Colors.white
        ),
        onFieldSubmitted: (onFiledSubmet) {},
        validator: (validator){},
      ),
    );