import 'package:equatable/equatable.dart';

class Failure extends Equatable {
  final String message;
  const Failure(this.message);

  @override
  List<Object?> get props => throw UnimplementedError();
}

class OfflineFailure extends Failure {
  const OfflineFailure(super.message);
  @override
  List<Object?> get props => [];
}

class ServerFailure extends Failure {
  const ServerFailure(super.message);

  @override
  List<Object?> get props => [];
}

class EmptyCacheFailure extends Failure {
  const EmptyCacheFailure(super.message);

  @override
  List<Object?> get props => [];
}

class InvalidCredentialsFailure extends Failure {
  const InvalidCredentialsFailure(super.message);

  @override
  List<Object?> get props => [];
}

class InvalidOtpFailure extends Failure {
  const InvalidOtpFailure(super.message);

  @override
  List<Object?> get props => [];
}

class NotFoundFailure extends Failure {
  const NotFoundFailure(super.message);

  @override
  List<Object?> get props => [];
}

class ClientFailure extends Failure {
  const ClientFailure(super.message);

  @override
  List<Object?> get props => [];
}

class SocketFailure extends Failure {
  const SocketFailure(super.message);

  @override
  List<Object?> get props => [];
}

class ForbiddenFailure extends Failure {
  const ForbiddenFailure(super.message);

  @override
  List<Object?> get props => [];
}

class UnAuthorizedFailure extends Failure {
  const UnAuthorizedFailure(super.message);

  @override
  List<Object?> get props => [];
}

class UnExpectedFailure extends Failure {
  const UnExpectedFailure(super.message);

  @override
  List<Object?> get props => [];
}
