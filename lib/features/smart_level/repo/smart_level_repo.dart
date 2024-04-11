import 'package:http/http.dart' as http;
import 'package:smart_learning/core/shared_prefereces.dart';

import '../../../app_config.dart';
import '../get_smart_level_exam_response/get_smart_level_exam_response.dart';

class SmartLevelRepo {
  Future<GetSmartLevelExamResponse> getExams() async {
    var url = Uri.parse('${AppConfig.BASE_URL}/api/question?typeId=1');
    final response = await http.get(
      url,
      headers: {
        "Authorization" : "Bearer ${SharedPreferenceHelper.getData(key: 'token')}",
      }
    );
    return getSmartLevelExamResponseFromJson(response.body);
  }
}
