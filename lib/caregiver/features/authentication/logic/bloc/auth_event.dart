part of 'auth_bloc.dart';

sealed class CaregiverAuthEvent extends Equatable {
  const CaregiverAuthEvent();

  @override
  List<Object> get props => [];
}

// login patient
class LoginCaregiverEvent extends CaregiverAuthEvent {
  final String email;
  final String password;
  const LoginCaregiverEvent({required this.email,required this.password});
}

// register patient
class RegisterCaregiverEvent extends CaregiverAuthEvent {
  final Map<String,String> caregiverData;
  final Map<String,File> files;
  const RegisterCaregiverEvent({required this.caregiverData,required this.files});
}

class GetCentersEvent extends CaregiverAuthEvent {
  const GetCentersEvent();
  @override
  List<Object> get props => [];
}

class GetCategoriesEvent extends CaregiverAuthEvent {
  const GetCategoriesEvent();
  @override
  List<Object> get props => [];
}





