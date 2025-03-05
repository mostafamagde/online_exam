import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:online_exam/features/profile/data/models/change_password_request.dart';
import 'package:online_exam/features/profile/presentation/view_model/change_password_cubit.dart';

import '../../../../../core/app_consts/app_validators.dart';
import '../../../../../core/widgets/main_button.dart';
import '../../../../../core/widgets/main_text_field.dart';
import '../../view_model/change_password_state.dart';

class ChangePasswordScreen extends StatefulWidget {
  const ChangePasswordScreen({super.key});

  @override
  State<ChangePasswordScreen> createState() => _ChangePasswordScreenState();
}

class _ChangePasswordScreenState extends State<ChangePasswordScreen> {
  final _formKey = GlobalKey<FormState>();

  final TextEditingController currentPasswordController = TextEditingController();
  final TextEditingController newPasswordController = TextEditingController();
  final TextEditingController confirmPasswordController = TextEditingController();

  String token = "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6IjY3YjNmZWVmODZhMDI0ZjA2ZWEyN2Q0NyIsInJvbGUiOiJ1c2VyIiwiaWF0IjoxNzM5ODQ5NjYyfQ.JWluZEm-y7VTllOUZTJDseXwam2jlGLdhaOi0bTv-9Y";
  void _resetPassword() {
    if (_formKey.currentState!.validate()) {
      final request = ChangePasswordRequest(
        oldPassword: currentPasswordController.text,
        password: newPasswordController.text,
        rePassword: confirmPasswordController.text,
      );

      context.read<ChangePasswordCubit>().changePassword(token, request);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Change Password"),
      ),
      body: BlocListener<ChangePasswordCubit, ChangePasswordState>(
        listener: (context, state) {
          if (state is ChangePasswordLoading) {
            showDialog(
              context: context,
              barrierDismissible: false,
              builder: (context) => const Center(child: CircularProgressIndicator()),
            );
          } else if (state is ChangePasswordSuccess) {
            Navigator.pop(context);
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(content: Text("Password changed successfully!")),
            );
            Navigator.pop(context);
          } else if (state is ChangePasswordError) {
            Navigator.pop(context);
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text(state.message)),
            );
          }
        },
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Form(
            key: _formKey,
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  MainTextField(
                    label: 'Current Password',
                    isObscured: true,
                    controller: currentPasswordController,
                    validator: (val) {
                      AppValidators.validatePassword(val);
                      return null;
                    },
                  ),
                  MainTextField(
                    label: 'New Password',
                    isObscured: true,
                    controller: newPasswordController,
                    validator: (val) {
                      AppValidators.validatePassword(val);
                      return null;
                    },
                  ),
                  MainTextField(
                    label: 'Confirm Password',
                    isObscured: true,
                    controller: confirmPasswordController,
                    validator: (val) {
    AppValidators.validatePassword(val);
                      return null;
                    },

                  ),
                  const SizedBox(height: 20),
                  MainButton(
                    onPress: _resetPassword,
                    label: 'Reset Password',
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
