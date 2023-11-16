import 'dart:convert';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:dartz/dartz.dart';
import 'package:e_comerce/data/api/api_constant.dart';
import 'package:e_comerce/data/model/reqest/LoginRequest.dart';
import 'package:e_comerce/domain/entieties/fauilers.dart';
import 'package:http/http.dart' as http;

import '../model/reqest/RegisterRequest.dart';
import '../model/response/LoginResponseDto.dart';
import '../model/response/RegisterResponseDto.dart';
class ApiManager{
  ApiManager._();
 static ApiManager? _instanse;
 static ApiManager getInstanse(){
   _instanse??=ApiManager._();
   return _instanse!;
 }

   Future<Either<Failures,RegisterResponseDto>> register(String name,String password,String email,String phone,
       String rePassword)async{
     final connectivityResult = await (Connectivity().checkConnectivity());
     if (connectivityResult == ConnectivityResult.mobile||
         connectivityResult == ConnectivityResult.wifi) {
       Uri url =Uri.https(ApiConstant.baseUrl,ApiConstant.registerApi);
       var requestBody=RegisterRequest(
           phone:phone,
           name:name,
           password:password,
           email:email,
           rePassword:rePassword
       );
       var response=await http.post(url,body: requestBody.toString());
       var responseBody=response.body;
       var json=jsonDecode(responseBody);
       var registerResponse=  RegisterResponseDto.fromJson(json);
       if(response.statusCode>=200&&response.statusCode<=300){
         return Right(registerResponse);
       }
       else{
         return Left(Failures(errorMessage:registerResponse.error !=null?
         registerResponse.error!.msg:registerResponse.message
         ));
       }
     } else {
       return Left(Failures(errorMessage: 'check network connection'));
     }

  }

  Future<Either<Failures,LoginResponseDto>> login(String password,String email)async{
    final connectivityResult = await (Connectivity().checkConnectivity());
    if (connectivityResult == ConnectivityResult.mobile||
        connectivityResult == ConnectivityResult.wifi) {
      Uri url =Uri.https(ApiConstant.baseUrl,ApiConstant.loginApi);
      var requestBody=LoginRequest(
          password:password,
          email:email,
      );
      var response=await http.post(url,body: requestBody.toString());
      var responseBody=response.body;
      var json=jsonDecode(responseBody);
      var loginResponse=  LoginResponseDto.fromJson(json);
      if(response.statusCode>=200&&response.statusCode<=300){
        return Right(loginResponse);
      }
      else{
        return Left(Failures(errorMessage:loginResponse.message
        ));
      }
    } else {
      return Left(Failures(errorMessage: 'check network connection'));
    }

  }

}
