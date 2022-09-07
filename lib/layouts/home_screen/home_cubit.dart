import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news/layouts/home_screen/home_states.dart';
import 'package:news/modules/business_screen/business_screen.dart';
import 'package:news/modules/science_screen/science_screen.dart';
import 'package:news/modules/settings_screen/settings_screen.dart';
import 'package:news/modules/sports_screen/sports_screen.dart';
import 'package:news/network/local/shared_preferences.dart';
import 'package:news/network/remote/dio_helper.dart';

class NewsCubit extends Cubit<NewsStates>{
  NewsCubit() : super(NewsIntialState());
  static NewsCubit get(context)=> BlocProvider.of(context);


  int currentindex = 0;
  List<Widget> Screens=[
    BusinessScrenn(),
    SportsScreen(),
    ScienceScreen(),
  ];
  List<BottomNavigationBarItem> bottomNavItemsList=[
    BottomNavigationBarItem(icon: Icon(Icons.business,),label: 'Business'),
    BottomNavigationBarItem(icon: Icon(Icons.sports,),label: 'Sports'),
    BottomNavigationBarItem(icon: Icon(Icons.science,),label: 'Science'),
  ];
  void onBottomNavClick(int index){
    currentindex = index;
    emit(ChangeBotNavState());
  }

  List businessList = [''];
  void getBusinessData(){
    emit(NewsBusinessLoading());
    DioHelper.getData(
      url: 'v2/top-headlines',
      query: {
        'country': 'eg',
        'category': 'business',
        'apiKey': 'ec4e01a3521e490f9c7c9f29e7accb51',
      },
    ).then((value) {
      // here is the list of articles
      businessList = value.data['articles'];
      emit(NewsGetBusinessDataSuccess());
      print(businessList);
      // print(value.data['articles'][0]['title']);
    }).catchError((error) {
      print(error.toString());
      emit(NewsGetBusinessDataError(error.toString()));
    });
  }

  List sportList = [''];
  void getSportData(){
    emit(NewsSportLoading());
    DioHelper.getData(
      url: 'v2/top-headlines',
      query: {
        'country': 'eg',
        'category': 'sport',
        'apiKey': 'ec4e01a3521e490f9c7c9f29e7accb51',
      },
    ).then((value) {
      // here is the list of articles
      sportList = value.data['articles'];
      emit(NewsGetSportDataSuccess());
      print(value.data['articles'][0]['title']);
    }).catchError((error) {
      print(error.toString());
      emit(NewsGetSportDataError(error.toString()));
    });
  }

  List scienceList = [''];
  void getScienceData(){
    emit(NewsScienceLoading());
    DioHelper.getData(
      url: 'v2/top-headlines',
      query: {
        'country': 'eg',
        'category': 'science',
        'apiKey': 'ec4e01a3521e490f9c7c9f29e7accb51',
      },
    ).then((value) {
      // here is the list of articles
      scienceList = value.data['articles'];
      emit(NewsGetScienceDataSuccess());
      print(value.data['articles'][0]['title']);
    }).catchError((error) {
      print(error.toString());
      emit(NewsGetScienceDataError(error.toString()));
    });
  }

  List searchList = [];
  void getSearchList(value){
    emit(NewsSearchLoading());
    DioHelper.getData(
      url: 'v2/top-headlines',
      query: {
        'q': '$value',
        'apiKey': 'ec4e01a3521e490f9c7c9f29e7accb51',
      },
    ).then((value) {
      // here is the list of articles
      searchList = value.data['articles'];
      emit(NewsGetSearchDataSuccess());
      print(value.data['articles'][0]['title']);
    }).catchError((error) {
      print(error.toString());
      emit(NewsGetSearchDataError(error.toString()));
    });
  }

}