
import 'package:e_comerce/domain/entieties/auth_result_enity.dart';

import '../../../data/model/response/RegisterResponseDto.dart';

abstract class States{}
class RegisterInitialStates extends States{}
class RegisterLoadingStates extends States{
  String? loadingMessage;
  RegisterLoadingStates({this.loadingMessage});
}
class RegisterErrorStates extends States{
String? errorMessage;
RegisterErrorStates({this.errorMessage});
}
class RegisterSuccessStates extends States{
 AuthResultEntity response ;
 RegisterSuccessStates({required this.response});
}

