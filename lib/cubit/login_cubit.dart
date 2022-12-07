import 'package:macchina_sos/cubit/page_status.dart';
import 'package:macchina_sos/dto/login_response_dto.dart';
import 'package:macchina_sos/service/login_service.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'login_state.dart';

//class LoginCubit extends Cubit<LoginState> {
//LoginCubit() : super(const LoginState());

//Future<void> login(String username, String password) async {
//final storage = FlutterSecureStorage();
// Le digo al frontedn que estamos iniciando el proceso de login
// emit(state.copyWith(status: PageStatus.loading));
///try {
// Como el móvil no sabe como validar el usario y el password, entonces
// invoca al backend y para invocar el basckend lo realiza a travex
// de una clase Service.
//LoginResponseDto response = await LoginService.login(username, password);
// Si la autenticación fue exitosa Guardar el token y refresh

/*
      await storage.write(key: "TOKEN", value: response.token);
      await storage.write(key: "REFRESH", value: response.refresh);
      emit(state.copyWith(
          loginSuccess: true,
          status: PageStatus.success,
          token: response.token,
          refreshToken: response.refresh));
    } on Exception catch (ex) {
      emit(state.copyWith(
          loginSuccess: false,
          status: PageStatus.failure,
          errorMessage: ex.toString(),
          exception: ex));*/

/*    
class LoginCubit extends Cubit<LoginState> {
  LoginCubit() : super(const LoginState());

  Future<void> login(String username, String password) async {
    emit(state.copyWith(status: PageStatus.loading));
    try {
  LoginResponseDto response = await LoginService.login(username, password);
          if(response.success){
            emit(state.copyWith(
                loginSuccess: true,
                status: PageStatus.success,
                token: response.token,
                refreshToken: response.refresh));
          }else if(!response.success){
            emit(state.copyWith(
                loginSuccess: false,
                status: PageStatus.failure,
                errorMessage: "Usuario o contrasena incorrectos"));
                //exception: Exception(response.message)));
          }

    }on Exception catch (ex){
        emit.(state.copyWith(
          loginSuccess: false,
          status: PageStatus.failure,
          errorMessage: "Error al intentar autenticar al usuario",
          exception: ex));
        
    }
  }
}
*/

class LoginCubit extends Cubit<LoginState> {
  // static String  BACKEND_URL_BASE = "http://192.168.220.161";
  LoginCubit() : super(const LoginState());

  Future<void> login(String username, String passwordd) async {
    emit(state.copyWith(status: PageStatus.loading));
    try {
      LoginResponseDto response = await LoginService.login(username, passwordd);

      emit(state.copyWith(
          loginSuccess: true,
          status: PageStatus.success,
          token: response.token,
          refreshToken: response.refresh));
    } on Exception catch (ex) {
      emit(state.copyWith(
          loginSuccess: false,
          status: PageStatus.failure,
          errorMessage: ex.toString(),
          exception: ex));
    }
  }
}
