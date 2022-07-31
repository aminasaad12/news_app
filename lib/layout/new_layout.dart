
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/components/component.dart';
import 'package:news_app/cubit/cubit.dart';
import 'package:news_app/cubit/states.dart';
import 'package:news_app/modeules/search_screen.dart';

class NewsLayout  extends StatelessWidget {
  const NewsLayout ({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<NewCubit,NewsStates>(
      listener: ( context, state) {},
      builder: ( context, Object? state) {
        var cubit = NewCubit.get(context);
        return  Scaffold(
          appBar: AppBar(
            title:  Text(
                'New App'
            ),
            actions: [
              IconButton(
                  icon: Icon(Icons.search),
                onPressed: ()
                {
                   NavigatorTo(context, Search_Screen());
                },
              ),
              IconButton(
                  icon: Icon(Icons.brightness_4_outlined),
                onPressed: (){
                  NewCubit.get(context).changeAppMode();
                },),
            ],
          ),
          body: cubit.screens[cubit.currentIndex],
          bottomNavigationBar: BottomNavigationBar(
            currentIndex: cubit.currentIndex,
            onTap: (index){
              cubit.Changeindex(index);
            },
            items:cubit.bottomnavigation ,

          ),
        );
      },
    );
  }
}
