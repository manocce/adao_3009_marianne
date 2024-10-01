import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:untitled/datasource/shared_preferences.datasource.dart';

class LoginController extends GetxController{
  final Rx<String> _email = Rx("");
  final Rx<String> _password = Rx("");
  final Rx<String?> message = Rx(null);
  final Rx<bool> logged = Rx(false);
  late SharedPreferenceDataSource _dataSource;

  String get email => _email.value;

  String get password => _password.value;

  initController() async{
    _dataSource.initPreference();
  }

  save(String email, String password){
    bool isValid = true;

    if(email.isEmpty){
      message.value = "Informe o e-mail";
      isValid = false;
    }


    if(password.isEmpty){
      message.value = "Informe o password";
      isValid = false;
    }

    if(isValid){
      _dataSource.save("email", email);
      _dataSource.save("password", password);
      logged.value = true;
      //salvar no preference
    }

  }

}