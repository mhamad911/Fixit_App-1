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
      backgroundColor:Colors.white,
      body:Column(
        children: [
          Lottie.asset('assets/Logo.json'),
        ],
      )
    );
  }
}
