import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:smart_learning/features/smart_level/repo/smart_level_repo.dart';

import '../../../core/my_widgets.dart';
import '../get_smart_level_exam_response/get_smart_level_exam_response.dart';

class SmartLevelExam extends StatefulWidget {
  const SmartLevelExam({super.key});

  @override
  State<SmartLevelExam> createState() => _SmartLevelExamState();
}

class _SmartLevelExamState extends State<SmartLevelExam> {

  late GetSmartLevelExamResponse exams;
  int selectedExam = 0;

  @override
  void initState() {
    fetchData();
    super.initState();
  }

  fetchData() async {
    var response = await SmartLevelRepo().getExams();
    setState(() {
      exams = response;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(

    );
  }

  Widget buildBody() {
    return MyWidgets().buildLoginBody(exams.data![selectedExam].title!, buildGridBody(), 450.h, image: exams.data![selectedExam].img);
  }

  Widget buildGridBody() {
    return GridView.builder(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
        itemBuilder: (context, index) => Container(),
    );
  }

}

