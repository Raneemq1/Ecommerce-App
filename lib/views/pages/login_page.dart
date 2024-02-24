import 'package:ecommerce_app/utils/app_colors.dart';
import 'package:ecommerce_app/viewmodel/cubit/auth/auth_cubit.dart';
import 'package:ecommerce_app/views/widgets/login_form.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
        return Scaffold(
          body: SafeArea(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 35),
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Login Account',
                      style: Theme.of(context)
                          .textTheme
                          .bodyLarge!
                          .copyWith(fontSize: 20, fontWeight: FontWeight.w500),
                    ),
                    const SizedBox(
                      height: 4,
                    ),
                    Text(
                      'Please login with your account',
                      style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                            color: AppColors.grey,
                            fontSize: 12,
                          ),
                    ),
                    const SizedBox(
                      height: 40,
                    ),
                    const LoginForm(),
                  ],
                ),
              ),
            ),
          ),
        );
   
  }
}
