import 'package:cleanarchwithprovider/utils/constants.dart';
import 'package:shared_preferences/shared_preferences.dart';

class UserPreferences {
  Future<void> saveToken(String userToken) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();

    await prefs.setString(appToken, userToken);
  }

  Future<String?> getToken() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString(appToken);
  }
}
