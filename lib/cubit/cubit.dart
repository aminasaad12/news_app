
import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/cache_helper/cache_help.dart';
import 'package:news_app/cubit/states.dart';
import 'package:news_app/dio_helper/dio_help.dart';
import 'package:news_app/modeules/business_screen.dart';
import 'package:news_app/modeules/science_screen.dart';
import 'package:news_app/modeules/search_screen.dart';
import 'package:news_app/modeules/sports_screen.dart';

class NewCubit extends Cubit<NewsStates>{

   NewCubit() : super(NewInitialState());

   static NewCubit get(context) => BlocProvider.of(context);

   int currentIndex = 0;

   List<BottomNavigationBarItem>bottomnavigation =
   [
      BottomNavigationBarItem(
         icon: Icon(Icons.business),
         label: 'Business',
      ),
      BottomNavigationBarItem(
         icon: Icon(Icons.sports),
         label: 'Sport',
      ),
      BottomNavigationBarItem(
         icon: Icon(Icons.science_outlined),
         label: 'Science',
      ),
      // BottomNavigationBarItem(
      //    icon: Icon(Icons.settings),
      //    label: 'Settings',
      // ),

   ];

   List<Widget>screens = [
      Business_Screen(),
      Sports_Screen(),
      Science_Screen(),
   //   Settings_Screen(),
   ];

   void Changeindex(index) {
      currentIndex = index;
      if(index ==1)
         getSportsData();
      if(index == 2)
         getScienceData();
      emit(Changebottomnavigation());
   }

   List<dynamic> business=[];

   void getBusinessData(){
          emit(NewLoadingbusinessstate());
      DioHelper.getData(
         url: 'v2/top-headlines',
         query:
         {
            'country':'eg',
            'category':'business',
            'apiKey':'4614339d6b23420a87c65c5e6de5152b',
         },
      ).then((value)
      {
        // print(value.data.toString());
         business=value.data['articles'];
         print(business);
         emit(NewgetBusinessDataSuccessfuly());
      }).catchError((error){
         print(error.toString());
            emit(NewgetBusinessDataerrorsState(error.toString()));
      });
   }

   List<dynamic> sports=[];

   void getSportsData(){
      emit(NewLoadingsportsstate());
     if(sports.length ==0)
     {
        DioHelper.getData(
           url: 'v2/top-headlines',
           query:
           {
              'country':'eg',
              'category':'sports',
              'apiKey':'4614339d6b23420a87c65c5e6de5152b',
           },
        ).then((value)
        {
           // print(value.data.toString());
           sports=value.data['articles'];
           print(sports);
           emit(NewgetSportsDataSuccessfuly());
        }).catchError((error){
           print(error.toString());
           emit(NewgetSportsDataerrorsState(error.toString()));
        });
     }
     else
        {
        emit(NewgetSportsDataSuccessfuly());

     }
   }




   List<dynamic> science=[];

   void getScienceData(){
      emit(NewLoadingsciencestate());
      if(science.length == 0){
         DioHelper.getData(
            url: 'v2/top-headlines',
            query:
            {
               'country':'eg',
               'category':'science',
               'apiKey':'4614339d6b23420a87c65c5e6de5152b',
            },
         ).then((value)
         {
            // print(value.data.toString());
            science=value.data['articles'];
            print(science);
            emit(NewgetScienceDataSuccessfuly());
         }).catchError((error){
            print(error.toString());
            emit(NewgetScienceDataerrorsState(error.toString()));
         });
      }
      else{
         emit(NewgetScienceDataSuccessfuly());
      }
   }

   bool isDark = false;

   void changeAppMode({bool? fromShared})
   {
      if(fromShared !=null)
         isDark=fromShared;
      else
      isDark = !isDark;

      CacheHelper.setData(key: 'isDark', value: isDark).then((value)
      {
         emit(AppChangeModeState());

      });
   }

   List<dynamic> search=[];

   void getSearchData(String value){
      emit(NewLoadingsearchstate());
      DioHelper.getData(
         url: 'v2/everything',
         query:
         {
            'q':'${value}',
            'apiKey':'4614339d6b23420a87c65c5e6de5152b',
         },
      ).then((value)
      {
         // print(value.data.toString());
         search=value.data['articles'];
         print(search);
         emit(NewgetSearchDataSuccessfuly());
      }).catchError((error){
         print(error.toString());
         emit(NewgetSearchDataerrorsState(error.toString()));
      });
   }

}