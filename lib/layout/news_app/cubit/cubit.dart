import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/layout/news_app/bussines/business_screen.dart';
import 'package:flutter_app/layout/news_app/cubit/states.dart';
import 'package:flutter_app/layout/news_app/science/science_screen.dart';
import 'package:flutter_app/layout/news_app/sports/Sports_screen.dart';
import 'package:flutter_app/modules/bussines/business_screen.dart';
import 'package:flutter_app/modules/news_app/science/science_screen.dart';
import 'package:flutter_app/modules/science/science_screen.dart';
import 'package:flutter_app/modules/sports/Sports_screen.dart';
import 'package:flutter_app/networks/remote/dio_helper.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class NewsCubit extends Cubit<NewsStates>
{
  NewsCubit(): super(NewsInitialState());

  static NewsCubit get(context) => BlocProvider.of(context);

  int currentIndex = 0;
  List<BottomNavigationBarItem> bottomItems =
  [
    BottomNavigationBarItem(

      icon: Icon(
        Icons.business,
       ),

    label: 'business',

     ),
    BottomNavigationBarItem(
      icon: Icon(
          Icons.sports,
      ),
      label: 'sports',
    ),
    BottomNavigationBarItem(
      icon: Icon(
          Icons.science
      ),
      label: 'science',
    ),
  ];

  List<Widget> screens = [
    BusinessScreen(),
    SportsScreen(),
  ];

  void changeBottomNavBar(int index)
  {
    currentIndex = index;
    if(index == 1)
      getSports();

    if(index == 2)
      getScience();
    emit(NewsBottomNavState());
  }

  List <dynamic> business = [];

  void getBusiness()
  {
    emit(NewsGetBusinessLoadingState());
    DioHelper.getData(
      url: 'v2/top-headlines',
      query: {
        'country':'eg',
        'category':'business',
        'apikey':'65f7f556ec76449fa7dc7c0069f040ca',
      },
    ).then((value) {
      // print(value.['articles'] [0] ['title']);
      business = value.data['articles'];
      print(business[0]['title']);
      emit(NewsGetBusinessSuccessState());
    }).catchError((error){
      print(error.toString());
      emit(NewsGetBusinessErrorState(error.toString()));
    });
  }

  // ignore: non_constant_identifier_names
  List <dynamic> Sports = [];

  void getSports()
  {
    emit(NewsGetSportsLoadingState());

    if(Sports.length == 0)
      {
        DioHelper.getData(
          url: 'v2/top-headlines',
          query: {
            'country':'eg',
            'category':'sports',
            'apikey':'65f7f556ec76449fa7dc7c0069f040ca',
          },
        ).then((value) {
          // print(value.['articles'] [0] ['title']);
          Sports = value.data['articles'];
          print(Sports[0]['title']);
          emit(NewsGetSportsSuccessState());
        }).catchError((error){
          print(error.toString());
          emit(NewsGetSportsErrorState(error.toString()));
        });
      } else
        {
          emit(NewsGetSportsSuccessState());
        }


  }

  // ignore: non_constant_identifier_names
  List <dynamic> Science = [];

  void getScience()
  {
    emit(NewsGetScienceLoadingState());

    if(Science.length == 0)
      {
        DioHelper.getData(
          url: 'v2/top-headlines',
          query: {
            'country':'eg',
            'category':'science',
            'apikey':'65f7f556ec76449fa7dc7c0069f040ca',
          },
        ).then((value) {
          // print(value.['articles'] [0] ['title']);
          Science = value.data['articles'];
          print(Science[0]['title']);
          emit(NewsGetScienceSuccessState());
        }).catchError((error){
          print(error.toString());
          emit(NewsGetScienceErrorState(error.toString()));
        });
      } else
        {
          emit(NewsGetScienceSuccessState());
        }


  }
}