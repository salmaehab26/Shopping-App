import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shopping/Features/auth/sign_up/sign_up_cubit/SignUpViewModel.dart';
import 'package:shopping/Features/auth/sign_up/sign_up_cubit/Sign_Up_States.dart';
import 'package:shopping/di/DependencyInjection.dart';
import '../../../Core/resources/app_styles.dart';
import '../../../Core/resources/my_colors.dart';
import '../../../Core/routes_manager/app_routes.dart';
import '../../../Core/widgets/custom_elevated_button.dart';
import '../../../Core/widgets/custom_text_form_field.dart';
import '../../../Core/widgets/dialog_utils.dart';
import '../../../Core/widgets/validators.dart';

class Sign_Up extends StatefulWidget {
  const Sign_Up({super.key});

  @override
  State<Sign_Up> createState() => _Sign_UpState();
}

class _Sign_UpState extends State<Sign_Up> {
  SignUpViewModel viewModel = getIt<SignUpViewModel>();

  @override
  Widget build(BuildContext context) {
    return BlocListener<SignUpViewModel, SignUPStates>(
        listener: (context, state) {
          if (state is loadingStates) {
            DialogUtil.showLoading(context, "loading");
          } else if (state is errorStates) {
            DialogUtil.hideLoading(context);
            DialogUtil.showMessage(context, state.failures.ErrorMessage!);
          } else if (state is sucssesStates) {
            DialogUtil.hideLoading(context);
            DialogUtil.showMessage(context, "succesfully",
                posActionName: "ok", title: "succes");
          }
        },
        child: Scaffold(
          backgroundColor: AppColors.whiteColor,
          body: SingleChildScrollView(
            child: Column(
              children: [
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 16.w),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Padding(
                        padding: EdgeInsets.only(top: 40.h),
                        child: Form(
                          // key: viewModel.formKey,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.stretch,
                            children: [
                              Padding(
                                padding:
                                    const EdgeInsets.symmetric(vertical: 104),
                                child: Center(
                                  child: Text("Sign Up",
                                      style: AppStyles.large30dark),
                                ),
                              ),
                              Text(
                                "Full Name",
                                // style: AppStyles.medium18White,
                              ),
                              CustomTextFormField(
                                isPassword: false,
                                keyboardType: TextInputType.name,
                                isObscureText: false,
                                hintText: "enter your full name",

                                // hintStyle: AppStyles.light18HintText,
                                // filledColor: AppColors.lightPrimaryColor,
                                controller: viewModel.nameController,
                                validator: AppValidators.validateFullName,
                              ),
                              Text(
                                "Mobile Number",
                                // style: AppStyles.medium18White,
                              ),
                              CustomTextFormField(
                                  isPassword: false,
                                  keyboardType: TextInputType.phone,
                                  isObscureText: false,

                                  // filledColor: AppColors.lightPrimaryColor,
                                  hintText: "enter your mobile number",
                                  // hintStyle: AppStyles.light18HintText,
                                  // filledColor: AppColors.whiteColor,
                                  controller: viewModel.phoneController,
                                  validator: AppValidators.validatePhoneNumber),
                              Text(
                                "E-mail address",
                                // style: AppStyles.medium18White,
                              ),
                              CustomTextFormField(
                                  isPassword: false,
                                  keyboardType: TextInputType.emailAddress,
                                  isObscureText: false,
                                  hintText: "enter your email address",
                                  focusColor: AppColors.lightPrimaryColor,
                                  // hintStyle: AppStyles.light18HintText,
                                  // filledColor: AppColors.whiteColor,
                                  controller: viewModel.emailController,
                                  validator: AppValidators.validateEmail),
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
                                suffixIcon: IconButton(
                                    onPressed: () {},
                                    icon: Icon(Icons.visibility_off)),
                              ),
                              Text(
                                "Re-Password",
                                // style: AppStyles.medium18White,
                              ),
                              CustomTextFormField(
                                isPassword: true,
                                keyboardType: TextInputType.visiblePassword,
                                isObscureText: true,
                                hintText: "enter your re-password",
                                // hintStyle: AppStyles.light18HintText,
                                // filledColor: AppColors.whiteColor,
                                controller: viewModel.repassworController,
                                validator: AppValidators.validatePassword,
                                suffixIcon: IconButton(
                                    onPressed: () {},
                                    icon: Icon(Icons.visibility_off)),
                              ),
                              Padding(
                                padding: EdgeInsets.only(top: 35.h),
                                child: CustomElevatedButton(
                                    backgroundColor: AppColors.primaryColor,
                                    textStyle: AppStyles.medium15bback,
                                    text: "Sign up",
                                    onPressed: () {
                                      // viewModel.register();
                                    }),
                              ),
                              Padding(
                                padding:
                                    EdgeInsets.only(top: 30.h, bottom: 30.h),
                                child: GestureDetector(
                                  onTap: () {
                                    Navigator.pushReplacementNamed(
                                        context, AppRoutes.loginRoute);
                                  },
                                  child: Row(
                                    children: [
                                      Expanded(
                                        child: Text(
                                          textAlign: TextAlign.center,
                                          overflow: TextOverflow.ellipsis,
                                          'Already have an account? login',
                                          // style: AppStyles.medium18White,
                                          maxLines: 1,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              )
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
        ));
  }
}
