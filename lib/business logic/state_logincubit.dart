import 'package:flutter_application_1/models/login_model.dart';

abstract class LoginCubitState {}

class Initialstate extends LoginCubitState {}

class LoadingRegisterShopAppState extends LoginCubitState {}

class SuccessfulyRegisterShopAppState extends LoginCubitState {
  final LoginModel? model;
  SuccessfulyRegisterShopAppState(this.model);
}

class ErrorRegisterShopAppState extends LoginCubitState {
  final String error;
  ErrorRegisterShopAppState(this.error);
}

class LoadingLoginShopAppState extends LoginCubitState {}

class createDataBaseState extends LoginCubitState {}

class InsertDataBaseState extends LoginCubitState {}

class DleteDataBaseState extends LoginCubitState {}

class LodingState extends LoginCubitState {}

class GetDataBaseState extends LoginCubitState {}

class SuccessfulyLoginShopAppState extends LoginCubitState {
  final LoginModel? model;
  SuccessfulyLoginShopAppState(this.model);
}

class ErrorLoginShopAppState extends LoginCubitState {
  final String error;
  ErrorLoginShopAppState(this.error);
}
