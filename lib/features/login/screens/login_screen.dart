import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:page_animation_transition/animations/right_to_left_faded_transition.dart';
import 'package:page_animation_transition/page_animation_transition.dart';
import 'package:smart_learning/componentes/TFF_componante.dart';
import 'package:smart_learning/core/my_color.dart';
import 'package:smart_learning/features/login/repository/model/login_register_response.dart';
import 'package:smart_learning/features/login/repository/repo/login_register_repo.dart';
import '../../../componentes/tost_componente.dart';
import '../../../core/my_widgets.dart';
import '../../../core/shared_prefereces.dart';
import '../../choose_exam/screen/exam_type.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({super.key});

  var oldController = TextEditingController();
  var phoneController = TextEditingController();
  var passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: SafeArea(
        child: Scaffold(
          appBar: AppBar(
            backgroundColor: MyTheme.mainBackGroundColor,
            elevation: 0,
          ),
          body: MyWidgets().buildLoginBody('اشتقنا اليك', buildLogin(context), 380.h),
        ),
      ),
    );
  }

  Widget buildLogin(context) {
    return Padding(
      padding: EdgeInsets.all(20.0.w),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'رقم الهاتف: ',
            style: TextStyle(
              color: MyTheme.subTitleColor,
              fontWeight: FontWeight.bold,
              fontSize: 18.sp,
            ),
          ),
          SizedBox(
            height: 10.h,
          ),
          defTextFormField(
            Controller: phoneController,
            save: false,
            Label: 'رقم الهاتف',
          ),
          SizedBox(
            height: 20.h,
          ),
          Text(
            'العمر : ',
            style: TextStyle(
              color: MyTheme.subTitleColor,
              fontWeight: FontWeight.bold,
              fontSize: 18.sp,
            ),
          ),
          SizedBox(
            height: 10.h,
          ),
          defTextFormField(
            Controller: oldController,
            save: false,
            Label: 'العمر',
          ),
          SizedBox(
            height: 20.h,
          ),
          Text(
            'كلمة السر: ',
            style: TextStyle(
              color: MyTheme.subTitleColor,
              fontWeight: FontWeight.bold,
              fontSize: 18.sp,
            ),
          ),
          SizedBox(
            height: 10.h,
          ),
          defTextFormField(
            Controller: passwordController,
            save: false,
            Label: 'كلمة السر',
          ),
          SizedBox(
            height: 50.h,
          ),
          InkWell(
            onTap: () => onPressedLogin(context),
            child: Container(
              height: 40.h,
              decoration: BoxDecoration(
                color: MyTheme.mainBackGroundColor,
                borderRadius: BorderRadius.circular(15.r),
              ),
              child: Center(
                child: Text(
                  'تسجيل الدخول',
                  style: TextStyle(
                      fontSize: 16.sp,
                      fontWeight: FontWeight.bold,
                      color: Colors.white),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  onPressedLogin(BuildContext context) async {
    var old = oldController.text.toString();
    var phone = phoneController.text.toString();
    var password = passwordController.text.toString();

    if (phone == "") {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBarComp().customSnackBar('الرجاء ادخال الرقم'),
      );
      return;
    }else if (old == "") {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBarComp().customSnackBar('الرجاء ادخال العمر'),
      );
      return;
    }else if (password == "") {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBarComp().customSnackBar('الرجاء ادخال كلمة السر'),
      );
      return;
    }
    
    var response = await LoginRegisterRepo().login(email: phone, password: password, age: old);

    if(response.data!.token != null){
      SharedPreferenceHelper.saveData(key: 'AuthResponse', value: loginRegisterResponseToJson(response));
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBarComp().customSnackBar(response.message!),
      );
      Navigator.pushAndRemoveUntil(
        context,
        PageAnimationTransition(
          page: ExamType(),
          pageAnimationType: RightToLeftFadedTransition(),
        ),
            (route) => false,
      );
    }
    else{
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBarComp().customSnackBar(response.message!),
      );
    }
  }
}
