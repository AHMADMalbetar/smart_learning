import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../core/my_color.dart';
import '../../../core/shared_prefereces.dart';
import '../../choose_exam/screen/exam_type.dart';

class Resoult extends StatefulWidget {
  Resoult({super.key, required this.thakera, required this.tmyeez, required this.entibah, required this.edrak, required this.eglak, required this.etijahat});

  final int thakera;
  final int tmyeez;
  final int entibah;
  final int edrak;
  final int eglak;
  final int etijahat;

  @override
  State<Resoult> createState() => _ResoultState();
}

class _ResoultState extends State<Resoult> {
  
  @override
  void initState() {
    SharedPreferenceHelper.saveData(key: 'def_ok', value: true);
    super.initState();
  }
  
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
                            '${SharedPreferenceHelper.getData(key: 'userName')}',
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
                        'الذاكرة:                         ${widget.thakera}',
                        style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                          fontSize: 18.sp,
                        ),
                      ),Text(
                        'التمييز:                         ${widget.tmyeez}',
                        style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                          fontSize: 18.sp,
                        ),
                      ),Text(
                        'الادراك:                         ${widget.edrak}',
                        style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                          fontSize: 18.sp,
                        ),
                      ),Text(
                        'الاغلاق:                         ${widget.eglak}',
                        style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                          fontSize: 18.sp,
                        ),
                      ),Text(
                        'الاتجاهات:                         ${widget.etijahat}',
                        style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                          fontSize: 18.sp,
                        ),
                      ),
                      widget.entibah != 0 ? Text(
                        'الانتباه:                         ${widget.entibah}',
                        style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                          fontSize: 18.sp,
                        ),
                      ) : const SizedBox.shrink(),
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
