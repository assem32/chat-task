abstract class LoginStates{}

class InitialLoginState extends LoginStates{}

class SuccessLoginState extends LoginStates{
  final String uId;
  SuccessLoginState(this.uId);
}

class ErrorLoginState extends LoginStates{
  final String error;
  ErrorLoginState(this.error);
}

class LoadingLoginState extends LoginStates{}

class SocialSuffixState extends LoginStates{}