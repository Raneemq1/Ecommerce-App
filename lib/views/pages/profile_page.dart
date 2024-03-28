import 'package:cached_network_image/cached_network_image.dart';
import 'package:ecommerce_app/utils/app_colors.dart';
import 'package:ecommerce_app/viewmodel/cubit/auth/auth_cubit.dart';
import 'package:ecommerce_app/viewmodel/cubit/auth/auth_state.dart';
import 'package:ecommerce_app/viewmodel/cubit/profile/profile_cubit.dart';
import 'package:ecommerce_app/viewmodel/cubit/profile/profile_status.dart';
import 'package:ecommerce_app/views/pages/login_page.dart';
import 'package:ecommerce_app/views/pages/profile_indo_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    final authCubit = BlocProvider.of<AuthCubit>(context);
    final size = MediaQuery.of(context).size;
    return BlocProvider(
      create: (context) {
        final cubit = PorfileCubit();
        cubit.getDatat();
        return cubit;
      },
      child: Builder(builder: (context) {
        final cubit = BlocProvider.of<PorfileCubit>(context);
        return BlocBuilder<PorfileCubit, ProfileStatus>(
          buildWhen: (previous, current) =>
              current is ProfileLoaded ||
              current is ProfileLoading ||
              current is ProfileError,
          builder: (context, state) {
            debugPrint('profile cubit:${state.toString()}');
            if (state is ProfileLoading) {
              return const Center(
                child: CircularProgressIndicator.adaptive(),
              );
            } else if (state is ProfileLoaded) {
              final user = state.user;
              return SingleChildScrollView(
                child: Padding(
                  padding: EdgeInsets.symmetric(vertical: size.height * 0.05),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      const CircleAvatar(
                          radius: 60,
                          foregroundImage: CachedNetworkImageProvider(
                            'https://www.indiewire.com/wp-content/uploads/2019/03/151442_6876.jpg',
                          )),
                      const SizedBox(
                        height: 30,
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 30.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'Phone',
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyMedium!
                                  .copyWith(
                                    color: AppColors.grey,
                                    fontSize: 16,
                                  ),
                            ),
                            Text(
                              user.phone,
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyMedium!
                                  .copyWith(
                                    color: AppColors.black,
                                    fontSize: 16,
                                  ),
                            )
                          ],
                        ),
                      ),
                      const SizedBox(
                        height: 16,
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 30.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'Mail',
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyMedium!
                                  .copyWith(
                                    color: AppColors.grey,
                                    fontSize: 16,
                                  ),
                            ),
                            Text(
                              user.email,
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyMedium!
                                  .copyWith(
                                    color: AppColors.black,
                                    fontSize: 16,
                                  ),
                            )
                          ],
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      const Divider(),
                      const SizedBox(
                        height: 15,
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 30.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              children: [
                                const Icon(Icons.nightlight_round),
                                const SizedBox(
                                  width: 20,
                                ),
                                Text(
                                  'Dark mode',
                                  style: Theme.of(context)
                                      .textTheme
                                      .bodyMedium!
                                      .copyWith(
                                        color: AppColors.black,
                                        fontSize: 16,
                                      ),
                                ),
                              ],
                            ),
                            BlocBuilder<PorfileCubit, ProfileStatus>(
                              bloc: context.read<PorfileCubit>(),
                              buildWhen: (previous, current) =>
                                  current is SwitchProfileMode,
                              builder: (context, state) {
                                if (state is SwitchProfileMode) {
                                  bool value = state.switchValue;
                                  return Switch(
                                    value: value,
                                    onChanged: (value) {
                                      cubit.switchMode(value);
                                    },
                                  );
                                } else {
                                  return Switch(
                                    value: false,
                                    onChanged: (value) {
                                      cubit.switchMode(value);
                                    },
                                  );
                                }
                              },
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      const Divider(),
                      const SizedBox(
                        height: 15,
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 30.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              children: [
                                const Icon(Icons.credit_card),
                                const SizedBox(
                                  width: 20,
                                ),
                                Text(
                                  'Cards',
                                  style: Theme.of(context)
                                      .textTheme
                                      .bodyMedium!
                                      .copyWith(
                                        color: AppColors.black,
                                        fontSize: 16,
                                      ),
                                ),
                              ],
                            ),
                            const Icon(Icons.arrow_forward),
                          ],
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      const Divider(),
                      const SizedBox(
                        height: 15,
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 30.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              children: [
                                const Icon(Icons.person),
                                const SizedBox(
                                  width: 20,
                                ),
                                Text(
                                  'Profile Details',
                                  style: Theme.of(context)
                                      .textTheme
                                      .bodyMedium!
                                      .copyWith(
                                        color: AppColors.black,
                                        fontSize: 16,
                                      ),
                                ),
                              ],
                            ),
                            InkWell(
                                onTap: () {
                                  Navigator.of(context,rootNavigator: true).push(MaterialPageRoute(builder:(context) => EditProfileInfo(), ));
                                },
                                child: const Icon(Icons.arrow_forward)),
                          ],
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      const Divider(),
                      const SizedBox(
                        height: 15,
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 30.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              children: [
                                const Icon(Icons.settings),
                                const SizedBox(
                                  width: 20,
                                ),
                                Text(
                                  'Settings',
                                  style: Theme.of(context)
                                      .textTheme
                                      .bodyMedium!
                                      .copyWith(
                                        color: AppColors.black,
                                        fontSize: 16,
                                      ),
                                ),
                              ],
                            ),
                            const Icon(Icons.arrow_forward),
                          ],
                        ),
                      ),
                      const Divider(),
                      const SizedBox(
                        height: 20,
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 30.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'Logout',
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyLarge!
                                  .copyWith(
                                    fontSize: 16,
                                  ),
                            ),
                            BlocConsumer<AuthCubit, AuthState>(
                              bloc: authCubit,
                              listenWhen: (previous, current) =>
                                  current is AuthSuccess,
                              listener: (context, state) {
                                if (state is AuthSuccess) {
                                  Navigator.of(context, rootNavigator: true)
                                      .push(MaterialPageRoute(
                                          builder: (context) =>
                                              const LoginPage()));
                                }
                              },
                              builder: (context, state) {
                                return InkWell(
                                    onTap: () async {
                                      await authCubit.logOut();
                                    },
                                    child: Icon(Icons.logout));
                              },
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              );
            } else {
              return const SizedBox();
            }
          },
        );
      }),
    );
  }
}
