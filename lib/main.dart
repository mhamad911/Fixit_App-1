import 'package:flutter/material.dart';
import 'package:untitled14/Veiw/Splach_screen/splach_screen.dart';

void main(){
  runApp(const MyApp());
}
class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return const SafeArea(
      child: MaterialApp(
        debugShowCheckedModeBanner:false,
        home:SplachScreen(),
      ),
    );
  }
}
