import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:news/layouts/home_screen/home_cubit.dart';
import 'package:news/layouts/home_screen/home_states.dart';
import 'package:news/shared/components.dart';

class BusinessScrenn extends StatelessWidget {
  const BusinessScrenn({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return BlocConsumer<NewsCubit,NewsStates>(
      listener:(context,state){} ,
      builder:(context,state){
        var list = NewsCubit.get(context).businessList;
        print(list.length);
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
