import 'package:ecommerce_app/utils/app_colors.dart';
import 'package:ecommerce_app/views/widgets/login_form.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Text(
            'Login Account',
            style: Theme.of(context).textTheme.bodyLarge!.copyWith(),
          ),
          const SizedBox(
            height: 4,
          ),
          Text(
            'Please login with your account',
            style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                  color: AppColors.grey,
                ),
          ),
          LoginForm(),
        ],
      ),
    );
  }
}
