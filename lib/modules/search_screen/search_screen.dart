import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:news/layouts/home_screen/home_cubit.dart';
import 'package:news/layouts/home_screen/home_states.dart';
import 'package:news/shared/components.dart';

class SearchScreen extends StatelessWidget {
  final TextEditingController textController=TextEditingController();
   SearchScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return BlocConsumer<NewsCubit,NewsStates>(
      listener:(context,state){} ,
      builder:(context,state){
        var list = NewsCubit.get(context).searchList;
        var cubit = NewsCubit.get(context);
        return Scaffold(
          appBar: AppBar(),
          body: Column(
            children: [
              Container(
                padding: EdgeInsets.all(20.0),
                child: TextFormField(
                  controller: textController,
                  keyboardType: TextInputType.text,
                  style: Theme.of(context).textTheme.bodyText1,
                  decoration: InputDecoration(
                    prefixIcon: Icon(Icons.search),
                    label: Text(
                      'Search',
                      style:Theme.of(context).textTheme.bodyText1,
                    ),
                    fillColor: Colors.grey[500],filled: true,
                    hintText: 'Search',
                    hintStyle:Theme.of(context).textTheme.bodyText1 ,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20.0),
                    ),


                  ),
                  onTap: (){},
                  onChanged: (value){
                    cubit.getSearchList(value);
                  },
                  onFieldSubmitted: (value){},
                  validator: (value){},
                ),
              ),
              Expanded(
                child:textController.text.isEmpty?Container(): ConditionalBuilder(
                  condition: list.length>1,
                  builder: (context) => ListView.separated(
                    physics: BouncingScrollPhysics(),
                    itemBuilder: (context,index){
                      return NewsItemView(list[index],context);
                    },
                    separatorBuilder: (context,index){
                      return Divider(height: 10.0,color: Colors.deepOrange,);
                    },
                    itemCount: list.length,
                  ),
                  fallback: (BuildContext context) => SpinKitRing(
                    color: Colors.deepOrange,
                    size: 50.0,
                  ),
                ),
              ),
            ],
          ),
        );
        } ,

    );
  }
}