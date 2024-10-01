import 'package:shared_preferences/shared_preferences.dart';

class SharedPreferenceDataSource {
  late SharedPreferences _preference;

  initPreference() async{
    _preference = await SharedPreferences.getInstance();
  }

  save(String key, String value){
    _preference.setString(key, value);
  }
}