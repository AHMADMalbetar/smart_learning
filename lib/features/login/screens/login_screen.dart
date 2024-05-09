import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:page_animation_transition/animations/right_to_left_faded_transition.dart';
import 'package:page_animation_transition/page_animation_transition.dart';
import 'package:smart_learning/core/my_color.dart';
import 'package:smart_learning/features/login/repository/repo/login_register_repo.dart';
import 'package:smart_learning/features/login/screens/sign_up_screen.dart';
import '../../../componentes/tost_componente.dart';
import '../../../core/my_widgets.dart';
import '../../../core/shared_prefereces.dart';
import '../../choose_exam/screen/exam_type.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({super.key});

  var oldController = TextEditingController();
  var phoneController = TextEditingController();
  var passwordController = TextEditingController();

  FocusNode focusNode = FocusNode();
  FocusNode focusNode1 = FocusNode();
  FocusNode focusNode2 = FocusNode();

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: SafeArea(
        child: Scaffold(
          appBar: AppBar(
            backgroundColor: MyTheme.mainBackGroundColor,
            elevation: 0,
            leading: IconButton(
              icon: Icon(Icons.arrow_back, size: 25.sp, color: Colors.white,),
              onPressed: (){
                Navigator.pushAndRemoveUntil(
                    context,
                    MaterialPageRoute(
                      builder: (context) => SignUpScreen(),
                    ),
                        (route) => false,
                );
              },
            ),
          ),
          body: WillPopScope(
            onWillPop: () async {
              focusNode.unfocus();
              focusNode1.unfocus();
              focusNode2.unfocus();
              return true;
            },
            child: MyWidgets().buildLoginBody('اشتقنا اليك', buildLogin(context), 380.h, isFromNet: false),
          ),
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
            height: 5.h,
          ),
          SizedBox(
            height: 40.h,
            child: TextFormField(
              focusNode: focusNode,
              controller: phoneController,
              decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(15.r),
                  borderSide: BorderSide(
                    color: MyTheme.numColor,
                  ),
                ),
                focusColor: MyTheme.numColor,
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: MyTheme.numColor,
                  ),
                  borderRadius: BorderRadius.circular(15.r),
                ),
                labelText: 'رقم الهاتف',
                labelStyle: const TextStyle(
                  color: Colors.grey,
                  fontSize: 12,
                ),
              ),
            ),
          ),
          SizedBox(
            height: 10.h,
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
            height: 5.h,
          ),
          SizedBox(
            height: 40.h,
            child: TextFormField(
              focusNode: focusNode1,
              controller: oldController,
              decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(15.r),
                  borderSide: BorderSide(
                    color: MyTheme.numColor,
                  ),
                ),
                focusColor: MyTheme.numColor,
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: MyTheme.numColor,
                  ),
                  borderRadius: BorderRadius.circular(15.r),
                ),
                labelText: 'العمر',
                labelStyle: const TextStyle(
                  color: Colors.grey,
                  fontSize: 12,
                ),
              ),
            ),
          ),
          SizedBox(
            height: 10.h,
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
            height: 5.h,
          ),
          SizedBox(
            height: 40.h,
            child: TextFormField(
              focusNode: focusNode2,
              controller: passwordController,
              decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(15.r),
                  borderSide: BorderSide(
                    color: MyTheme.numColor,
                  ),
                ),
                focusColor: MyTheme.numColor,
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: MyTheme.numColor,
                  ),
                  borderRadius: BorderRadius.circular(15.r),
                ),
                prefixIcon: Icon(
                  Icons.lock_outline,
                ),
                labelText: 'كلمة السر',
                labelStyle: const TextStyle(
                  color: Colors.grey,
                  fontSize: 12,
                ),
              ),
            ),
          ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                'لديك حساب: ',
                style: TextStyle(
                    color: MyTheme.subTitleColor,
                    fontSize: 12.sp,
                    fontWeight: FontWeight.bold
                ),
              ),
              TextButton(
                onPressed: (){
                  Navigator.pushAndRemoveUntil(
                    context,
                    MaterialPageRoute(
                      builder: (context) => SignUpScreen(),
                    ),
                        (route) => false,
                  );
                },
                child: Text(
                  'انشئ حساب',
                  style: TextStyle(
                      color: MyTheme.numColor,
                      fontSize: 12.sp,
                      fontWeight: FontWeight.bold
                  ),
                ),
              ),
            ],
          ),
          SizedBox(
            height: 20.h,
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
                      color: Colors.white,
                  ),
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
        SnackBarComp().customSnackBar('الرجاء ادخال الرقم', Colors.red),
      );
      return;
    }else if (old == "") {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBarComp().customSnackBar('الرجاء ادخال العمر', Colors.red),
      );
      return;
    }else if (password == "") {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBarComp().customSnackBar('الرجاء ادخال كلمة السر', Colors.red),
      );
      return;
    }
    
    var response = await LoginRegisterRepo().login(phone: phone, password: password, age: old);

    if(response.data!.token != null){
      print(response.data!.token);
      SharedPreferenceHelper.saveData(key: 'token', value: response.data!.token);
      SharedPreferenceHelper.saveData(key: 'age', value: response.data!.user!.age);
      SharedPreferenceHelper.saveData(key: 'name', value: response.data!.user!.name);
      print(SharedPreferenceHelper.getData(key: 'token'));
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBarComp().customSnackBar(response.message!, Colors.green),
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
        SnackBarComp().customSnackBar(response.message!, Colors.red),
      );
    }
  }
}
