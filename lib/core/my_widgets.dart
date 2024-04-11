import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'my_color.dart';

class MyWidgets{

  Widget buildBackGround(String title, {
    String? image,
  }) {
    return Container(
      width: double.infinity.w,
      height: double.infinity.h,
      color: MyTheme.mainBackGroundColor,
      child: Padding(
        padding: EdgeInsets.only(top: 20.0.h),
        child: Column(
          children: [
            SizedBox(
              width: 150.w,
              height: 150.h,
              child: Image.asset(
                image ?? 'assets/logo_splash_screen.png',
                fit: BoxFit.cover,
              ),
            ),
            Text(
              title,
              style: TextStyle(
                  color: MyTheme.mainTextColor,
                  fontSize: 28.sp,
                  fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
    );
  }


  Widget buildLoginBody(String title, Widget body, double height, {
    String? image,
  }) {
    return Stack(
      children: [
        buildBackGround(title, image: image),
        Align(
          alignment: Alignment.bottomCenter,
          child: Container(
            width: double.infinity.w,
            height: height,
            decoration: BoxDecoration(
              color: MyTheme.mainTextColor,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(40.r),
                topRight: Radius.circular(40.r),
              ),
            ),
            child: body,
          ),
        ),
      ],
    );
  }

  Widget textInDocument(String note){
    return Text(
      note,
      style: TextStyle(
        color: MyTheme.subTitleColor,
        fontSize: 16.sp,
        fontWeight: FontWeight.bold
      ),
      softWrap: true,
    );
  }

  Widget documentationScreen({
    required List<String> notes,
}){
    return Padding(
      padding: EdgeInsets.all(20.0.w),
      child: ListView.separated(
        physics: const NeverScrollableScrollPhysics(),
          shrinkWrap: true,
          itemBuilder: (context, index) => textInDocument(notes[index]),
          separatorBuilder: (context, index) => SizedBox(
            height: 15.h,
          ),
          itemCount: notes.length,
      ),
    );
  }

}