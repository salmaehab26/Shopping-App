import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:shopping/Domain/use_cases/authUseCase/SignUpUseCase.dart';
import 'package:shopping/Features/auth/sign_up/sign_up_cubit/Sign_Up_States.dart';

@injectable
class SignUpViewModel extends Cubit<SignUPStates> {
  SignUpUseCase signUpUseCase;

  SignUpViewModel({required this.signUpUseCase}) : super(initStates());
  var nameController = TextEditingController();
  var emailController = TextEditingController();
  var passwordController = TextEditingController();
  var repassworController = TextEditingController();
  var phoneController = TextEditingController();

  void SignUP() async {
    emit(loadingStates());
    var either = await signUpUseCase.invoke(
        nameController.text,
        emailController.text,
        passwordController.text,
        repassworController.text,
        phoneController.text);
    either.fold((l) => emit(errorStates(failures: l)),
        (r) => emit(sucssesStates(signUpResponseEntity: r)));
  }
}
