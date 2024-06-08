import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:smart_learning/core/my_color.dart';
import 'package:smart_learning/core/my_widgets.dart';
import 'package:smart_learning/core/shared_prefereces.dart';

import '../../difficult_learning/screens/difficult_learning_documentation.dart';
import '../../smart_level/screens/smart_level_documentation.dart';


class ExamType extends StatefulWidget {

  @override
  State<ExamType> createState() => _ExamTypeState();
}

class _ExamTypeState extends State<ExamType> {
  List<String> title = [
    'صعوبات التعلم',
    'مستوى الذكاء',
  ];

  var screens = [
    DifficultLearningDocumentation(),
    SmartLevelDocumentation(),
  ];

  @override
  void initState() {
    print(SharedPreferenceHelper.getData(key: 'token'));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        body: MyWidgets().buildLoginBody('اختر نوع الاختبار', buildExamType(context), 350.h, isFromNet: false),
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

  Widget buildExamType(context){
    return Padding(
      padding: EdgeInsets.only(top: 100.0.h, left: 30.w, right: 30.w),
      child: Column(
        children: [
          InkWell(
            child: Container(
              decoration: BoxDecoration(
                color: MyTheme.mainBackGroundColor,
                borderRadius: BorderRadius.circular(5.r),
              ),
              height: 40.h,
              child: Center(
                child: Text(
                  'صعوبات التعلم',
                  style: TextStyle(
                    color: MyTheme.mainTextColor,
                    fontWeight: FontWeight.bold,
                    fontSize: 14.sp,
                  ),
                ),
              ),
            ),
            onTap: (){
              if((SharedPreferenceHelper.getData(key: 'def_ok') == true)){
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                    content: Text(
                      'لقد قمت بهذا الاختبار من قبل',
                    ),
                    backgroundColor: Colors.red,
                  ),
                );
                return;
              }
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => DifficultLearningDocumentation(),
                ),
              );
              // if((SharedPreferenceHelper.getData(key: 'age') <= 14 && index == 0) || (index == 1)){
              //
              // }
              // else{
              //   ScaffoldMessenger.of(context).showSnackBar(
              //     SnackBar(
              //       backgroundColor: Colors.red,
              //         content: Text(
              //           'هذا الاختبار مخصص للاطفال ما دون 14 سنة',
              //           style: TextStyle(
              //             color: Colors.white,
              //             fontSize: 18.sp,
              //             fontWeight: FontWeight.bold
              //           ),
              //         ),
              //     ),
              //   );
              // }
            },
          ),
          SizedBox(
            height: 20.h,
          ),
          InkWell(
            child: Container(
              decoration: BoxDecoration(
                color: MyTheme.mainBackGroundColor,
                borderRadius: BorderRadius.circular(5.r),
              ),
              height: 40.h,
              child: Center(
                child: Text(
                  'مستوى الذكاء',
                  style: TextStyle(
                    color: MyTheme.mainTextColor,
                    fontWeight: FontWeight.bold,
                    fontSize: 14.sp,
                  ),
                ),
              ),
            ),
            onTap: (){
              if(SharedPreferenceHelper.getData(key: 'smart_exam') == true){
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                    content: Text(
                      'لقد قمت بهذا الاختبار من قبل',
                    ),
                    backgroundColor: Colors.red,
                  ),
                );
                return;
              }
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => SmartLevelDocumentation(),
                ),
              );
              // if((SharedPreferenceHelper.getData(key: 'age') <= 14 && index == 0) || (index == 1)){
              //
              // }
              // else{
              //   ScaffoldMessenger.of(context).showSnackBar(
              //     SnackBar(
              //       backgroundColor: Colors.red,
              //         content: Text(
              //           'هذا الاختبار مخصص للاطفال ما دون 14 سنة',
              //           style: TextStyle(
              //             color: Colors.white,
              //             fontSize: 18.sp,
              //             fontWeight: FontWeight.bold
              //           ),
              //         ),
              //     ),
              //   );
              // }
            },
          )
        ],
      )
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
