import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:smart_learning/features/difficult_learning/screens/resoult.dart';

import '../../../core/helper_model/q_model.dart';
import '../../../core/my_color.dart';
import '../../../generated/assets.dart';

class DifPExam extends StatefulWidget {
  const DifPExam({super.key});

  @override
  State<DifPExam> createState() => _DifExamState();
}

class _DifExamState extends State<DifPExam> {

  final AudioPlayer _audioPlayer = AudioPlayer();

  void playAudio(audio) async {
    await _audioPlayer.play(AssetSource(audio));
  }
  void stopAudio() async {
    await _audioPlayer.stop();
  }

  @override
  void dispose() {
    _audioPlayer.dispose();
    super.dispose();
  }

  @override
  void initState() {
    playAudio(audio[0]);
    super.initState();
  }

  int th = 5;
  int the = 0;
  int tm = 7;
  int tme = 0;
  int en = 2;
  int ene = 0;
  int ed = 4;
  int ede = 0;
  int eg = 1;
  int ege = 0;
  int et = 3;
  int ete = 0;

  int q = 0;

  List<String> audio = [
    'audio/down/taa.aac',
    'audio/down/5.aac',
    '',
    '',
    '',
    'audio/up/f.aac',
    'audio/up/sam.aac',
    'audio/up/saaid_baaid.aac',
    '',
    '',
    '',
    '',
    '',
    Assets.upSam,
    'audio/up/klm_kklm.aac',
    'audio/up/kal_kkal.aac',
    'audio/up/sam_kam.aac',
    '',
    'audio/down/ashjar.aac',
    '',
    '',
    '',
  ];

  List<String> question = [
    'استمع جيدا ثم اعد ما سمعت',
    'استمع جيدا ثم اعد ما سمعت',
    'اختر الصورة الثانية من اليمين',
    'ما هو الحرف المشابه',
    'مالرقم المشابه',
    'استمع جيدا',
    'استمع جيدا',
    'استمع جيدا',
    'اختر الشكل المختلف',
    'اختر الشكل المختلف',
    'اختر الشكل المختلف',
    'اختر الشكل المختلف',
    'ما هو لون الاسماك في الصورة',
    'كم شمعة في الصورة',
    'اختر الكلمة الصحيحة',
    'اختر الكلمة الصحيحة',
    'اختر الكلمة الصحيحة',
    '',
    'اختر الكلمة التي ستسمعها',
    'اين يقع الاسد',
    'اين تقع الزهرة',
    'اين تقع الكرة',
  ];

  List<String> questionImage = [
    '',
    '',
    Assets.difImagesCards,
    'ل',
    '7',
    '',
    '',
    '',
    '',
    '',
    '',
    '',
    Assets.difImagesQuation,
    Assets.difImagesQuation,
    '',
    '',
    '',
    Assets.difImagesPolis,
    '',
    Assets.difImagesLionHorseSheep,
    Assets.difImagesAppleRoseInsect,
    Assets.difImagesK,
  ];

  List<List<QModel>> answers = [
    [
      QModel(answer: 'ت', isTrue: true),
      QModel(answer: 'ر', isTrue: false),
      QModel(answer: 'أ', isTrue: false),
      QModel(answer: 'ي', isTrue: false),
    ],
    [
      QModel(answer: '15', isTrue: false),
      QModel(answer: '12', isTrue: false),
      QModel(answer: '2', isTrue: false),
      QModel(answer: '5', isTrue: true),
    ],
    [
      QModel(answer: Assets.difImagesBird, isTrue: false),
      QModel(answer: Assets.difImagesTree, isTrue: true),
      QModel(answer: Assets.difImagesStrwberry, isTrue: false),
      QModel(answer: Assets.difImagesPen, isTrue: false),
    ],
    [
      QModel(answer: 'ل', isTrue: true),
      QModel(answer: 'ع', isTrue: false),
      QModel(answer: 'ض', isTrue: false),
      QModel(answer: 'ث', isTrue: false),
    ],
    [
      QModel(answer: '7', isTrue: true),
      QModel(answer: '5', isTrue: false),
      QModel(answer: '9', isTrue: false),
      QModel(answer: '2', isTrue: false),
    ],
    [
      QModel(answer: 'ط', isTrue: false),
      QModel(answer: 'ب', isTrue: false),
      QModel(answer: 'ف', isTrue: true),
      QModel(answer: 'ض', isTrue: false),
    ],
    [
      QModel(answer: 'قام', isTrue: false),
      QModel(answer: 'صام', isTrue: true),
      QModel(answer: 'نام', isTrue: false),
      QModel(answer: 'مال', isTrue: false),
    ],
    [
      QModel(answer: 'بعيد', isTrue: false),
      QModel(answer: 'سعيد', isTrue: true),
      QModel(answer: 'وعيد', isTrue: false),
      QModel(answer: 'صعيد', isTrue: false),
    ],
    [
      QModel(answer: Assets.difImagesB, isTrue: false),
      QModel(answer: Assets.difImagesB, isTrue: false),
      QModel(answer: Assets.difImagesB, isTrue: false),
      QModel(answer: Assets.difImagesCharN, isTrue: true),
    ],
    [
      QModel(answer: Assets.difImagesA8, isTrue: false),
      QModel(answer: Assets.difImagesC7, isTrue: true),
      QModel(answer: Assets.difImagesA8, isTrue: false),
      QModel(answer: Assets.difImagesA8, isTrue: false),
    ],
    [
      QModel(answer: Assets.difImagesTriangleSmall, isTrue: false),
      QModel(answer: Assets.difImagesTriangleSmall, isTrue: false),
      QModel(answer: Assets.difImagesParallelogram, isTrue: true),
      QModel(answer: Assets.difImagesTriangleSmall, isTrue: false),
    ],
    [
      QModel(answer: Assets.difImagesDf, isTrue: false),
      QModel(answer: Assets.difImagesDf, isTrue: false),
      QModel(answer: Assets.difImagesWordLift, isTrue: true),
      QModel(answer: Assets.difImagesDf, isTrue: false),
    ],
    [
      QModel(answer: 'اصفر', isTrue: true),
      QModel(answer: 'ازرق', isTrue: false),
      QModel(answer: 'اسود', isTrue: false),
      QModel(answer: 'احمر', isTrue: true),
    ],
    [
      QModel(answer: '1', isTrue: true),
      QModel(answer: '2', isTrue: false),
      QModel(answer: '3', isTrue: false),
      QModel(answer: '4', isTrue: false),
    ],
    [
      QModel(answer: 'علم', isTrue: true),
      QModel(answer: 'قلم', isTrue: false),
    ],
    [
      QModel(answer: 'قال', isTrue: true),
      QModel(answer: 'كال', isTrue: false),
    ],
    [
      QModel(answer: 'صام', isTrue: false),
      QModel(answer: 'قام', isTrue: true),
    ],
    [
      QModel(answer: Assets.difImagesFree, isTrue: false),
      QModel(answer: Assets.difImagesM, isTrue: false),
      QModel(answer: Assets.difImagesCarPolise, isTrue: true),
      QModel(answer: Assets.difImagesBook, isTrue: true),
    ],
    [
      QModel(answer: 'بطئ', isTrue: false),
      QModel(answer:'اشجار', isTrue: true),
      QModel(answer: 'ثياب', isTrue: false),
      QModel(answer: 'كتب', isTrue: false),
    ],
    [
      QModel(answer: 'يسار', isTrue: false),
      QModel(answer: 'يمين', isTrue: true),
      QModel(answer: 'وسط', isTrue: false),
    ],
    [
      QModel(answer: 'يسار', isTrue: false),
      QModel(answer: 'يمين', isTrue: false),
      QModel(answer: 'وسط', isTrue: true),
    ],
    [
      QModel(answer: 'فوق', isTrue: true),
      QModel(answer: 'تحت', isTrue: false),
    ],
  ];


  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Directionality(
          textDirection: TextDirection.rtl,
          child: buildBody(buildGridBody(answer: answers[q])),
        ),
      ),
    );
  }

  Widget buildBody(body) {
    return Stack(
      children: [
        buildDifBody(quesImage: questionImage[q], quesTitle: question[q]),
        Align(
          alignment: Alignment.bottomCenter,
          child: Container(
            width: double.infinity.w,
            height: 400.h,
            decoration: BoxDecoration(
              color: MyTheme.mainTextColor,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(40.r),
                topRight: Radius.circular(40.r),
              ),
            ),
            child: body,
          ),
        ),
      ],
    );
  }

  Widget buildDifBody({
    required String quesImage,
    required String quesTitle,
}) {
    return Container(
      width: double.infinity.w,
      height: double.infinity.h,
      color: MyTheme.mainBackGroundColor,
      child: Padding(
        padding: EdgeInsets.only(top: 20.0.h),
        child: Column(
          children: [
            quesImage != '' ? SizedBox(
              width: 150.w,
              height: 150.h,
              child: quesImage.endsWith('.png') ? Image.asset(
                quesImage,
                fit: BoxFit.contain,
              ) : Container(
                width: 50.w, height: 60.h,
                color: Colors.white,
                child: Center(
                  child: Text(
                    quesImage,
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 30.sp,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ) : SizedBox(
              height: 100.h,
            ),
            SizedBox(
              height: 50.h,
            ),
            quesTitle != '' ? Text(
                quesTitle,
              style: TextStyle(
                color: Colors.black,
                fontSize: 16.sp,
                fontWeight: FontWeight.bold
              ),
            ) : const SizedBox.shrink(),
          ],
        ),
      ),
    );
  }

  Widget buildGridBody({
    required List<QModel> answer,
}) {
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
          onTap: () {
            if(q < answers.length - 1){
              stopAudio();
              setState(() {
                q++;
                if((q < 5) && answer[index].isTrue == true) the++;
                else if((q >= 5 && q < 12) && answer[index].isTrue == true) tme++;
                else if((q >= 12 && q < 14) && answer[index].isTrue == true) ene++;
                else if((q >= 14 && q < 18) && answer[index].isTrue == true) ede++;
                else if((q >= 18 && q < 19) && answer[index].isTrue == true) ege++;
                else if((q >= 19) && answer[index].isTrue == true)ete++;
              });
              playAudio(audio[q]);
            }
            else{
              Navigator.pushAndRemoveUntil(
                  context,
                  MaterialPageRoute(
                      builder: (context) => Resoult(
                        thakera: (the * 100) ~/ th,
                        tmyeez: (tme * 100) ~/ tm,
                        entibah: (ene * 100) ~/ en,
                        edrak: (ede * 100) ~/ ed,
                        eglak: (ege * 100) ~/ eg,
                        etijahat: (ete * 100) ~/ et,
                      ),
                  ),
                  (route) => false,
              );
            }
          },
          child: Container(
            color: Colors.white,
            width: 130.w,
            height: 70.h,
            child: answer[index].answer.endsWith('.png') ? Image.asset(
              answer[index].answer,
              fit: BoxFit.cover,
            ) : Container(
              width: 50.w, height: 60.h,
              color: Colors.white,
              child: Center(
                child: Text(
                  answer[index].answer,
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 25.sp,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ),
        ),
        itemCount: answer.length,
      ),
    );
  }
}
