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
import '../repository/repo/login_register_repo.dart';
import 'login_screen.dart';

class SignUpScreen extends StatelessWidget {
  SignUpScreen({super.key});

  var nameController = TextEditingController();
  var oldController = TextEditingController();
  var phoneController = TextEditingController();
  var passwordController = TextEditingController();
  FocusNode focusNode = FocusNode();
  FocusNode focusNode1 = FocusNode();
  FocusNode focusNode2 = FocusNode();
  FocusNode focusNode3 = FocusNode();

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
                body: WillPopScope(
                  onWillPop: () async {
                    focusNode.unfocus();
                    focusNode1.unfocus();
                    focusNode2.unfocus();
                    focusNode3.unfocus();
                    return true;
                  },
                  child: MyWidgets().buildLoginBody('اهلا بك', buildLogin(context), 460.h, isFromNet: false),
                ),
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
            focusNode: focusNode,
          ),
          SizedBox(
            height: 12.h,
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
            focusNode: focusNode1,

          ),
          SizedBox(
            height: 12.h,
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
            writeType: TextInputType.phone,
            focusNode: focusNode2,

          ),
          SizedBox(
            height: 12.h,
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
            focusNode: focusNode3,

          ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                'لديك حساب: ',
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 12.sp,
                    fontWeight: FontWeight.bold
                ),
              ),
              TextButton(
                  onPressed: (){
                    Navigator.pushAndRemoveUntil(
                        context,
                        MaterialPageRoute(
                          builder: (context) => LoginScreen(),
                        ),
                            (route) => false,
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
            height: 10.h,
          ),
          InkWell(
            onTap: () => onPressSignUp(context),
            child: Container(
              height: 40.h,
              decoration: BoxDecoration(
                color: MyTheme.numColor,
                borderRadius: BorderRadius.circular(15.r),
              ),
              child: Center(
                child: Text(
                  'انشاء الحساب',
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

  onPressSignUp(BuildContext context) async {
    var name = nameController.text.toString();
    var old = oldController.text.toString();
    var phone = phoneController.text.toString();
    var password = passwordController.text.toString();

    if (name == "") {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBarComp().customSnackBar('الرجاء ادخال الاسم', Colors.red),
      );
      return;
    }
    else if (old == "") {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBarComp().customSnackBar('الرجاء ادخال العمر', Colors.red),
      );
      return;
    }
    else if (phone == "") {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBarComp().customSnackBar('الرجاء ادخال الرقم', Colors.red),
      );
      return;
    }else if (password == "") {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBarComp().customSnackBar('الرجاء ادخال كلمة السر', Colors.red),
      );
      return;
    }

    var response = await LoginRegisterRepo().register(phone: phone, password: password, age: old, name: name);

    if(response.data!.token != null){
      SharedPreferenceHelper.saveData(key: 'token', value: response.data!.token);
      SharedPreferenceHelper.saveData(key: 'age', value: response.data!.user!.age);
      SharedPreferenceHelper.saveData(key: 'name', value: response.data!.user!.name);
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
