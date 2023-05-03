abstract class LoginState{}

class InitialLoginState extends LoginState{}

class ChangeLoginPasswordVisibility extends LoginState{}

class GetUserLoginLoadingState extends LoginState{}
class GetUserLoginSuccessState extends LoginState{
  final String uId;

  GetUserLoginSuccessState(this.uId);
}
class GetUserLoginErrorState extends LoginState{
  final String error;

  GetUserLoginErrorState(this.error);
}