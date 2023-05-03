import 'package:bloc/bloc.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:social_app/modules/login/cubit/login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit() : super(InitialLoginState());

  static LoginCubit get(context) => BlocProvider.of(context);

  var emailController = TextEditingController();
  var passwordController = TextEditingController();
  var formKey = GlobalKey<FormState>();

  bool isPassword = true;

  IconData suffix = Icons.visibility_outlined;

  void changeLoginPasswordVisibility() {
    isPassword = !isPassword;
    suffix =
        isPassword ? Icons.visibility_outlined : Icons.visibility_off_outlined;

    emit(ChangeLoginPasswordVisibility());
  }

  void getUserLogin({
    required String email,
    required String password,
  }) async {
    emit(GetUserLoginLoadingState());

    await FirebaseAuth.instance.signInWithEmailAndPassword(
      email: email,
      password: password,
    ).then((value)
    {
      debugPrint(value.user!.email);
      debugPrint(value.user!.uid);
      emit(GetUserLoginSuccessState(value.user!.uid));
    }).catchError((error)
    {
      emit(GetUserLoginErrorState(error.toString()));
      debugPrint(error.toString());
    });
  }
}
