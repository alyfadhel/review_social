import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:social_app/model/user_model.dart';
import 'package:social_app/modules/login/cubit/login_state.dart';
import 'package:social_app/modules/register/cubit/register_state.dart';

class RegisterCubit extends Cubit<RegisterState> {
  RegisterCubit() : super(InitialRegisterState());

  static RegisterCubit get(context) => BlocProvider.of(context);

  var nameController = TextEditingController();
  var emailController = TextEditingController();
  var phoneController = TextEditingController();
  var passwordController = TextEditingController();
  var formKey = GlobalKey<FormState>();

  bool isPassword = true;

  IconData suffix = Icons.visibility_outlined;

  void changeRegisterPasswordVisibility() {
    isPassword = !isPassword;
    suffix =
        isPassword ? Icons.visibility_outlined : Icons.visibility_off_outlined;

    emit(ChangeRegisterPasswordVisibility());
  }

  void registerUser({
    required String name,
    required String email,
    required String phone,
    required String password,
  }) async {
    emit(GetRegisterUserLoadingState());

    await FirebaseAuth.instance
        .createUserWithEmailAndPassword(
      email: email,
      password: password,
    )
        .then((value) {
      debugPrint('The Email is : ${value.user!.email}');
      debugPrint('The Uid is : ${value.user!.uid}');
      //emit(GetRegisterUserSuccessState());
      createUser(
        name: name,
        email: email,
        phone: phone,
        uId: value.user!.uid,
      );
    }).catchError((error) {
      emit(GetRegisterUserErrorState(error.toString()));
      debugPrint(error.toString());
    });
  }

  void createUser({
    required String name,
    required String email,
    required String phone,
    required String uId,
  }) async {
    emit(GetCreateUserLoadingState());
    UserModel model = UserModel(
      name: name,
      email: email,
      phone: phone,
      uId: uId,
      cover:
          'https://img.freepik.com/free-photo/girl-with-two-red-haired-braids-charming-toothy-smile-used-red-lipstick-dressed-stripped-t-shirt-isolated_295783-2169.jpg?w=740&t=st=1669713977~exp=1669714577~hmac=be2a96efe7867989e081f29e4f65e5891363881fd8ab24d82fd033fd1130c491',
      image:
          'https://img.freepik.com/free-photo/bohemian-man-with-his-arms-crossed_1368-3542.jpg?w=826&t=st=1669708966~exp=1669709566~hmac=74456f1cd054400ff1d4a35fd0e68508832c79720a8b02f0d77a516a957a1bc0',
      bio: 'write your bio....',
      isEmailVerified: false,
    );
    await FirebaseFirestore.instance
        .collection('users')
        .doc(uId)
        .set(model.toMap())
        .then((value) {
      emit(GetCreateUserSuccessState(uId));
    }).catchError((error) {
      emit(GetCreateUserErrorState(error.toString()));
      debugPrint(error.toString());
    });
  }
}
