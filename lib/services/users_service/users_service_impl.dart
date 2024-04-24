import 'package:cleanarchwithprovider/services/network/api_urls.dart';
import 'package:cleanarchwithprovider/services/users_service/users_service.dart';
import 'package:cleanarchwithprovider/utils/user_preferences.dart';
import 'package:http/http.dart' as http;

class UsersApiServiceImpl implements UsersApiService {
  @override
  Future<String?> fetchUsers(String departmentID) async {
    try {
      final token = await UserPreferences().getToken();
      var headers = {
        'Accept': 'application/json',
        'Authorization': 'Bearer $token',
      };
      final response = await http.post(
          Uri.parse('$baseUrl/$departmentsUrl/$departmentID/$usersUrl'),
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
