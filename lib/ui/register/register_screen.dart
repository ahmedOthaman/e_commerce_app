import 'package:e_comerce/ui/register/cubit/register_view_model.dart';
import 'package:e_comerce/ui/register/cubit/states.dart';
import 'package:e_comerce/utils/dialog_utils.dart';
import 'package:e_comerce/utils/my_theme.dart';
import 'package:e_comerce/utils/text_field_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../domain/repository/di.dart';


class RegisterScreen extends StatefulWidget {
  static const String routeName = 'register';

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  RegisterScreenViewModel viewModel =RegisterScreenViewModel(
      registerUseCase:injectRegisterUseCase());
  @override
  Widget build(BuildContext context) {
    return BlocListener<RegisterScreenViewModel ,States>(
        bloc: viewModel,
        listener:(context,state){
             if(state is RegisterLoadingStates){
                DialogUtils.showLoading(context, state.loadingMessage!);
             }
              else if(state is RegisterErrorStates){
               DialogUtils.hideDialog(context);
               DialogUtils.showMessage(context, state.errorMessage!,
                   posActionName: 'OK',title: 'Error');
             } else if(state is RegisterSuccessStates){
               DialogUtils.hideDialog(context);
               DialogUtils.showMessage(context, state.response.userEntity?.name??'',
                   posActionName: 'OK',title: 'success');
             }
        },
      child:Scaffold(
        body: Container(
          color: Theme.of(context).primaryColor,
          height: double.infinity,
          child: SingleChildScrollView(
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(
                      top: 91, bottom: 46, left: 97, right: 97),
                  child: Image.asset('assets/images/route.png'),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: Column(
                    children: [
                      Form(
                        key: viewModel.formKey,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: [
                            CustomTextFieldItem(
                              fullName: 'Full Name',
                              hintText: 'enter your full name',
                              controller: viewModel.nameController,
                              validator: (value) {
                                if (value == null || value.trim().isEmpty) {
                                  return 'please enter your name';
                                }
                                return null;
                              },

                              keyBoardType: TextInputType.name,
                            ),
                            CustomTextFieldItem(
                              fullName: 'E-mail Address',
                              hintText: 'enter your email address',
                              controller: viewModel.emailController,
                              validator: (value) {
                                if (value == null || value.trim().isEmpty) {
                                  return 'please enter your name';
                                }
                                bool emailValid = RegExp(
                                    r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                                    .hasMatch(value);
                                if (!emailValid) {
                                  return 'Please Enter The Email Valid';
                                }
                                return null;
                              },

                              keyBoardType: TextInputType.emailAddress,
                            ),
                            CustomTextFieldItem(
                              fullName: 'password',
                              hintText: 'enter your password',
                              controller: viewModel.passwordController,
                              validator: (value) {
                                if (value == null || value.trim().isEmpty) {
                                  return 'Please Enter The Password';
                                }
                                if (value.trim().length < 6) {
                                  return 'the password is short';
                                }
                                return null;
                              },
                              isObscuer: viewModel.isObscure,
                              keyBoardType: TextInputType.visiblePassword,
                              suffixcIcon: InkWell(
                                child:viewModel.isObscure? Icon(Icons.visibility_off)
                                    :Icon(Icons.visibility),
                                onTap: (){
                                  if(viewModel.isObscure){
                                    viewModel.isObscure=false;
                                  }else{
                                    viewModel.isObscure=true;
                                  }
                                  setState(() {

                                  });
                                },
                              ),

                            ),
                            CustomTextFieldItem(
                              fullName: 'confirm password',
                              hintText: 'enter your password confirmation',
                              controller: viewModel.confirmPasswordController,
                              validator: (value) {
                                if (value == null || value.trim().isEmpty) {
                                  return 'Please Enter The Password';
                                }
                                if (value.trim().length < 6) {
                                  return 'the password is short';
                                }
                                return null;
                              },
                              isObscuer: viewModel.isObscure,
                              keyBoardType: TextInputType.visiblePassword,
                              suffixcIcon: InkWell(
                                child:viewModel.isObscure? Icon(Icons.visibility_off)
                                    :Icon(Icons.visibility),
                                onTap: (){
                                  if(viewModel.isObscure){
                                    viewModel.isObscure=false;
                                  }else{
                                    viewModel.isObscure=true;
                                  }
                                  setState(() {

                                  });
                                },
                              ),

                            ),
                            CustomTextFieldItem(
                              fullName: 'Mobile Number',
                              hintText: 'enter your mobile number',
                              controller: viewModel.phoneController,
                              validator: (value) {
                                if (value == null || value.trim().isEmpty) {
                                  return 'please enter your mobile number';
                                }
                                //if(value.trim().length!=11){
                                //   return 'check your phone number';
                                // }
                                return null;
                              },

                              keyBoardType: TextInputType.phone,
                            ),

                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: ElevatedButton(
                          onPressed: (){
                             viewModel.register();
                             },
                         style:   ElevatedButton.styleFrom(
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.all(Radius.circular(15)),
                              ),
                              backgroundColor: MyTheme.whiteColor,
                            ),

                          child:Text('Sign up',style: Theme.of(context).textTheme.titleLarge!.copyWith(
                            fontWeight: FontWeight.w600,
                            ),
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
      ) ,
    );
  }
}










