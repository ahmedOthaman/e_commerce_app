import 'package:e_comerce/ui/login/cubit/states.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../domain/use_case/login_use_case.dart';


class LoginScreenViewModel extends Cubit<LoginStates>{
  LoginScreenViewModel({required this.loginUseCase}):super(LoginScreenInitialStates());
  var formKey = GlobalKey<FormState>();
  var emailController = TextEditingController();
  var passwordController = TextEditingController();


  LoginUseCase loginUseCase;
  bool isObscure = true;
  void login()async{
    if(formKey.currentState!.validate()==true){


      emit(LoginScreenLoadingStates(loadingMessage: 'Loading...'));
      var either=await loginUseCase.invoke( passwordController.text,emailController.text
      );
      either.fold((l) {
        emit(LoginScreenErrorStates(errorMessage: l.errorMessage));
      }, (response) {
        emit(LoginScreenSuccessStates(response: response));
      });
    }
  }
}
