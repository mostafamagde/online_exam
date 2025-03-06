import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:online_exam/core/routes_manager/routes_names.dart';
import 'package:online_exam/features/profile/presentation/view_model/profile_cubit.dart';
import 'package:online_exam/features/profile/presentation/view_model/profile_state.dart';

import '../../../../../core/widgets/main_button.dart';
import '../../../../../core/widgets/main_text_field.dart';
import '../../../data/models/user_model.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  late UserModel user;

  @override
  void initState() {
    super.initState();
    context.read<ProfileCubit>().getProfile();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("profile")),
      body: BlocBuilder<ProfileCubit, ProfileState>(
        builder: (context, state) {
          switch (state) {
            case ProfileLoading():
              return Center(child: CircularProgressIndicator());
            case ProfileSuccess():
              {
                final state = context.read<ProfileCubit>().state;
                if (state is ProfileSuccess) {
                  user = state.user;
                }
                return SingleChildScrollView(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        CircleAvatar(
                          child: Image.network(
                            'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcS0mo1-1RPPCSd54lH3fcOeOWM1wRHxEZ3C1A&s',
                          ),
                        ),
                        SizedBox(height: 70),
                        MainTextField(
                          controller: TextEditingController(
                            text: user.username,
                          ),
                          label: 'username',
                          readOnly: true,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            MainTextField(
                              controller: TextEditingController(
                                text: user.firstName,
                              ),
                              label: 'First Name',
                              readOnly: true,
                              width: MediaQuery.of(context).size.width * .46,
                            ),
                            Spacer(),
                            MainTextField(
                              controller: TextEditingController(
                                text: user.lastName,
                              ),
                              label: 'Last Name',
                              readOnly: true,
                              width: MediaQuery.of(context).size.width * .46,
                            ),
                          ],
                        ),
                        MainTextField(
                          controller: TextEditingController(text: user.email),
                          readOnly: true,
                          label: ' Email ',
                        ),
                        MainTextField(
                          controller: TextEditingController(text: '*******'),
                          label: ' Password ',
                          readOnly: true,
                          suffixIcon: TextButton(
                            child: Text(
                              'change',
                              style: TextStyle(color: Colors.blueAccent),
                            ),
                            onPressed: () {
                              Navigator.pushNamed(
                                context,
                                RoutesNames.changePassword,
                              );
                            },
                          ),
                        ),
                        MainTextField(
                          controller: TextEditingController(text: user.phone),
                          label: ' Phone Number ',
                          readOnly: true,
                        ),
                        SizedBox(height: 20),
                        MainButton(
                          label: 'Update',
                          onPress: () {
                            Navigator.pushNamed(
                              context,
                              RoutesNames.editProfile,
                            );
                          },
                        ),
                      ],
                    ),
                  ),
                );
              }
            case ProfileError(message: final message):
              return Center(
                child: Text(message, style: const TextStyle(color: Colors.red)),
              );
          }
        },
      ),
    );
  }
}
