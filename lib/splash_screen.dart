import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:page_animation_transition/animations/scale_animation_transition.dart';
import 'package:smart_learning/core/shared_prefereces.dart';
import 'package:smart_learning/features/choose_exam/screen/exam_type.dart';
import 'package:smart_learning/features/login/screens/login_screen.dart';
import 'core/my_color.dart';
import 'package:page_animation_transition/page_animation_transition.dart';

import 'features/login/screens/sign_up_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with SingleTickerProviderStateMixin {
  @override
  void initState() {
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersive);
    var token = SharedPreferenceHelper.getData(key: 'token');
    Future.delayed(const Duration(seconds: 2), () {
      Navigator.of(context).pushAndRemoveUntil(
          PageAnimationTransition(
            page: token.toString() != '' ? LoginScreen() : ExamType(),
            //page: ExamType(),
            pageAnimationType: ScaleAnimationTransition(),
          ), (route) => false);
    });
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual,
        overlays: SystemUiOverlay.values);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: buildSplashBody(),
    );
  }

  Widget buildSplashBody() {
    return Container(
      width: double.infinity.w,
      height: double.infinity.h,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [
            MyTheme.mainBackGroundColor,
            MyTheme.numColor,
            MyTheme.mainIconColor,
          ],
          begin: Alignment.topRight,
          end: Alignment.bottomLeft,
        ),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(
            height: 200.h,
            width: 200.w,
            child: Image.asset(
              'assets/logo_splash_screen.png',
              fit: BoxFit.cover,
            ),
          ),
          SizedBox(
            height: 10.h,
          ),
          Text(
            'التعلم الذكي',
            style: TextStyle(
              color: MyTheme.mainTextColor,
              fontSize: 18.sp,
            ),
          ),
        ],
      ),
    );
  }
}
