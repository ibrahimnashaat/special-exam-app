



abstract class LoginStates {}
class LoginInitialStates extends LoginStates{}
class LoginLoadingStates extends LoginInitialStates {}
class LoginSuccessStates extends LoginInitialStates {

  late final String uId;

  LoginSuccessStates ({required this.uId});


}

class LoginErrorStates extends LoginInitialStates {
  late final String error;

  LoginErrorStates(this.error);



}
class PasswordStates extends LoginInitialStates {}



class LoginUsingGoogleLoadingStates extends LoginInitialStates {}
class LoginUsingGoogleSuccessStates extends LoginInitialStates {

  late final String uId;

  LoginUsingGoogleSuccessStates ({required this.uId});


}

class LoginUsingGoogleErrorStates extends LoginInitialStates {
  late final String error;

  LoginUsingGoogleErrorStates(this.error);



}



