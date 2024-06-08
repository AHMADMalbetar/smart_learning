import 'package:http/http.dart' as http;
import 'package:smart_learning/core/shared_prefereces.dart';
import 'package:smart_learning/features/smart_level/post_score_response/post_score_response.dart';

import '../../../app_config.dart';
import '../get_smart_level_exam_response/get_smart_level_exam_response.dart';

class SmartLevelRepo {
  Future<GetSmartLevelExamResponse> getExams() async {
    var url = Uri.parse('${AppConfig.BASE_URL}/api/question?typeId=1');
    print(SharedPreferenceHelper.getData(key: 'token'));
    final response = await http.get(
      url,
      headers: {
        "Authorization" : "Bearer 139|745v51zNkiEqYi1hSUZhMGh9lioMvrpMCUSz0FZm72b4c6f4",
        "Accept": "application/json",
      }
    );
    print(getSmartLevelExamResponseFromJson(response.body));
    return getSmartLevelExamResponseFromJson(response.body);
  }

  Future<PostScoreResponse> postScore({required int score}) async {
    var url = Uri.parse('${AppConfig.BASE_URL}/api/score?score=$score&typeId=1');
    print(SharedPreferenceHelper.getData(key: 'token'));
    final response = await http.post(
      url,
      headers: {
        "Authorization" : "Bearer 139|745v51zNkiEqYi1hSUZhMGh9lioMvrpMCUSz0FZm72b4c6f4",
        "Accept": "application/json",
      }
    );
    return postScoreResponseFromJson(response.body);
  }
}
