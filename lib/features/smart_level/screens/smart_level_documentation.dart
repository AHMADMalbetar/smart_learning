import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../core/my_color.dart';
import '../../../core/my_widgets.dart';
import 'SmartLevelExam.dart';

class SmartLevelDocumentation extends StatelessWidget {

  List<String> notes = [
    '1. الاختبار مكون من ثلاثة فئات مرتبة كالاتي (أ - أب - ب)',
    '2. كل فئة من الفئات مكونة من اثني عشر سؤال مختلفا',
    '3. عند الضغط على زر ابدا سيتم بدء العداد التنازلي للوقت وسيتم احتساب لكل فئة عمرية وقتا مخصصا',
    '4. عند اتمام حل الاسئلة سيتم احتساب الاجابات الصحيحة والاجابات الخاطئة واعطاء النتيجة',
    '5. سيتم تخزين النتيجة والتاريخ في الارشيف الموجود في الصفجة الاساسية',
    'الاوقات المحتسبة حسب الاعمار:',
    '1 - (من 5 سنوات الى 10 سنوات) و (من 60 سنة الى 68 سنة) سبتم احتساب ثلاثون دقيقة (30m)',
    '2 - (من 10 سنوات الى 15 سنة) و (من 48 سنة الى 60 سنة) سبتم احتساب اثنين وعشرين دقيقة دقيقة(22m)',
    '3 - (من 15 سنة الى 24 سنة) و (من 36 سنة الى 48 سنة) سبتم احتساب اربعة عشر دقيقة دقيقة(14m)',
    '4 - (من 24 سنة الى 36 سنى) سبتم سبع دقائق(7m)',
  ];

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: MyTheme.mainBackGroundColor,
          elevation: 0,
          leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: const Icon(
              Icons.arrow_back_outlined,
              color: Colors.white,
            ),
          ),
        ),
        body: buildDifficultBody(context),
      ),
    );
  }

  Widget buildDifficultBody(context) {
    return MyWidgets()
        .buildLoginBody('الية تقديم الاختبار', buildDocumentation(context), 400.h, isFromNet: false);
  }

  Widget buildDocumentation(context) {
    return SingleChildScrollView(
      physics: const BouncingScrollPhysics(),
      child: Column(
        children: [
          MyWidgets().documentationScreen(notes: notes),
          Padding(
            padding: EdgeInsets.all(20.0.h),
            child: InkWell(
              onTap: () {
                Navigator.pushAndRemoveUntil(
                    context,
                    MaterialPageRoute(
                        builder: (context) => SmartLevelExam(),
                    ),
                        (route) => false,
                );
              },
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10.r),
                  color: MyTheme.numColor,
                ),
                width: 200.w,
                height: 40.h,
                child: Center(
                  child: Text(
                    'هيا لنبدا',
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 18.sp,
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
