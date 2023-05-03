abstract class RegisterState{}

class InitialRegisterState extends RegisterState{}

class ChangeRegisterPasswordVisibility extends RegisterState{}

class GetRegisterUserLoadingState extends RegisterState{}
class GetRegisterUserSuccessState extends RegisterState{}
class GetRegisterUserErrorState extends RegisterState
{
  final String error;

  GetRegisterUserErrorState(this.error);
}

class GetCreateUserLoadingState extends RegisterState{}
class GetCreateUserSuccessState extends RegisterState{
  final String uId;

  GetCreateUserSuccessState(this.uId);
}
class GetCreateUserErrorState extends RegisterState{
  final String error;

  GetCreateUserErrorState(this.error);
}