import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
class SplachScreen extends StatefulWidget {
  const SplachScreen({super.key});

  @override
  State<SplachScreen> createState() => _SplachScreenState();
}

class _SplachScreenState extends State<SplachScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor:Color(0xff6A3BA8),
      body:Padding(
        padding: const EdgeInsets.all(135),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,

          children: [
            Lottie.asset('assets/Logo.json'),
          ],
        ),
      )
    );
  }
}
