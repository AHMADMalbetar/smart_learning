import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';
import 'package:smart_learning/generated/assets.dart';

import 'my_color.dart';

class MyWidgets {
  Widget buildBackGround(
    String title, {
    String? image,
    bool isFromNetWork = false,
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
              child: isFromNetWork == true
                  ? Image.network(
                      image ?? Assets.assetsMainLogo,
                      fit: BoxFit.cover,
                    )
                  : Image.asset(
                      image ?? Assets.assetsMainLogo,
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

  Widget buildLoginBody(
    String title,
    Widget body,
    double height, {
    String? image,
    required bool isFromNet,
  }) {
    return Stack(
      children: [
        buildBackGround(title, image: image, isFromNetWork: isFromNet),
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

  Widget textInDocument(String note) {
    return Text(
      note,
      style: TextStyle(
          color: Colors.white,
          fontSize: 16.sp,
          fontWeight: FontWeight.bold),
      softWrap: true,
    );
  }

  Widget documentationScreen({
    required List<String> notes,
  }) {
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

  Widget buildTimerWidget(time, allTime) {
    return CircularPercentIndicator(
      radius: 40.0.r,
      lineWidth: 10.0.w,
      percent: time / allTime,
      circularStrokeCap: CircularStrokeCap.round,
      progressColor: MyTheme.numColor,
      backgroundColor: Colors.grey,
      center: Text(
        '${(time ~/ 60).toString().padLeft(2, '0')}:${(time % 60).toString().padLeft(2, '0')}',
        style: TextStyle(
            fontSize: 14.0.sp,
            fontWeight: FontWeight.bold,
            color: Colors.black),
      ),
    );
  }
}
