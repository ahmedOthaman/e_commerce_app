

import 'package:e_comerce/domain/repository/repository/auth_repository_contract.dart';
import 'package:e_comerce/domain/use_case/register_use_case.dart';
import 'package:e_comerce/ui/register/cubit/states.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class RegisterScreenViewModel extends Cubit<States>{
  RegisterScreenViewModel({required this.registerUseCase}):super(RegisterInitialStates());
  var formKey = GlobalKey<FormState>();
  var nameController = TextEditingController();
  var passwordController = TextEditingController();
  var confirmPasswordController = TextEditingController();
  var emailController = TextEditingController();
  var phoneController = TextEditingController();
  RegisterUseCase registerUseCase;
  bool isObscure = true;
   void register()async{
     if(formKey.currentState!.validate()==true){


        emit(RegisterLoadingStates(loadingMessage: 'Loading...'));
         var either=await registerUseCase.invoke(nameController.text, passwordController.text,
             emailController.text, phoneController.text, confirmPasswordController.text);
       either.fold((l) {
         emit(RegisterErrorStates(errorMessage: l.errorMessage));
       }, (response) {
         emit(RegisterSuccessStates(response: response));
       });
     }
   }

}