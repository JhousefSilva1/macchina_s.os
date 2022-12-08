import 'package:equatable/equatable.dart';


enum PageStatus { initial, loading, success, failure }

class LoginState extends Equatable {
  final PageStatus status;
  final bool loginSuccess;
  final String? errorMessage;
  final Exception? exception;
  final String? token;
  final String? refresh;


  const LoginState({
    this.status = PageStatus.initial,
    this.loginSuccess = false,
    this.errorMessage,
    this.exception,
    this.token,
    this.refresh,
  });

  LoginState copyWith({
    PageStatus? status,
    bool? loginSuccess,
    String? errorMessage,
    Exception? exception,
    String? token,
    String? refresh,
  }) {
    return LoginState(
      status: status ?? this.status,
      loginSuccess: loginSuccess ?? this.loginSuccess,
      errorMessage: errorMessage ?? this.errorMessage,
      exception: exception ?? this.exception,
      token: token ?? this.token,
      refresh: refresh ?? this.refresh,
    );
  }

  @override
  List<Object?> get props => [
        status,
        loginSuccess,
        errorMessage,
        exception,
        token,
        refresh,
      ];
}
