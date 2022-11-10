import 'package:flutter/material.dart';
import 'package:project_parkinson/ui/init_page.dart';

void main() {
  runApp(const MyApp());
}

/*
padding은 일단 고정값이 다른 화면에서도 잘 나올 것 같아서 그렇게 진행.
추후에 다른 화면에서도 안깨지는지 테스트가 필요함.
*/
class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Project Parkinson',
      builder: (context, child) => MediaQuery(
        data: MediaQuery.of(context).copyWith(textScaleFactor: 0.82),
        child: child!,
      ),
      theme: ThemeData(
        scaffoldBackgroundColor: Colors.white,
        primaryColor: const Color.fromRGBO(208, 208, 208, 1),
        // dividerColor: ,
        textTheme: const TextTheme(
          headlineMedium: TextStyle(), // main page user name
          headlineSmall: TextStyle(), // main page say hello
          labelLarge: TextStyle(
            color: Colors.black,
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ), // app bar title
          bodyMedium: TextStyle(
            color: Colors.black,
            fontSize: 17,
          ),
          bodySmall: TextStyle(
            color: Colors.black,
            fontSize: 14,
          ),
        ),
      ),
      darkTheme: ThemeData(
        scaffoldBackgroundColor: Colors.grey,
        primaryColor: const Color.fromRGBO(208, 208, 208, 1),
        // dividerColor: ,
        textTheme: const TextTheme(
          headlineMedium: TextStyle(), // main page user name
          headlineSmall: TextStyle(), // main page say hello
          labelLarge: TextStyle(
            color: Colors.black,
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ), // app bar title
          bodyMedium: TextStyle(
            color: Colors.black,
            fontSize: 17,
          ),
          bodySmall: TextStyle(
            color: Colors.black,
            fontSize: 14,
          ),
        ),
      ),
      home: const InitPage(),
    );
  }
}
