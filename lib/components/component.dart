

import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:news_app/modeules/web_screen.dart';

Widget BulidArticalItem(articles,context) => InkWell(
  onTap: ()
  {
    NavigatorTo(context, Web_Screen(articles['url']));
  },
  child:   Padding(
    padding: const EdgeInsets.all(20.0),
    child: Row(
      children: [
        Container(

          height: 120.0,

          width: 120.0,

          decoration: BoxDecoration(

              borderRadius: BorderRadius.circular(20.0),

              image:articles['urlToImage'] !=null ? DecorationImage(

                  image: NetworkImage(

                      '${articles['urlToImage']}'

                  ),

                  fit: BoxFit.cover,

              ): const DecorationImage(

                image: NetworkImage(

                    'https://icon-library.com/images/no-image-available-icon/no-image-available-icon-6.jpg'



                ),

                fit: BoxFit.cover,

              )

          ),

        ),
        SizedBox(



          width: 13.0,

        ),
        Expanded(

          child: Container(

            height: 120.0,

            child: Column(

              crossAxisAlignment: CrossAxisAlignment.start,

              mainAxisAlignment: MainAxisAlignment.start,

              children: [

                Expanded(

                    child: Text('${articles['title']}',

                      style: Theme.of(context).textTheme.bodyText1,







                      maxLines: 3,







                      overflow: TextOverflow.ellipsis,







                    )















                ),







                Text('${articles['publishedAt']}',







                  style: TextStyle(







                    color: Colors.grey,







                  ),),







              ],







            ),







          ),







        ),

      ],
    ),
  ),
);

Widget MyDivider()=> Padding(
  padding: const EdgeInsets.only(
    left: 20.0,
    right: 20.0,
  ),
  child: Container(
    height: 1.0,
    color: Colors.grey[300],
  ),
);

 Widget MyItemBuilder(list,context, {isSearch= false})=>ConditionalBuilder(
   condition:list.length >0,
   builder: (context)=> ListView.separated(
       physics: BouncingScrollPhysics(),
       itemBuilder: (context,index)=>MyDivider(),
       separatorBuilder:(context,index)=>BulidArticalItem(list[index],context) ,
       itemCount: list.length

   ),
   fallback: (context)=> isSearch ? Container() :  Center(child: CircularProgressIndicator()),
 );


Widget FieldWidget({
  TextEditingController? controller,
  required TextInputType  type,
   String? hintText,
  required String labelText,
  required IconData iconData,
  required String? Function(String?)? validate,
  required String? Function(String?)? onChanged ,
  IconData? suffixIcon,
  VoidCallback? onPressedfun,
  bool obscureText = false,


})=> Material(
  elevation: 20.0,
  borderRadius: BorderRadius.circular(28.0),
  child: Container(
    child:TextFormField(
      controller:controller,
      keyboardType:type,
      onChanged: onChanged,
      onFieldSubmitted: (String value){
        print(value);
      },
      validator: validate,
      obscureText:obscureText,
      style: TextStyle(color: Colors.deepOrange),
      cursorColor: Colors.deepOrange,
      decoration: InputDecoration(
          labelText:labelText,
          labelStyle: new TextStyle(
            color: const Color(0xFF424242),
          ),

          border:OutlineInputBorder(
            borderRadius: BorderRadius.circular(28.0),
          ),
          focusedBorder:OutlineInputBorder(
            borderRadius: BorderRadius.circular(23.0),
            borderSide:
            BorderSide(
                color: Colors.grey,width: 1),
          ),
          prefixIcon: Icon(
            iconData,
            color: Colors.grey,
          ),

      ),
    ),
  ),
);



void  NavigatorTo(context,widght)=> Navigator.push(
    context,
    MaterialPageRoute(
        builder: ( context)=>  widght,
    )
);






