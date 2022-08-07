import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/cubit/app_states.dart';
import 'package:news_app/modules/business.dart';
import 'package:news_app/modules/science.dart';
import 'package:news_app/modules/settengs_screen.dart';
import 'package:news_app/modules/sport.dart';

import '../shared/network/dio_helper.dart';

class AppCubit extends Cubit<AppStates> {
  AppCubit(super.initialState);
  int currntIndex = 0;
  List<BottomNavigationBarItem> items = [
    const BottomNavigationBarItem(
        icon: Icon(Icons.add_business), label: "Business"),
    const BottomNavigationBarItem(
        icon: Icon(Icons.sports_baseball), label: "Sports"),
    const BottomNavigationBarItem(icon: Icon(Icons.science), label: "Science"),
    const BottomNavigationBarItem(
        icon: Icon(Icons.settings), label: "Settings"),
  ];
  List<Widget> screens = [
    const BusinessScreen(),
    const SprortsScreen(),
    const ScienceScreen(),
    const SettignsScreen(),
  ];
  List business = [];
  List sports = [];
  List science = [];
  void changeCurrentIndex(int index) {
    currntIndex = index;
    emit(BottomNavigationState());
  }

  void getBusiness() {
    emit(LoadingState());
    DioHelper.getData(
      url: "v2/top-headlines",
      query: {
        "country": "eg",
        "category": "business",
        'apiKey': "57c1029db2d6499a8ed60217479f7f5a",
      },
    ).then((value) {
      business = value.data['articles'];
      print(business);
      emit(BusinessGetSuccessState());
    }).catchError((onError) {
      print(onError.toString());
      emit(BusinessGetErrorState(onError.toString()));
    });
  }

  void getSports() {
    emit(LoadingState());
    DioHelper.getData(
      url: "v2/top-headlines",
      query: {
        "country": "eg",
        "category": "sports",
        'apiKey': "57c1029db2d6499a8ed60217479f7f5a",
      },
    ).then((value) {
      sports = value.data['articles'];
      emit(SportGetSuccessState());
    }).catchError((onError) {
      print(onError.toString());
      emit(SportGetErrorState(onError.toString()));
    });
  }

  void getScience() {
    emit(LoadingState());

    DioHelper.getData(
      url: "v2/top-headlines",
      query: {
        "country": "eg",
        "category": "science",
        'apiKey': "57c1029db2d6499a8ed60217479f7f5a",
      },
    ).then((value) {
      science = value.data['articles'];
      emit(ScienceGetSuccessState());
    }).catchError((onError) {
      print(onError.toString());
      emit(ScienceGetErrorState(onError.toString()));
    });
  }
}
