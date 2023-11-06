import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:meta/meta.dart';
import 'package:social_app/models/user_model.dart';

part 'register_state.dart';

class RegisterCubit extends Cubit<RegisterState> {
  RegisterCubit() : super(RegisterInitial());

  static RegisterCubit get(context) => BlocProvider.of(context);

  void userRegister(String name, String email, String password, String phone) {
    emit(RegisterLoading());
    FirebaseAuth.instance
        .createUserWithEmailAndPassword(email: email, password: password)
        .then((value) {
      userCreate(
          name: name,
          email: email,
          password: password,
          phone: phone,
          uId: value.user!.uid,
          isEmailVerified: false);
    }).catchError((e) {
      emit(RegisterError(e.toString()));
    });
  }

  void userCreate({
    required String name,
    required String email,
    required String password,
    required String phone,
    required String uId,
    String image = 'https://static.vecteezy.com/system/resources/previews/020/765/399/non_2x/default-profile-account-unknown-icon-black-silhouette-free-vector.jpg',
    String cover = 'https://marketplace.canva.com/EAFJ_EHcmNA/1/0/1600w/canva-abstract-pastel-background-desktop-wallpaper-KtuyBRXG1OA.jpg',
    String bio = 'write your bio ...',
    required bool isEmailVerified,
  }) {
    UserModel model = UserModel(
        name: name,
        email: email,
        phone: phone,
        password: password,
        uId: uId,
        image: image,
        cover: cover,
        bio: bio,
        isEmailVerified: isEmailVerified);
    FirebaseFirestore.instance
        .collection('users')
        .doc(uId)
        .set(model.toMap())
        .then((value) {
      emit(CreateSuccess(uId));
    }).catchError((e) {
      emit(CreateError(e.toString()));
    });
  }

  IconData suffix = Icons.visibility_outlined;
  bool password = true;
  void changePasswordVisibility() {
    password = !password;
    suffix =
        password ? Icons.visibility_outlined : Icons.visibility_off_outlined;
    emit(RegisterPasswordVisibility());
  }
}
