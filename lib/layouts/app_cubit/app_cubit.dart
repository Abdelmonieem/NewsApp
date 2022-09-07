import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news/layouts/app_cubit/app_cubit_states.dart';
import 'package:news/network/local/shared_preferences.dart';

class AppCubit extends Cubit<AppStates>{
  AppCubit() : super(IntialAppState());
  static AppCubit get(BuildContext context)=>BlocProvider.of(context);

  bool isdark=false;
  bool isfirsttime=true;
  void changeThemeMode(){
    if(isfirsttime){
      // shared_preferences.setPref(key: 'isdark', vlaue: false);
      bool? sharedvalue =shared_preferences.getPref(key: 'isdark');
      print('this is the first time');
      isfirsttime=false;
      if(sharedvalue==null)
      {
        print('sharedvalue is null');
        shared_preferences.setPref(key: 'isdark', vlaue: isdark);
        emit(savetosharedprefState());
      }else{
        print('the sharedvalue is not null');
        isdark=sharedvalue;
        emit(ThemeModeAppState());
      }

    }else{
      print('this is not the first time');
      isdark= !isdark;
      shared_preferences.setPref(key: 'isdark', vlaue: isdark);
      print(isdark);
      emit(ThemeModeAppState());
    }
  }
}