import 'package:ecommerce_app/utils/app_colors.dart';
import 'package:ecommerce_app/views/widgets/register_form.dart';
import 'package:flutter/material.dart';


class RegisterPage extends StatelessWidget {
  const RegisterPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
            child: Padding(
      padding: EdgeInsets.all(20),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Create Account',
              style: Theme.of(context)
                  .textTheme
                  .bodyLarge!
                  .copyWith(fontSize: 20, fontWeight: FontWeight.w500),
            ),
            const SizedBox(
              height: 4,
            ),
            Text(
              'Let\'s create your account',
              style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                    color: AppColors.grey,
                    fontSize: 12,
                  ),
            ),
            const SizedBox(
              height: 40,
            ),
            RegisterForm(),
          ],
        ),
      ),
    )));
  }
}
