import 'package:ecommerce_app/utils/app_colors.dart';
import 'package:ecommerce_app/viewmodel/cubit/auth/auth_cubit.dart';
import 'package:ecommerce_app/viewmodel/cubit/auth/auth_state.dart';
import 'package:ecommerce_app/views/pages/custom_bottombar.dart';
import 'package:ecommerce_app/views/pages/register_page.dart';
import 'package:ecommerce_app/views/widgets/main_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginForm extends StatefulWidget {
  const LoginForm({super.key});

  @override
  State<LoginForm> createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _globalKey = GlobalKey<FormState>(); //what is form state
  bool _isVisible = false;

  Future<void> login() async {
    final cubit = BlocProvider.of<AuthCubit>(context);
    debugPrint(_emailController.text);
    cubit.signInWithEmailAndPassword(
        _emailController.text, _passwordController.text);
  }

  @override
  Widget build(BuildContext context) {
    final cubit = BlocProvider.of<AuthCubit>(context);
    return Form(
        key: _globalKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Email',
              style: Theme.of(context)
                  .textTheme
                  .bodyLarge!
                  .copyWith(fontWeight: FontWeight.w500, fontSize: 12),
            ),
            const SizedBox(
              height: 10,
            ),
            TextFormField(
              controller: _emailController,
              validator: (value) {},
              decoration: InputDecoration(
                  hintText: 'Enter Email',
                  hintStyle: Theme.of(context).textTheme.bodyLarge!.copyWith(
                        color: AppColors.black.withOpacity(0.4),
                        fontSize: 14,
                      )),
            ),
            const SizedBox(
              height: 10,
            ),
            Text(
              'Password',
              style: Theme.of(context)
                  .textTheme
                  .bodyLarge!
                  .copyWith(fontWeight: FontWeight.w500, fontSize: 12),
            ),
            const SizedBox(
              height: 10,
            ),
            TextFormField(
              controller: _passwordController,
              obscureText: !_isVisible,
              validator: (value) {},
              decoration: InputDecoration(
                  suffixIcon: InkWell(
                      onTap: () {
                        setState(() {
                          _isVisible = !_isVisible;
                        });
                      },
                      child: _isVisible
                          ? Icon(Icons.visibility)
                          : Icon(Icons.visibility_off)),
                  hintText: 'Enter password',
                  hintStyle: Theme.of(context).textTheme.bodyLarge!.copyWith(
                        color: AppColors.black.withOpacity(0.4),
                        fontSize: 14,
                      )),
            ),
            const SizedBox(
              height: 40,
            ),
            BlocConsumer<AuthCubit, AuthState>(
              bloc: cubit,
              listenWhen: (previous, current) =>
                  current is AuthFaliure || current is AuthSuccess,
              buildWhen: (previous, current) => current is AuthLoading,
              builder: (context, state) {
                if (state is AuthLoading) {
                  return MainButton(
                    bgColor: AppColors.grey2,
                    onPressed: login,
                    child: CircularProgressIndicator.adaptive(),
                  );
                }
                return MainButton(
                  onPressed: login,
                  title: 'Login',
                );
              },
              listener: (context, state) {
                if (state is AuthSuccess) {
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => CustomBottomBar()));
                }
              },
            ),
            const SizedBox(
              height: 8,
            ),
            Center(
                child: InkWell(
              onTap:() => Navigator.of(context).push(MaterialPageRoute(builder: (_)=>RegisterPage())), //signup
              child: Text(
                'Create Account',
                style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                      color: AppColors.grey,
                    ),
              ),
            )),
          ],
        ));
  }
}
