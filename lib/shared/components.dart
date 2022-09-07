import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:news/modules/web_view/web_view.dart';

Widget  NewsItemView(list,context){
  return InkWell(
    onTap: (){
      Navigator.push(context, MaterialPageRoute(builder:(context)=> WebViewScreen(url: list['url'],)));
    },
    child: Container(
      padding: EdgeInsets.symmetric(horizontal: 20.0,vertical: 10.0),
      child: Row(
        children: [
          Container(
            width: 120.0,
            height: 120.0,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20.0),
              image: DecorationImage(
                image: NetworkImage(
                    '${list['urlToImage']}',
                ),
                fit: BoxFit.cover,
              ),
            ),

          ),
          SizedBox(width: 20.0,),
          Expanded(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text(
                  '${list['title']}',
                  maxLines: 3,
                  overflow: TextOverflow.ellipsis,
                  style: Theme.of(context).textTheme.bodyText1,
                ),
                SizedBox(height: 10.0,),
                Text(
                  '${list['publishedAt']}',
                  maxLines: 1,
                  style: Theme.of(context).textTheme.bodyText2,
                ),
              ],
            ),
          ),
        ],
      ),
    ),
  );
}
Widget DefaultTextForm(){
  return Text('default');
}
// Widget NavigatTo(context,Widget){
//   return Navigator.push(context, Widget);
// }