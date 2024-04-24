import 'package:cleanarchwithprovider/services/login_service/login_service.dart';
import 'package:cleanarchwithprovider/services/network/api_urls.dart';
import 'package:http/http.dart' as http;

class LoginApiServiceImpl implements LoginApiService {
  // final ServiceFactory serviceFactory = ServiceFactory();
  @override
  Future<String?> loginUser(String email, String password) async {
    try {
      final body = {
        'username': email,
        'password': password,
        'grant_type': 'password',
        'client_id': '629569fa-8c19-477b-bdee-828e1ae83463',
        'scope': 'offline_access'
      };
      final response =
          await http.post(Uri.parse('$baseUrl/$loginUrl'), body: body);

      print('Response ${response.reasonPhrase}');

      if (response.statusCode >= 200 && response.statusCode < 300) {
        return response.body;
      }
      print(response.statusCode);
      return '';
    } catch (e) {
      throw Exception(e);
    }
  }
}
