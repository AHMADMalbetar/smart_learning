import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:smart_learning/core/my_color.dart';
import 'package:smart_learning/core/my_widgets.dart';
import 'package:smart_learning/features/difficult_learning/screens/dix_exam.dart';

class DifficultLearningDocumentation extends StatelessWidget {
  DifficultLearningDocumentation({super.key});

  List<String> notes = [
    '1. الاختبار مخصص للاعمار ما بين ال 6 وال 14 سنة',
    '2. مقسمين الى فئتين (من 6 لل 10) فئة (من 11 لل 14) فئة',
    '3. الفرق بين الفئتين هو عدد الاسئلة في فئات الاسئلة',
    '4. عند اتمام حل الاسئلة سيتم احتساب الاجابات الصحيحة والاجابات الخاطئة واعطاء النتيجة',
    '5. الاسئلة هي عبارة عن اختبار سمعي ولفظي واختبار ذاكرة',
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
                    builder: (context) => const DifPExam(),
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

