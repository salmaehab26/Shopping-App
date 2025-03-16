import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shopping/Features/auth/log_in/log_in_cubit/LogInStates.dart';
import 'package:shopping/Features/auth/log_in/log_in_cubit/LogInViewModel.dart';
import 'package:shopping/di/DependencyInjection.dart';

import '../../../Core/resources/app_styles.dart';
import '../../../Core/resources/my_colors.dart';
import '../../../Core/routes_manager/app_routes.dart';
import '../../../Core/widgets/custom_elevated_button.dart';
import '../../../Core/widgets/custom_text_form_field.dart';
import '../../../Core/widgets/dialog_utils.dart';
import '../../../Core/widgets/validators.dart';

class LoginScreen extends StatelessWidget {
   LoginScreen({super.key});

  LogInViewModel viewModel = getIt<LogInViewModel>();

  @override
  Widget build(BuildContext context) {
    return BlocListener<LogInViewModel, LogInStates>(
      bloc: viewModel,
        listener: (context, state) {
          if (state is loadingStates) {
            DialogUtil.showLoading(context, "loading");
          } else if (state is errorStates) {
            DialogUtil.hideLoading(context);
            DialogUtil.showMessage(context, state.failures.ErrorMessage!);
          } else if (state is sucssesStates) {
            DialogUtil.hideLoading(context);
            DialogUtil.showMessage(context, "succesfully",
                title: "success",posAction: () {
                Navigator.pushReplacementNamed(
                    context, AppRoutes.mainRoute);
                },posActionName: "ok");
          }
        },
        child: Scaffold(
          backgroundColor: AppColors.whiteColor,
          body: SafeArea(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 16.w),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        Padding(
                          padding: EdgeInsets.symmetric(vertical: 125.w),
                          child: Center(
                            child: Column(
                              children: [
                                AutoSizeText(
                                  'Welcome',
                                  style: AppStyles.large30dark,
                                  maxLines: 1,
                                ),
                                AutoSizeText(
                                  'Please sign in with your mail',
                                  style: AppStyles.medium15bback,
                                  maxLines: 1,
                                ),
                              ],
                            ),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(top: 40.h),
                          child: Form(
                            // key: viewModel.formKey,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.stretch,
                              children: [
                                Text(
                                  "Email",
                                  // style: AppStyles.medium18White,
                                ),
                                CustomTextFormField(
                                  isPassword: false,
                                  keyboardType: TextInputType.text,
                                  isObscureText: false,
                                  hintText: "enter your Email",
                                  // hintStyle: AppStyles.light18HintText,
                                  // filledColor: AppColors.whiteColor,
                                  controller: viewModel.emailController,
                                  // validator: AppValidators.validateEmail
                                ),
                                Text(
                                  "Password",
                                  // style: AppStyles.medium18White,
                                ),
                                CustomTextFormField(
                                  isPassword: true,
                                  keyboardType: TextInputType.visiblePassword,
                                  isObscureText: true,
                                  hintText: "enter your password",
                                  // hintStyle: AppStyles.light18HintText,
                                  // filledColor: AppColors.whiteColor,
                                  controller: viewModel.passwordController,
                                  validator: AppValidators.validatePassword,

                                ),
                                InkWell(
                                  onTap: () {},
                                  child: Text(
                                    'Forgot Password?',
                                    style: AppStyles.red14Text,
                                    textAlign: TextAlign.end,
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsets.only(top: 80.h),
                                  child: CustomElevatedButton(
                                      backgroundColor: AppColors.primaryColor,
                                      textStyle: AppStyles.white15text,
                                      text: "Login",
                                      onPressed: () {
                                        viewModel.LogIn();
                                      }),
                                ),
                                Padding(
                                    padding: EdgeInsets.only(top: 30.h),
                                    child: Row(children: [
                                      Text('Don’t have an account? '),
                                      GestureDetector(
                                        onTap: () {
                                          Navigator.pushReplacementNamed(
                                              context, AppRoutes.signupRoute);
                                        },
                                        child: Text(
                                          'Create Account',style: TextStyle(color:AppColors.primaryColor),
                                        ),
                                      ),
                                    ]))
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ));
  }
}
