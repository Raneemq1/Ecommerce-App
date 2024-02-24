import 'package:ecommerce_app/firebase_options.dart';
import 'package:ecommerce_app/utils/app_theme.dart';
import 'package:ecommerce_app/viewmodel/cubit/auth/auth_cubit.dart';
import 'package:ecommerce_app/viewmodel/cubit/auth/auth_state.dart';
import 'package:ecommerce_app/views/pages/custom_bottombar.dart';
import 'package:ecommerce_app/views/pages/login_page.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();//to ensure that firebase initialized 
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AuthCubit(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: const LoginPage(),
        theme: AppTheme.ligtTheme,
        //check dark theme
      ),
    );
  }
}
