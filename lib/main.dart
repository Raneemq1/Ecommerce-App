import 'package:ecommerce_app/utils/app_theme.dart';
import 'package:ecommerce_app/views/pages/custom_bottombar.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home:const CustomBottomBar(),
      theme: AppTheme.ligtTheme,
   //check ddark theme
    );
  }
}
