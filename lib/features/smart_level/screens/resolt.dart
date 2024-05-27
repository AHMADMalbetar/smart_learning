import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:smart_learning/core/my_color.dart';
import 'package:smart_learning/core/shared_prefereces.dart';
import 'package:smart_learning/features/choose_exam/screen/exam_type.dart';
import 'package:smart_learning/features/smart_level/post_score_response/post_score_response.dart';

class Resolt extends StatefulWidget {
  Resolt({super.key, required this.response});

  PostScoreResponse response;

  @override
  State<Resolt> createState() => _ResoltState();
}

class _ResoltState extends State<Resolt> {
  @override
  Widget build(BuildContext context) {
    return Directionality(textDirection: TextDirection.rtl, child: Scaffold(
      appBar: AppBar(
        backgroundColor: MyTheme.mainBackGroundColor,
        title: Text(
          'النتيجة',
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
            fontSize: 16.sp,
          ),
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: EdgeInsetsDirectional.symmetric(horizontal: 20.w),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Center(
              child: Container(
                width: 360.w, height: 200.h,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12.r),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.1),
                        offset: const Offset(0, 4),
                      )
                    ]
                ),
                child: Padding(
                  padding: EdgeInsetsDirectional.symmetric(horizontal: 10.w),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            '${SharedPreferenceHelper.getData(key: 'name')}',
                            style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                              fontSize: 18.sp,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 20.h,
                      ),
                      Text(
                        'العمر:                         ${SharedPreferenceHelper.getData(key: 'age')}',
                        style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                          fontSize: 18.sp,
                        ),
                      ),
                      Text(
                        'مستوى الذكاء:           ${widget.response.data!.iq}',
                        style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                          fontSize: 18.sp,
                        ),
                      ),
                      Text(
                        'النتيجة:                    ${widget.response.data!.name}',
                        style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                          fontSize: 18.sp,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 30.h,
            ),
            InkWell(
              onTap: () {
                SharedPreferenceHelper.saveData(key: 'smart_exam', value: true);
                Navigator.pushAndRemoveUntil(
                  context,
                  MaterialPageRoute(
                    builder: (context) => ExamType(),
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
                    'العودة',
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 18.sp,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    ),);
  }
}
