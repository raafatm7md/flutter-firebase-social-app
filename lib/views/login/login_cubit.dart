import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';

part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit() : super(LoginInitial());

  static LoginCubit get(context) => BlocProvider.of(context);

  void userLogin(String email, String password){
    emit(LoginLoading());
    FirebaseAuth.instance.signInWithEmailAndPassword(email: email, password: password).then((value) {
      emit(LoginSuccess(value.user!.uid));
    }).catchError((e) {
      emit(LoginError(e.toString()));
    });
  }

  IconData suffix = Icons.visibility_outlined;
  bool password = true;
  void changePasswordVisibility(){
    password = !password;
    suffix = password ? Icons.visibility_outlined : Icons.visibility_off_outlined;
    emit(LoginPasswordVisibility());
  }
}
