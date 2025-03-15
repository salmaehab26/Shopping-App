import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:shopping/Domain/use_cases/LogInUseCase.dart';
import 'package:shopping/Features/auth/log_in/log_in_cubit/LogInStates.dart';
@injectable
class LogInViewModel extends Cubit<LogInStates> {
  LogInViewModel({required this.logInUseCase}) : super(initStates());
  LogInUseCase logInUseCase;
  var emailController = TextEditingController();
  var passwordController = TextEditingController();

  @override
  void LogIn() async {
    emit(loadingStates());
    var response =
        await logInUseCase.call(emailController.text, passwordController.text);
    response.fold(
      (l) => emit(errorStates(failures: l)),
      (r) => emit(sucssesStates(logInResponseEntity: r)),
    );
  }
}
