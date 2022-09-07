import 'package:shared_preferences/shared_preferences.dart';

class shared_preferences{
  static late SharedPreferences pref;

   static Future<void> init()async{
   pref = await SharedPreferences.getInstance();
   print('shared pref done');

  }
  static void setPref({required String key, required bool vlaue})async{
   await pref.setBool(key, vlaue);
   print('shared pref setted');
  }
  static bool? getPref({required String key}){
    print('shared pref getting data');
    bool? value = pref.getBool('isdark');
    return pref.getBool(key);
  }
  static void removePref({required String key}){
     pref.remove(key);
  }


}