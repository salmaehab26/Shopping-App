import 'package:shopping/Domain/entities/LogInResponseEntity.dart';

import '../../../../Domain/Failures.dart';

abstract class LogInStates{}
class errorStates extends LogInStates{
  Failures failures;
  errorStates({required this.failures});

}
class initStates extends LogInStates{}

class loadingStates extends LogInStates{}
class sucssesStates extends LogInStates{
  LogInResponseEntity logInResponseEntity;
  sucssesStates({required this.logInResponseEntity});
}