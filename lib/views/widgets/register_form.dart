import 'package:ecommerce_app/utils/app_colors.dart';
import 'package:ecommerce_app/viewmodel/cubit/auth/auth_cubit.dart';
import 'package:ecommerce_app/views/pages/login_page.dart';
import 'package:ecommerce_app/views/widgets/login_form.dart';
import 'package:ecommerce_app/views/widgets/main_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class RegisterForm extends StatefulWidget {
  const RegisterForm({super.key});

  @override
  State<RegisterForm> createState() => _RegisterFormState();
}

class _RegisterFormState extends State<RegisterForm> {
  final _globalKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _nameController = TextEditingController();
  final _phoneController = TextEditingController();
  final _addressController = TextEditingController();
  bool _isVisible = false;
  @override
  Widget build(BuildContext context) {
    final cubit = BlocProvider.of<AuthCubit>(context);
    return Form(
        key: _globalKey,
        child: Column(
          children: [
            TextFormField(
              controller: _emailController,
              validator: (value) {},
              decoration:
                  InputDecoration(hintText: 'Enter Email', labelText: 'Email'),
            ),
            const SizedBox(
              height: 15,
            ),
            TextFormField(
                controller: _passwordController,
                obscureText: !_isVisible,
                validator: (value) {},
                decoration: InputDecoration(
                    hintText: 'Enter Password',
                    labelText: 'Password',
                    suffixIcon: InkWell(
                        onTap: () {
                          setState(() {
                            _isVisible = !_isVisible;
                          });
                        },
                        child: _isVisible
                            ? Icon(Icons.visibility)
                            : Icon(Icons.visibility_off)))),
            const SizedBox(
              height: 15,
            ),
            TextFormField(
                controller: _nameController,
                validator: (value) {},
                decoration:
                    InputDecoration(hintText: 'Enter Name', labelText: 'Name')),
            const SizedBox(
              height: 15,
            ),
            TextFormField(
                controller: _addressController,
                validator: (value) {},
                decoration: InputDecoration(
                    hintText: 'Enter Address', labelText: 'Address')),
            const SizedBox(
              height: 15,
            ),
            TextFormField(
                controller: _phoneController,
                validator: (value) {},
                decoration: InputDecoration(
                    hintText: 'Enter Phone', labelText: 'Phone')),
            const SizedBox(
              height: 40,
            ),
            MainButton(
              title: 'Sign Up',
              onPressed: () {},
            ),
            const SizedBox(
              height: 10,
            ),
            InkWell(
              onTap: () => Navigator.of(context)
                  .push(MaterialPageRoute(builder: (_) => LoginPage())),
              child: Center(child: Text('Login',style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                color: AppColors.grey,
              ),)),
            )
          ],
        ));
  }
}
