
class Failures{
String? errorMessage;
Failures({required this.errorMessage});
}
class SaverError extends Failures{
  SaverError({required super.errorMessage});

}
class NetworkError extends Failures{
  NetworkError({required super.errorMessage});

}