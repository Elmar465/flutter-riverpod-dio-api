import 'package:flutter/material.dart';
import 'package:flutter_api2/screen/mainPage.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

void main() => runApp(const ProviderScope(child: MyApp()));

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: '/',
      routes:  {
        MainPage.routeName :(context) => const  MainPage(),
      },
    );
  }
}