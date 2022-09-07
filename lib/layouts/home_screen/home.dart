import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news/layouts/app_cubit/app_cubit.dart';
import 'package:news/modules/search_screen/search_screen.dart';
import 'package:news/network/local/shared_preferences.dart';
import 'package:news/network/remote/dio_helper.dart';
import 'package:news/layouts/home_screen/home_cubit.dart';
import 'package:news/layouts/home_screen/home_states.dart';

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) {
        return NewsCubit()..getBusinessData()..getSportData();
      },
      child: BlocConsumer<NewsCubit, NewsStates>(
        listener: (BuildContext context, state) {},
        builder: (BuildContext context, state) {
          NewsCubit cubit = NewsCubit.get(context);
          return Scaffold(
            appBar: AppBar(
              title: Text(
                'Home',
              ),
              actions: [
                IconButton(
                  onPressed: () {
                    AppCubit.get(context).changeThemeMode();
                  },
                  icon: Icon(Icons.dark_mode),
                ),
                IconButton(
                  onPressed: () {
                    Navigator.push(context, MaterialPageRoute(builder:(context)=>SearchScreen() ,));
                  },
                  icon: Icon(Icons.search),
                ),
              ],
            ),
            bottomNavigationBar: BottomNavigationBar(
              items: cubit.bottomNavItemsList,
              currentIndex: cubit.currentindex,
              onTap: (index) {
                cubit.onBottomNavClick(index);
              },
            ),
            body: cubit.Screens[cubit.currentindex],
            floatingActionButton: FloatingActionButton(
              onPressed: () {
                print('you pressed the foab');
              },
              child: Icon(Icons.add),
            ),
          );
        },
      ),
    );
  }
}
