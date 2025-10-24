import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_m_9/Module_14/CRUD/crud.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(360, 690),
      minTextAdapt: true,
      splitScreenMode: true,

      builder: (_, child) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          theme: ThemeData(

              brightness: Brightness.light,
              primaryColor: Colors.deepPurple,
              primarySwatch: Colors.teal,

              elevatedButtonTheme: ElevatedButtonThemeData(
                  style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.orange,
                      foregroundColor: Colors.white,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8)))),
              inputDecorationTheme: InputDecorationTheme(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),

                  ),
                  enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20),
                      borderSide: BorderSide(color: Colors.grey, width: 1.5)),
                  focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20),
                      borderSide: BorderSide(color: Colors.orange, width: 1.5)),

                  hintStyle: TextStyle(
                      color: Colors.deepPurple
                  )
              ),

              textTheme: TextTheme(
                  bodyLarge: TextStyle(
                      fontSize: 20, fontWeight: FontWeight.bold),
                  titleMedium: TextStyle(fontSize: 16)
              ),

            cardTheme: CardThemeData(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
            ),

          ),
          darkTheme: ThemeData.dark(),
          themeMode: ThemeMode.system,
          title: 'Batch-12',
          home: Crud(),
          // initialRoute: '/bottomNav',
          // routes: {
          //   '/home' : (contex) => TravelHomeScreen(),
          //   '/class1' : (contex) => Alert(),
          //   '/class2' : (contex) => Module12Class1(),
          //   '/bottomNav' : (contex) => BottomNav(),
          // },
        );
      },
    );
  }}

