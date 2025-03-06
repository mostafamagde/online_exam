import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:online_exam/core/app_consts/app_validators.dart';
import 'package:online_exam/features/profile/presentation/view_model/edit_profile_cubit.dart';

import '../../../../../core/widgets/main_button.dart';
import '../../../../../core/widgets/main_text_field.dart';
import '../../../data/models/user_model.dart';
import '../../view_model/edit_profile_state.dart';
import '../../view_model/profile_cubit.dart';
import '../../view_model/profile_state.dart';

class EditProfileScreen extends StatefulWidget {
  EditProfileScreen({super.key});

  static const String routeName = 'profile_edit_screen.dart';

  @override
  State<EditProfileScreen> createState() => _EditProfileScreenState();
}

class _EditProfileScreenState extends State<EditProfileScreen> {


  final _formKey = GlobalKey<FormState>(); // Key for form validation

  TextEditingController usernameController = TextEditingController();
  TextEditingController firstNameController = TextEditingController();
  TextEditingController lastNameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController phoneController = TextEditingController();

  late UserModel user;
  @override
  void initState() {
    super.initState();
    final state = context.read<EditProfileCubit>().state;
    if (state is EditProfileSuccess) {
       user = state.user;
      usernameController = TextEditingController(text: user.username);
      firstNameController = TextEditingController(text: user.firstName);
      lastNameController = TextEditingController(text: user.lastName);
      emailController = TextEditingController(text: user.email);
      phoneController = TextEditingController(text: user.phone);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Edit Profile")),
      body: BlocListener<EditProfileCubit, EditProfileState>(
        listener: (context, state) {
          switch(state){
            
            case EditProfileLoading():
              CircularProgressIndicator();
            case EditProfileSuccess():
            ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Profile updated successfully!")));
            Navigator.pop(context);
            context.read<ProfileCubit>().getProfile();
            case EditProfileError():
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: Text(state.message)),
              );
          }
        },
        child:  SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Form(
              key: _formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  const CircleAvatar(
                    radius: 50,
                    backgroundImage: NetworkImage(
                      'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcS0mo1-1RPPCSd54lH3fcOeOWM1wRHxEZ3C1A&s',
                    ),
                  ),
                  const SizedBox(height: 20),
                  MainTextField(
                    label: 'Username',
                    controller: usernameController,
                    validator: (val) => AppValidators.validateUsername(val),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      MainTextField(
                        label: 'First Name',
                        width: MediaQuery.of(context).size.width * .46,
                        controller: firstNameController,
                        validator: (val) => AppValidators.validateFullName(val),
                      ),
                      Spacer(),
                      MainTextField(
                        label: 'Last Name',
                        width: MediaQuery.of(context).size.width * .46,
                        controller: lastNameController,
                        validator: (val) => AppValidators.validateFullName(val),
                      ),
                    ],
                  ),
                  MainTextField(
                    label: 'Email',
                    controller: emailController,
                    validator: (val) => AppValidators.validateEmail(val),
                  ),
                  MainTextField(
                    label: 'Phone Number',
                    controller: phoneController,
                    validator: (val) => AppValidators.validatePhoneNumber(val),
                  ),
                  const SizedBox(height: 20),
                  BlocBuilder<EditProfileCubit, EditProfileState>(
                    builder: (context, state) {
                      return MainButton(
                        label: 'Update',
                        onPress: () {
                          if (_formKey.currentState!.validate()) {

                            final updatedUser = UserModel(

                            username: usernameController.text,
                            firstName: firstNameController.text,
                            lastName: lastNameController.text,
                            email: emailController.text,
                            phone: phoneController.text,

                            );

                            context.read<EditProfileCubit>().editProfile( updatedUser);
                          }
                        },
                      );
                    },
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
