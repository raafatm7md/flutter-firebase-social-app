part of 'register_cubit.dart';

@immutable
abstract class RegisterState {}

class RegisterInitial extends RegisterState {}

class RegisterLoading extends RegisterState {}

class RegisterSuccess extends RegisterState {}

class RegisterError extends RegisterState {
  final String error;
  RegisterError(this.error);
}

class CreateSuccess extends RegisterState {
  final String uId;
  CreateSuccess(this.uId);
}

class CreateError extends RegisterState {
  final String error;
  CreateError(this.error);
}

class RegisterPasswordVisibility extends RegisterState {}
