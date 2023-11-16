import '../../../domain/entieties/auth_result_enity.dart';

abstract class LoginStates{}
class LoginScreenInitialStates extends LoginStates{}

 class LoginScreenLoadingStates extends LoginStates{
 String? loadingMessage;
 LoginScreenLoadingStates({required this.loadingMessage});
 }

 class LoginScreenErrorStates extends LoginStates{
 String? errorMessage;
 LoginScreenErrorStates({required this.errorMessage});
 }

 class LoginScreenSuccessStates extends LoginStates{
  AuthResultEntity response ;
  LoginScreenSuccessStates({required this.response});
 }


