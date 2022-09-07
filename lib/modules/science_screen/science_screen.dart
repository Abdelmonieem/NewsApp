import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:news/layouts/home_screen/home_cubit.dart';
import 'package:news/layouts/home_screen/home_states.dart';
import 'package:news/shared/components.dart';

class ScienceScreen extends StatelessWidget {
  const ScienceScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    NewsCubit.get(context).getScienceData();
    return BlocConsumer<NewsCubit,NewsStates>(
      listener:(context,state){} ,
      builder:(context,state){
        var list = NewsCubit.get(context).scienceList;
        return ConditionalBuilder(
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
        );} ,

    );
  }
}
