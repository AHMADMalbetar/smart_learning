import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:page_animation_transition/animations/right_to_left_faded_transition.dart';
import 'package:page_animation_transition/page_animation_transition.dart';
import 'package:smart_learning/componentes/TFF_componante.dart';
import 'package:smart_learning/core/my_color.dart';
import '../../../componentes/tost_componente.dart';
import '../../../core/my_widgets.dart';
import '../../../core/shared_prefereces.dart';
import '../../choose_exam/screen/exam_type.dart';
import '../cubit/login_cubit.dart';
import '../repository/model/login_register_response.dart';
import '../repository/repo/login_register_repo.dart';
import 'login_screen.dart';

class SignUpScreen extends StatelessWidget {
  SignUpScreen({super.key});

  var nameController = TextEditingController();
  var oldController = TextEditingController();
  var phoneController = TextEditingController();
  var passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => LoginCubit(),
      child: BlocConsumer<LoginCubit, LoginState>(
        listener: (context, state) {},
        builder: (context, state) {
          return Directionality(
            textDirection: TextDirection.rtl,
            child: SafeArea(
              child: Scaffold(
                body: MyWidgets().buildLoginBody('اهلا بك', buildLogin(context), 460.h),
              ),
            ),
          );
        },
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
            'الاسم: ',
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
            Controller: nameController,
            save: false,
            Label: 'اسمي',
          ),
          SizedBox(
            height: 15.h,
          ),
          Text(
            'العمر: ',
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
            Label: 'عمري',
          ),
          SizedBox(
            height: 15.h,
          ),
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
            height: 15.h,
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
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => LoginScreen(),
                        ),
                    );
                  },
                  child: Text(
                    'تسجيل الدخول',
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
            onTap: () => onPressSignUp(context),
            child: Container(
              height: 40.h,
              decoration: BoxDecoration(
                color: MyTheme.mainBackGroundColor,
                borderRadius: BorderRadius.circular(15.r),
              ),
              child: Center(
                child: Text(
                  'انشاء الحساب',
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

  onPressSignUp(BuildContext context) async {
    var name = nameController.text.toString();
    var old = oldController.text.toString();
    var phone = phoneController.text.toString();
    var password = passwordController.text.toString();

    if (name == "") {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBarComp().customSnackBar('الرجاء ادخال الاسم'),
      );
      return;
    }
    else if (old == "") {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBarComp().customSnackBar('الرجاء ادخال العمر'),
      );
      return;
    }
    else if (phone == "") {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBarComp().customSnackBar('الرجاء ادخال الرقم'),
      );
      return;
    }else if (password == "") {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBarComp().customSnackBar('الرجاء ادخال كلمة السر'),
      );
      return;
    }

    var response = await LoginRegisterRepo().register(email: phone, password: password, age: old, name: name);

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
