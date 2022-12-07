/*
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:macchina_sos/dto/login_response_dto.dart';
import 'package:macchina_sos/service/login_service.dart';

class AppState {
  final bool isUserLoggedIn;
  final bool isLoading;
  final LoginResponseDto? loginResponseDto;

  AppState(
      {required this.isUserLoggedIn,
      required this.isLoading,
      this.loginResponseDto}); //construciotr
}

//Cubit tiene estado la clase AppState
class AppCubit extends Cubit<AppState> {
  AppCubit() : super(AppState(isUserLoggedIn: false, isLoading: false)); //inicializa el estado

//Logica de negocio para hacer LogIn contra backend

  void login(String username, String password) async {
    //emitir un evento para que se sepa que se esta haciendo login y se muestre un loading
    emit(AppState(isUserLoggedIn: false, isLoading: true));
    await Future.delayed(Duration(seconds: 4));
    try {
      var loginResponseDto = await LoginService.login(username, password);

      //si el login es exitoso
      emit(AppState(
          isUserLoggedIn: true,
          isLoading: false,
          loginResponseDto: loginResponseDto));
    } catch (error) {
      //si el login es fallido se lanza un evento para que se muestre un mensaje de error
      emit(AppState(isUserLoggedIn: false, isLoading: false));
    }
  }

//Logica de negocio para hacer LogOut contra backend
  void logOut() {
    emit(AppState(isUserLoggedIn: false, isLoading: false));
  }
}*/

import 'package:macchina_sos/dto/login_response_dto.dart';
import 'package:macchina_sos/service/login_service.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AppState {
  final bool isUserLoggedIn;
  final bool isLoading;
  final LoginResponseDto? loginResponseDto;

  AppState(
      {required this.isUserLoggedIn,
      required this.isLoading,
      this.loginResponseDto});
}

class AppCubit extends Cubit<AppState> {
  AppCubit() : super(AppState(isUserLoggedIn: false, isLoading: false));

  // Lógica de negocio para hacer el login contra backend
  void login(String username, String password) async {
    // emitir un evento para que la UI sepa que se está haciendo el login
    emit(AppState(isUserLoggedIn: false, isLoading: true));
    await Future.delayed(const Duration(seconds: 3));
    try {
      var loginResponseDto = await LoginService.login(username, password);
      // Si lo anterior salio bien enviamos un evento para que la UI sepa que el login fue exitoso
      emit(AppState(
          isUserLoggedIn: true,
          isLoading: false,
          loginResponseDto: loginResponseDto));
    } catch (error) {
      // Si lo anterior salio mal enviamos un evento para que la UI sepa que el login fue fallido
      emit(AppState(isUserLoggedIn: false, isLoading: false));
    }
  }

  // Lógica de negocio para hacer el logout
  void logout() {
    emit(AppState(isUserLoggedIn: false, isLoading: false));
  }
}
