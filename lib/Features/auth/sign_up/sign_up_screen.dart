import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../core/utils/validators.dart';
import '../../../Core/resources/app_styles.dart';
import '../../../Core/resources/my_colors.dart';
import '../../../Core/routes_manager/app_routes.dart';
import '../../../none/Widgets/custom_elevated_button.dart';
import '../../../none/Widgets/custom_text_form_field.dart';

class Sign_Up extends StatefulWidget {
const Sign_Up({super.key});

  @override
  State<Sign_Up> createState() => _Sign_UpState();
}

class _Sign_UpState extends State<Sign_Up> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                              padding: const EdgeInsets.symmetric(vertical: 104),
                              child: Center(child:Text("Sign Up",style: AppStyles.large30dark), ),
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
                              // controller: viewModel.fullNameController,
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
                                // controller: viewModel.phoneController,
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
                                // controller: viewModel.mailController,
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
                              // controller: viewModel.passwordController,
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
                              // controller: viewModel.rePasswordController,
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
                              padding: EdgeInsets.only(top: 30.h, bottom: 30.h),
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

    );
  }

}