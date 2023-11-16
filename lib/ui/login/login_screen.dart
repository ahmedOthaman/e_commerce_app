import 'package:e_comerce/domain/repository/di.dart';
import 'package:e_comerce/domain/use_case/login_use_case.dart';
import 'package:e_comerce/ui/login/cubit/login_screen_view_model.dart';
import 'package:e_comerce/ui/register/register_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../utils/dialog_utils.dart';
import '../../utils/my_theme.dart';
import '../../utils/text_field_item.dart';
import 'cubit/states.dart';

class LoginScreen extends StatefulWidget {
  static const String routeName = 'login';

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
 LoginScreenViewModel viewModel =LoginScreenViewModel(
   loginUseCase: injectLoginUseCase()
 );

  @override
  Widget build(BuildContext context) {
      return BlocListener<LoginScreenViewModel ,LoginStates>(
        bloc: viewModel,
        listener:(context,state){
        if(state is LoginScreenLoadingStates){
        DialogUtils.showLoading(context, state.loadingMessage!);
      }
      else if(state is LoginScreenErrorStates){
          DialogUtils.hideDialog(context);
        DialogUtils.showMessage(context, state.errorMessage!,
            posActionName: 'OK',title: 'Error');
      } else if(state is LoginScreenSuccessStates){
        DialogUtils.hideDialog(context);
        DialogUtils.showMessage(context, state.response.userEntity?.name??'',
            posActionName: 'OK',title: 'success');
      }
    },
         child:  Scaffold(
          body: Container(
        color: Theme.of(context).primaryColor,
        height: double.infinity,
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
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
                    Text('Welcome Back To Route',style:TextStyle(
                      color: MyTheme.whiteColor,
                      fontSize: 24,
                      fontWeight: FontWeight.w600
                    ) ,
                    textAlign: TextAlign.start,),
                    Text('Please sign in with your mail',style:TextStyle(
                        color: MyTheme.whiteColor,
                        fontSize: 16,
                        fontWeight: FontWeight.w300
                    ) , textAlign: TextAlign.start),
                    SizedBox(height: 25.h,),
                    Form(
                      key: viewModel.formKey,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
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
                        ],
                      ),
                    ),
                    Text('Forgot password',style:TextStyle(
                        color: MyTheme.whiteColor,
                        fontSize: 18,
                        fontWeight: FontWeight.w400
                    ) , textAlign: TextAlign.end),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: ElevatedButton(
                        onPressed: (){
                                viewModel.login();

                        },
                        style:ElevatedButton.styleFrom(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.all(Radius.circular(15)),
                            ),
                            backgroundColor: MyTheme.whiteColor,
                          ),

                        child:Text('Login',style: Theme.of(context).textTheme.titleLarge!.copyWith(
                          fontWeight: FontWeight.w600,
                        ),),
                      ),
                    ),
                    SizedBox(height: 20.h,),
                    InkWell(
                      onTap: (){
                        Navigator.pushNamed(context, RegisterScreen.routeName);
                      },
                      child: Text('Don’t have an account? Create Account',style:TextStyle(
                          color: MyTheme.whiteColor,
                          fontSize: 18,
                          fontWeight: FontWeight.w500
                      ) , textAlign: TextAlign.end),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    ),
      );
  }
}
