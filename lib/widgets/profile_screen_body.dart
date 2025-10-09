import 'package:depi_task/cubits/auth_cubit/auth_cubit.dart';
import 'package:depi_task/utils/app_strings.dart';
import 'package:depi_task/utils/app_validator.dart';
import 'package:depi_task/widgets/custom_button.dart';
import 'package:depi_task/widgets/custom_text_form_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProfileScreenBody extends StatelessWidget {
  const ProfileScreenBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 8, right: 16, left: 16),
      child: Form(
        key: context.read<AuthCubit>().formKey,
        child: ListView(
          children: [
            CustomTextFormField(
              enabled: false,
              inputType: InputType.email,
              hintText: AppStrings.emailHintText,
              controller: BlocProvider.of<AuthCubit>(context).emailController,
            ),
            const SizedBox(height: 16),

            CustomTextFormField(
              controller: BlocProvider.of<AuthCubit>(
                context,
              ).fistNameController,
              hintText: 'first name',
              inputType: InputType.firstName,
            ),
            const SizedBox(height: 16),

            CustomTextFormField(
              controller: BlocProvider.of<AuthCubit>(
                context,
              ).lastNameController,
              hintText: 'last name',
              inputType: InputType.lastName,
            ),

            const SizedBox(height: 32),
            CustomButton(
              title: 'update',
              fontSize: 20,
              onTap: () async {
                context.read<AuthCubit>().formKey.currentState!.validate()
                    ? await BlocProvider.of<AuthCubit>(
                        context,
                      ).updateUserData(context)
                    : null;
              },
            ),
            SizedBox(height: 8),
            CustomButton(
              title: 'delete',
              fontSize: 20,
              color: Colors.red,
              onTap: () async {
                await BlocProvider.of<AuthCubit>(context).deleteUser(context);
              },
            ),
          ],
        ),
      ),
    );
  }
}
