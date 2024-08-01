import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'Provider/auth_provider.dart';
import 'Provider/task_provider.dart';
import 'Veiw/Splach_screen/splach_screen.dart';

void main(){
  runApp(
      MultiProvider(
        providers: [
          ChangeNotifierProvider(create: (_) => AuthProvider()),
          ChangeNotifierProvider(create: (_)=>TaskProvider()),
        ],
        child: MyApp(),
      ));
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
        debugShowCheckedModeBanner: false,
        home: SplachScreen(),
      ),
    );
  }
}
