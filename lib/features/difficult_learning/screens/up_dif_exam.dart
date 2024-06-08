import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:smart_learning/features/difficult_learning/screens/resoult.dart';

import '../../../core/helper_model/q_model.dart';
import '../../../core/my_color.dart';
import '../../../generated/assets.dart';

class DifDExam extends StatefulWidget {
  const DifDExam({super.key});

  @override
  State<DifDExam> createState() => _DifExamState();
}

class _DifExamState extends State<DifDExam> {

  bool _isVisible = true;

  int th = 4;
  int the = 0;
  int tm = 8;
  int tme = 0;
  int en = 1;
  int ene = 0;
  int ed = 5;
  int ede = 0;
  int eg = 1;
  int ege = 0;
  int et = 3;
  int ete = 0;

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

  int q = 0;


  List<String> audio = [
    'audio/up/doar.aac',
    'audio/down/17.aac',
    '',
    '',
    'audio/up/aad_kad.aac',
    'audio/up/klb_kklb.aac',
    'audio/up/hadika.aac',
    'audio/down/bit_bitt.aac',
    '',
    '',
    '',
    '',
    'audio/up/kra_kkra.aac',
    'audio/up/aad_kad.aac',
    'audio/down/tmr_kamar.aac',
    'audio/up/saaid_baaid.aac',
    '',
    'audio/down/tiara.aac',
    '',
    '',
    '',
    '',
  ];

  List<String> question = [
    'استمع جيدا ثم اعد ما سمعت',
    'استمع جيدا ثم اعد ما سمعت',
    'ما هو الشكل الذي عرض امامك',
    'ما الكلمة التي عرضت امامك',
    'هل الكلمتان متشابهتان',
    'هل الكلمتان متشابهتان',
    'هل الكلمتان متشابهتان',
    'هل الكلمتان متشابهتان',
    'اختر الشكل الصحيح',
    'اختر الشكل الصحيح',
    'اختر الشكل الصحيح',
    'اختر الشكل الصحيح',
    'اختر الكلمة الصحيحة',
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
    Assets.difImagesStar,
    Assets.difImagesCard1,
    '',
    '',
    '',
    '',
    Assets.difImagesIron1T,
    Assets.difImagesTriangle4T,
    Assets.difImagesAppel2T,
    Assets.difImagesHorse1T,
    'قرى',
    'عاد',
    'تمر',
    'بعيد',
    Assets.difImagesGirl,
    '',
    Assets.difImagesLionHorseSheep,
    Assets.difImagesAppleRoseInsect,
    Assets.difImagesK,
  ];

  List<List<QModel>> answers = [
    [
      QModel(answer: 'كتاب', isTrue: false),
      QModel(answer: 'قلم', isTrue: false),
      QModel(answer: 'سبورة', isTrue: false),
      QModel(answer: 'باب', isTrue: true),
    ],
    [
      QModel(answer: '12', isTrue: false),
      QModel(answer: '20', isTrue: false),
      QModel(answer: '17', isTrue: true),
      QModel(answer: '15', isTrue: false),
    ],
    [
      QModel(answer: Assets.difImagesCloud, isTrue: false),
      QModel(answer: Assets.difImagesRectangul, isTrue: false),
      QModel(answer: Assets.difImagesStar, isTrue: true),
    ],
    [
      QModel(answer: Assets.difImagesCard1, isTrue: true),
      QModel(answer: Assets.difImagesCard2, isTrue: false),
      QModel(answer: Assets.difImagesCard3, isTrue: false),
    ],
    [
      QModel(answer: 'صح', isTrue: false),
      QModel(answer: 'خطأ', isTrue: true),
    ],
    [
      QModel(answer: 'صح', isTrue: false),
      QModel(answer: 'خطأ', isTrue: true),
    ],
    [
      QModel(answer: 'صح', isTrue: true),
      QModel(answer: 'خطأ', isTrue: false),
    ],
    [
      QModel(answer: 'صح', isTrue: false),
      QModel(answer: 'خطأ', isTrue: true),
    ],
    [
      QModel(answer: Assets.difImagesIron1T, isTrue: true),
      QModel(answer: Assets.difImagesIron2, isTrue: false),
      QModel(answer: Assets.difImagesIron3, isTrue: false),
      QModel(answer: Assets.difImagesIron4, isTrue: false),
    ],
    [
      QModel(answer: Assets.difImagesTriangle, isTrue: true),
      QModel(answer: Assets.difImagesTriangle2, isTrue: false),
      QModel(answer: Assets.difImagesTriangle3, isTrue: false),
      QModel(answer: Assets.difImagesTriangle1, isTrue: false),
    ],
    [
      QModel(answer: Assets.difImagesAppel1, isTrue: false),
      QModel(answer: Assets.difImagesAppel2T, isTrue: true),
      QModel(answer: Assets.difImagesAppel3, isTrue: false),
      QModel(answer: Assets.difImagesAppel4, isTrue: false),
    ],
    [
      QModel(answer: Assets.difImagesHorse1T, isTrue: true),
      QModel(answer: Assets.difImagesHorse2, isTrue: false),
      QModel(answer: Assets.difImagesHorse3, isTrue: false),
      QModel(answer: Assets.difImagesHorse4, isTrue: false),
    ],
    [
      QModel(answer: 'كرة', isTrue: false),
      QModel(answer: 'قرى', isTrue: true),
    ],
    [
      QModel(answer: 'عاد', isTrue: true),
      QModel(answer: 'قاد', isTrue: false),
    ],
    [
      QModel(answer: 'تمر', isTrue: true),
      QModel(answer: 'قمر', isTrue: false),
    ],
    [
      QModel(answer: 'سعيد', isTrue: false),
      QModel(answer: 'بعيد', isTrue: true),
    ],
    [
      QModel(answer: Assets.difImagesFree, isTrue: false),
      QModel(answer: Assets.difImagesM, isTrue: false),
      QModel(answer: Assets.difImagesCarPolise, isTrue: true),
      QModel(answer: Assets.difImagesBook, isTrue: true),
    ],
    [
      QModel(answer: 'جديد', isTrue: false),
      QModel(answer: 'طيارة', isTrue: true),
      QModel(answer: 'مكتبة', isTrue: false),
      QModel(answer: 'لولو', isTrue: false),
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
            quesImage != '' ? (quesImage == Assets.difImagesStar || quesImage == Assets.difImagesCard1)
                    ? AnimatedContainer(
                        width: _isVisible ? 150.w : 0.w,
                        height: _isVisible ? 150.h : 0.h,
                        color: _isVisible ? Colors.white : Colors.transparent,
                        duration: const Duration(seconds: 1),
                        child: quesImage.endsWith('.png')
                            ? Image.asset(
                                quesImage,
                                fit: BoxFit.contain,
                              )
                            : Container(
                                width: 50.w,
                                height: 60.h,
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
                      )
                    : SizedBox(
                        width: 150.w,
                        height: 150.h,
                        child: quesImage.endsWith('.png')
                            ? Image.asset(
                                quesImage,
                                fit: BoxFit.contain,
                              )
                            : Container(
                                width: 50.w,
                                height: 60.h,
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
                      )
                : SizedBox(
                    height: 100.h,
                  ),
            SizedBox(
              height: 50.h,
            ),
            quesTitle != ''
                ? Text(
                    quesTitle,
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 16.sp,
                        fontWeight: FontWeight.bold),
                  )
                : const SizedBox.shrink(),
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
            if (q < answers.length - 1) {
              stopAudio();
              setState(() {
                q++;
                if(q == 2 || q == 3) {
                  setState(() {
                  _isVisible = false;
                });
                }
                if ((q < 4) && answer[index].isTrue == true)
                  the++;
                else if ((q >= 4 && q < 12) && answer[index].isTrue == true)
                  tme++;
                else if ((q >= 12 && q < 17) && answer[index].isTrue == true)
                  ede++;
                else if ((q >= 17 && q < 18) && answer[index].isTrue == true)
                  ege++;
                else if ((q >= 18 && q < 21) && answer[index].isTrue == true)
                  ete++;
              });
              playAudio(audio[q]);
            } else {
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
            child: answer[index].answer.endsWith('.png')
                ? Image.asset(
                    answer[index].answer,
                    fit: BoxFit.cover,
                  )
                : Container(
                    width: 50.w,
                    height: 60.h,
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
