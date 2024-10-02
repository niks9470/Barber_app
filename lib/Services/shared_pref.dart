import 'package:shared_preferences/shared_preferences.dart';

class SharedPreferenceHelper{

  static String userIdKey ="USERKEY";
  static String userNameKey="USERNAME";
  static String userEmailKey="USEREMAILKEY";
  static String userImageKey="USERIMAGEKEY";

  Future<bool> saveUserId(String getUserId)async{
    SharedPreferences prefs=await SharedPreferences.getInstance();
    return prefs.setString(userIdKey, getUserId);
  }
  Future<bool> saveUserName(String getUserName)async{
    SharedPreferences prefs =await SharedPreferences.getInstance();
    return prefs.setString(userNameKey, getUserName);
  }
  Future<bool> saveEmailKey(String getUSerEmail)async{
    SharedPreferences prefs=await SharedPreferences.getInstance();
    return prefs.setString(userEmailKey, getUSerEmail);
  }
  Future<bool> saveImageKey(String getUserImage)async{
    SharedPreferences prefs=await SharedPreferences.getInstance();
    return prefs.setString(userImageKey, getUserImage);

  }

  Future<String?>getUserName()async{
    SharedPreferences prefs =await SharedPreferences.getInstance();
    return prefs.getString(userNameKey);
  }
  Future<String?>getUserId()async{
    SharedPreferences prefs =await SharedPreferences.getInstance();
    return prefs.getString(userIdKey);
  }
  Future<String?>getUserImage()async{
    SharedPreferences prefs =await SharedPreferences.getInstance();
    return prefs.getString(userImageKey);
  }
  Future<String?>getUserEmail()async{
    SharedPreferences prefs =await SharedPreferences.getInstance();
    return prefs.getString(userEmailKey);
  }
}