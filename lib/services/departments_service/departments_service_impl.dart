import 'package:cleanarchwithprovider/services/departments_service/departments_service.dart';
import 'package:cleanarchwithprovider/services/network/api_urls.dart';
import 'package:cleanarchwithprovider/utils/user_preferences.dart';
import 'package:http/http.dart' as http;

class DepartmentApiServiceImpl implements DepartmentApiService {
  @override
  Future<String?> fetchDepartments() async {
    try {
      final token = await UserPreferences().getToken();
      var headers = {
        'Accept': 'application/json',
        'Authorization': 'Bearer $token',
      };
      final response = await http.get(Uri.parse('$baseUrl/$departmentsUrl'),
          headers: headers);

      if (response.statusCode >= 200 && response.statusCode < 300) {
        return response.body;
      }
      return '';
    } catch (e) {
      throw Exception(e);
    }
  }
}
