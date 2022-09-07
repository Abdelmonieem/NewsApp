import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news/layouts/app_cubit/app_cubit.dart';
import 'package:news/layouts/app_cubit/app_cubit_states.dart';
import 'package:news/layouts/home_screen/home.dart';
import 'package:news/layouts/home_screen/home_cubit.dart';
import 'package:news/layouts/home_screen/home_states.dart';
import 'package:news/modules/bloc_observer/bloc_observer.dart';
import 'package:news/network/local/shared_preferences.dart';
import 'package:news/network/remote/dio_helper.dart';
import 'package:shared_preferences/shared_preferences.dart';

Future<void> main() async {

  WidgetsFlutterBinding.ensureInitialized();
  BlocOverrides.runZoned(
        () {
      // Use blocs...
    },
    blocObserver: MyBlocObserver(),
  );
  DioHelper.init();
  await shared_preferences.init();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {

  const MyApp( {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(providers: [
      BlocProvider(create: (context)=>NewsCubit()),

    ],
      child: BlocProvider(
        create: (BuildContext context)=> AppCubit()..changeThemeMode(),
        child: BlocConsumer<AppCubit,AppStates>(
          listener: (
            BuildContext context, state) {
          print(state);
        },
          builder: (BuildContext context, Object? state) { return MaterialApp(
            debugShowCheckedModeBanner: false,
            theme: ThemeData(
              primarySwatch:Colors.deepOrange,
              scaffoldBackgroundColor: Colors.white,
              appBarTheme: AppBarTheme(
                // backwardsCompatibility: true,
                  systemOverlayStyle: SystemUiOverlayStyle(
                    statusBarColor: Colors.white,
                  ),
                  color: Colors.white,
                  titleTextStyle: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontSize: 20.0,
                  ),
                  elevation: 0.0,
                  iconTheme: IconThemeData(color: Colors.black)
              ),
              floatingActionButtonTheme: FloatingActionButtonThemeData(
              ),
              bottomNavigationBarTheme: BottomNavigationBarThemeData(
                type: BottomNavigationBarType.fixed,
                selectedItemColor: Colors.deepOrange,
              ),
              textTheme: TextTheme(
                bodyText1: TextStyle(
                  color: Colors.black,
                  fontSize: 20.0,
                  fontWeight: FontWeight.w900,
                ),
                bodyText2: TextStyle(
                  fontSize: 15.0,
                  color: Colors.grey[800],
                ),

              ),
            ),
            darkTheme:ThemeData(
              primarySwatch:Colors.deepOrange,
              textTheme: TextTheme(
                bodyText1: TextStyle(
                  color: Colors.white,
                  fontSize: 20.0,
                  fontWeight: FontWeight.w900,
                ),
                bodyText2: TextStyle(
                  fontSize: 15.0,
                  color: Colors.grey[400],
                ),


              ),
              scaffoldBackgroundColor: Colors.black,
              appBarTheme: AppBarTheme(
                // backwardsCompatibility: false,
                  systemOverlayStyle: SystemUiOverlayStyle(
                      statusBarColor: Colors.black,
                      statusBarIconBrightness:Brightness.light,
                  ),
                  color: Colors.black,
                  titleTextStyle: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 20.0,
                  ),
                  elevation: 0.0,
                  iconTheme: IconThemeData(color: Colors.white)
              ),
              floatingActionButtonTheme: FloatingActionButtonThemeData(backgroundColor: Colors.deepOrange),
              bottomNavigationBarTheme: BottomNavigationBarThemeData(
                type: BottomNavigationBarType.fixed,
                selectedItemColor: Colors.deepOrange,
                backgroundColor: Colors.black,
                elevation: 30.0,
                unselectedItemColor: Colors.white,
              ),
            ),
            themeMode: AppCubit.get(context).isdark? ThemeMode.dark:ThemeMode.light,
            home: Home(),
          );
          },
        ),
      ),
    );
  }
}
