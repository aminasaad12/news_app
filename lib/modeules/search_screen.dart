
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/components/component.dart';
import 'package:news_app/cubit/cubit.dart';
import 'package:news_app/cubit/states.dart';

class Search_Screen extends StatelessWidget {
  var searchController= TextEditingController();
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<NewCubit,NewsStates>(
      listener: (context,satate){},
      builder: (context, state) {
        var list = NewCubit.get(context).search;
        return Scaffold(
          appBar: AppBar(),
          body: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(12.0),
                child: Container(
                    child: FieldWidget(
                      onChanged: (value) {
                        NewCubit.get(context).getSearchData(value!);
                      },
                      controller: searchController,
                      type: TextInputType.text,
                      labelText: 'search',
                      iconData: Icons.search,
                      validate: (value) {
                        if (value == null || value.isEmpty) {
                          return 'search  must not  be empty';
                        }
                        return null;
                      },)
                ),
              ),
             Expanded(child:MyItemBuilder(list, context,isSearch:true)),
            ],
          ),
        );
      }
   );

  }
}
