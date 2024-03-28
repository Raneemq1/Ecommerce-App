import 'package:ecommerce_app/model/user.dart';
import 'package:ecommerce_app/services/firestore_services.dart';
import 'package:ecommerce_app/utils/api_paths.dart';
import 'package:ecommerce_app/viewmodel/cubit/profile/profile_cubit.dart';
import 'package:ecommerce_app/viewmodel/cubit/profile/profile_status.dart';
import 'package:ecommerce_app/views/pages/profile_page.dart';
import 'package:ecommerce_app/views/widgets/main_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class EditProfileInfo extends StatefulWidget {
  EditProfileInfo({super.key});

  @override
  _EditProfileInfoState createState() => _EditProfileInfoState();
}

class _EditProfileInfoState extends State<EditProfileInfo> {
  final _nameController = TextEditingController();
  final _phoneController = TextEditingController();
  final _addressController = TextEditingController();
  final _firestoreService = FirestoreService.instance;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => PorfileCubit()..getDatat(),
      child: Builder(
        builder: (context) {
          return BlocBuilder<PorfileCubit, ProfileStatus>(
            builder: (context, state) {
              return BlocConsumer<PorfileCubit, ProfileStatus>(
                bloc:BlocProvider.of<PorfileCubit>(context),
                listenWhen: (previous, current) => current is ProfileError,
                buildWhen: (previous, current) => current is ProfileLoading||
                current is ProfileLoaded,
                listener: (context, state) {
                  if (state is ProfileError) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text('Error loading user data.'),
                      ),
                    );
                  }
                },
                builder: (context, state) {
                 
                  if (state is ProfileLoading) {
                    return Center(
                      child: CircularProgressIndicator.adaptive(),
                    );
                  } else if (state is ProfileLoaded) {
                    User user = state.user;
                    return Scaffold(
                      appBar: AppBar(
                        leading: InkWell(
                            onTap: () {
                             Navigator.pop(context);
                            },
                            child: Icon(Icons.arrow_back)),
                      ),
                      body: Padding(
                        padding: const EdgeInsets.all(25.0),
                        child: Column(
                          children: [
                            TextFormField(
                              controller: _nameController,
                              decoration: InputDecoration(
                                prefixIcon: Icon(Icons.person),
                                hintText: user.name,
                              ),
                            ),
                            SizedBox(
                              height: 12,
                            ),
                            TextFormField(
                              controller: _phoneController,
                              decoration: InputDecoration(
                                prefixIcon: Icon(Icons.phone),
                                hintText: user.phone,
                              ),
                            ),
                            SizedBox(
                              height: 12,
                            ),
                            TextFormField(
                              controller: _addressController,
                              decoration: InputDecoration(
                                prefixIcon: Icon(Icons.location_on),
                                hintText: user.address,
                              ),
                            ),
                            Spacer(),
                            MainButton(
                              title: "Edit Information",
                              onPressed: () {
                                User editedUser = User(
                                  id: user.id,
                                  name: _nameController.text.isEmpty
                                      ? user.name
                                      : _nameController.text,
                                  email: user.email,
                                  phone: _phoneController.text.isEmpty
                                      ? user.phone
                                      : _phoneController.text,
                                  address: _addressController.text.isEmpty
                                      ? user.address
                                      : _addressController.text,
                                );
                                _editUser(editedUser);
                              },
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
            },
          );
        },
      ),
    );
  }

  void _editUser(User user) async {
    await _firestoreService.setData(
      path: ApiPaths.getUser(user.id),
      data: user.toMap(),
    );

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('User information updated.'),
      ),
    );
  }
}
