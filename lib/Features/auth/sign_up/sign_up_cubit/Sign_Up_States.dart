import 'package:shopping/Domain/Failures.dart';
import 'package:shopping/Domain/entities/SignUpResponseEntity.dart';

abstract class SignUPStates{}
class errorStates extends SignUPStates{
  Failures failures;
  errorStates({required this.failures});

}
class initStates extends SignUPStates{}

class loadingStates extends SignUPStates{}
class sucssesStates extends SignUPStates{
  SignUpResponseEntity signUpResponseEntity;
  sucssesStates({required this.signUpResponseEntity});
}
