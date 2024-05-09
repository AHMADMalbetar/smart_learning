import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:smart_learning/core/my_color.dart';
import 'package:smart_learning/core/my_widgets.dart';

import '../../difficult_learning/screens/difficult_learning_documentation.dart';
import '../../smart_level/screens/smart_level_documentation.dart';


class ExamType extends StatelessWidget {

  List<String> title = [
    'صعوبات التعلم',
    'مستوى الذكاء',
  ];

  var screens = [
    DifficultLearningDocumentation(),
    SmartLevelDocumentation(),
  ];

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        body: MyWidgets().buildLoginBody('اختر نوع الاختبار', buildExamType(), 350.h, isFromNet: false),
        endDrawer: Drawer(
          child: drawerBody(),
        ),
        appBar: AppBar(
          elevation: 0,
          backgroundColor: MyTheme.mainBackGroundColor,
        ),
      ),
    );
  }

  Widget buildExamType(){
    return Padding(
      padding: EdgeInsets.only(top: 100.0.h, left: 30.w, right: 30.w),
      child: ListView.separated(
        shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemBuilder: (context, index) => buildExamTypeBottonTranslate(title[index], context, screens[index]),
          separatorBuilder: (context, index) => SizedBox(
            height: 30.h,
          ),
          itemCount: screens.length,
      ),
    );
  }

  Widget buildExamTypeBottonTranslate(String examTitle, context, Widget screen){
    return InkWell(
      child: Container(
        decoration: BoxDecoration(
          color: MyTheme.mainBackGroundColor,
          borderRadius: BorderRadius.circular(5.r),
        ),
        height: 40.h,
        child: Center(
          child: Text(
            examTitle,
            style: TextStyle(
              color: MyTheme.mainTextColor,
              fontWeight: FontWeight.bold,
              fontSize: 14.sp,
            ),
          ),
        ),
      ),
      onTap: (){
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => screen,
            ),
        );
      },
    );
  }

  Widget drawerBody(){
    return Scaffold(
      appBar: AppBar(
        backgroundColor: MyTheme.mainBackGroundColor,
        elevation: 0,
      ),
      body: Column(
        children: [
          Container(
            color: MyTheme.mainBackGroundColor,
            height: 100.h,
          ),
        ],
      ),
    );
  }

}
