import 'package:ecommerce_app/model/user.dart';
import 'package:ecommerce_app/services/firestore_services.dart';
import 'package:ecommerce_app/utils/api_paths.dart';
import 'package:ecommerce_app/utils/app_colors.dart';
import 'package:ecommerce_app/viewmodel/cubit/auth/auth_cubit.dart';
import 'package:ecommerce_app/viewmodel/cubit/auth/auth_state.dart';
import 'package:ecommerce_app/views/pages/custom_bottombar.dart';
import 'package:ecommerce_app/views/pages/login_page.dart';
import 'package:ecommerce_app/views/widgets/login_form.dart';
import 'package:uuid/uuid.dart';
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
  final _firestoreService = FirestoreService.instance;

  bool _isVisible = false;

  void signUp() {
    final cubit = BlocProvider.of<AuthCubit>(context);

    if (_globalKey.currentState!.validate()) {
      cubit.signUpWithEmailAndPassword(
          _emailController.text, _passwordController.text);
      sendUser();
    }
  }

  String? validEmail() {
    RegExp emailRegex = RegExp(r'^[\w-]+(\.[\w-]+)*@[\w-]+(\.[\w-]+)+$');
    if (emailRegex.hasMatch(_emailController.text)) {
      return null;
    } else {
      return 'Please enter a valid email';
    }
  }

  String? validPassword() {
    //RegExp passRegex =
    //RegExp(r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}$');
    if (_passwordController.text.length >= 6) {
      return null;
    } else {
      return 'Please enter a valid password';
    }
  }

  String? validInput(String input) {
    if (input.isNotEmpty) {
      return null;
    } else {
      return 'Please fill the information';
    }
  }

  void sendUser() async {
    String id = const Uuid().v1();
    final user = User(
        id: id,
        name: _nameController.text,
        email: _emailController.text,
        phone: _phoneController.text,
        address: _addressController.text);
    await _firestoreService.setData(
        path: ApiPaths.getUser(user.id), data: user.toMap());
  }

  @override
  Widget build(BuildContext context) {
    final cubit = BlocProvider.of<AuthCubit>(context);
    return Form(
        key: _globalKey,
        child: Column(
          children: [
            TextFormField(
              controller: _emailController,
              validator: (value) => validEmail(),
              decoration: InputDecoration(hintText: 'Enter Email'),
            ),
            const SizedBox(
              height: 15,
            ),
            TextFormField(
                controller: _passwordController,
                obscureText: !_isVisible,
                validator: (value) => validPassword(),
                decoration: InputDecoration(
                    hintText: 'Enter Password',
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
                validator: (value) => validInput(value!),
                decoration: InputDecoration(hintText: 'Enter Name')),
            const SizedBox(
              height: 15,
            ),
            TextFormField(
                controller: _addressController,
                validator: (value) => validInput(value!),
                decoration: InputDecoration(hintText: 'Enter Address')),
            const SizedBox(
              height: 15,
            ),
            TextFormField(
                controller: _phoneController,
                validator: (value) => validInput(value!),
                decoration: InputDecoration(hintText: 'Enter Phone')),
            const SizedBox(
              height: 40,
            ),
            BlocConsumer<AuthCubit, AuthState>(
              bloc: cubit,
              listenWhen: (previous, current) =>
                  current is AuthSuccess || current is AuthFaliure,
              buildWhen: (previous, current) =>
                  current is AuthLoading ||
                  current is AuthFaliure ||
                  current is AuthSuccess,
              builder: (context, state) {
                if (state is AuthLoading) {
                  return MainButton(
                    child: CircularProgressIndicator.adaptive(),
                  );
                }
                return MainButton(
                  title: 'Sign Up',
                  onPressed: signUp,
                );
              },
              listener: (context, state) {
                if (state is AuthSuccess) {
                  Navigator.of(context).push(
                      MaterialPageRoute(builder: (_) => CustomBottomBar()));
                } else if (state is AuthFaliure) {}
              },
            ),
            const SizedBox(
              height: 10,
            ),
            InkWell(
              onTap: () => Navigator.of(context)
                  .push(MaterialPageRoute(builder: (_) => LoginPage())),
              child: Center(
                  child: Text(
                'Login',
                style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                      color: AppColors.grey,
                    ),
              )),
            )
          ],
        ));
  }
}
