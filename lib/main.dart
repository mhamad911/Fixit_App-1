import 'package:flutter/cupertino.dart';
import 'package:untitled14/Pages/Contractor/splach_screen.dart';
import 'package:flutter/material.dart';

void main(){
  runApp(MyApp());
}
class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: MaterialApp(
        debugShowCheckedModeBanner:false,
        home:SplachScreen(),
      ),
    );
  }
}
