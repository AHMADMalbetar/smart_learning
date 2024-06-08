import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:smart_learning/core/my_color.dart';
import 'package:smart_learning/core/shared_prefereces.dart';
import 'package:smart_learning/features/smart_level/repo/smart_level_repo.dart';
import 'package:smart_learning/features/smart_level/screens/resolt.dart';

import '../../../core/my_widgets.dart';
import '../get_smart_level_exam_response/get_smart_level_exam_response.dart';

class SmartLevelExam extends StatefulWidget {
  const SmartLevelExam({super.key});

  @override
  State<SmartLevelExam> createState() => _SmartLevelExamState();
}

class _SmartLevelExamState extends State<SmartLevelExam> {
  GetSmartLevelExamResponse? exams;
  int selectedExam = 0;
  int trueAnswer = 0;
  int secondsRemaining = 60 * 60; // 1 hour in seconds
  Timer? timer;

  @override
  void initState() {
    fetchData();
    startTimer();
    super.initState();
  }

  @override
  void dispose() {
    timer!.cancel(); // Cancel the timer to avoid memory leaks
    super.dispose();
  }

  int makeExamTime() {
    if ((SharedPreferenceHelper.getData(key: 'age') >= 5 &&
            SharedPreferenceHelper.getData(key: 'age') < 11) ||
        (SharedPreferenceHelper.getData(key: 'age') >= 61 &&
            SharedPreferenceHelper.getData(key: 'age') <= 69)) {
      return 30 * 60;
    } else if ((SharedPreferenceHelper.getData(key: 'age') >= 11 &&
            SharedPreferenceHelper.getData(key: 'age') < 16) ||
        (SharedPreferenceHelper.getData(key: 'age') >= 49 &&
            SharedPreferenceHelper.getData(key: 'age') < 61)) {
      return 22 * 60;
    } else if ((SharedPreferenceHelper.getData(key: 'age') >= 16 &&
            SharedPreferenceHelper.getData(key: 'age') < 25) ||
        (SharedPreferenceHelper.getData(key: 'age') >= 37 &&
            SharedPreferenceHelper.getData(key: 'age') < 49)) {
      return 14 * 60;
    } else if ((SharedPreferenceHelper.getData(key: 'age') >= 25 &&
        SharedPreferenceHelper.getData(key: 'age') < 37)) {
      return 7 * 60;
    } else {
      return 30 * 60;
    }
  }

  void startTimer() {
    secondsRemaining = makeExamTime();
    timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      setState(() {
        if (secondsRemaining > 0) {
          secondsRemaining--;
          print(secondsRemaining);
        } else {
          timer.cancel();
          finishTime();
        }
      });
    });
  }

  finishTime() async {
    var response = await SmartLevelRepo().postScore(score: trueAnswer);
    Navigator.pushAndRemoveUntil(
      context,
      MaterialPageRoute(
        builder: (context) => Resolt(response: response,),
      ),
          (route) => false,
    );
  }

  fetchData() async {
    var response = await SmartLevelRepo().getExams();
    setState(() {
      exams = response;
    });
    print('the Exams $exams');
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Directionality(
          textDirection: TextDirection.rtl,
          child: buildBody(),
        ),
      ),
    );
  }

  Widget buildBody() {
    return exams == null
        ? Center(
            child: CircularProgressIndicator(
              color: MyTheme.numColor,
            ),
          )
        : Stack(
            children: [
              MyWidgets().buildLoginBody(
                "${selectedExam + 1}. ${exams!.data![selectedExam].title!} : ${selectedExam < 12 ? "أ" : (selectedExam < 24 && selectedExam >= 12) ? "أب" : selectedExam >= 24 ? "ب" : ''}",
                buildGridBody(),
                450.h,
                image: exams!.data![selectedExam].img!,
                isFromNet: true,
              ),
              Positioned(
                top: 20.h,
                child: MyWidgets()
                    .buildTimerWidget(secondsRemaining, makeExamTime()),
              ),
            ],
          );
  }

  Widget buildGridBody() {
    return Padding(
      padding: EdgeInsets.only(left: 10.w, right: 10.w, top: 20.h),
      child: GridView.builder(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2, // Number of columns
          mainAxisSpacing: 15.0.h,
          crossAxisSpacing: 20.0.w,
        ),
        physics: const NeverScrollableScrollPhysics(),
        itemBuilder: (context, index) => InkWell(
          onTap: () async {
            if (selectedExam == 35) {
              var response = await SmartLevelRepo().postScore(score: trueAnswer);
              print(response);
              Navigator.pushAndRemoveUntil(
                context,
                MaterialPageRoute(
                  builder: (context) => Resolt(
                    response: response,
                  ),
                ),
                    (route) => false,
              );
            }
            else{
              setState(() {
                selectedExam++;
                print(selectedExam);
                if (exams!.data![selectedExam].choices![index].istrue! == true) {
                  trueAnswer++;
                }
              });
              print(trueAnswer);
            }
          },
          child: Column(
            children: [
              Container(
                width: 130.w,
                height: 70.h,
                child: Image.network(
                  '${exams!.data![selectedExam].choices![index].img}',
                  fit: BoxFit.cover,
                ),
              ),
              SizedBox(
                height: 10.h,
              ),
              Text(
                '${exams!.data![selectedExam].choices![index].description}',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 14.sp,
                ),
              ),
            ],
          ),
        ),
        itemCount: exams!.data![selectedExam].choices!.length,
      ),
    );
  }
}
