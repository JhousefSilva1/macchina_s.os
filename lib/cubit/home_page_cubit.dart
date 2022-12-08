import 'package:macchina_sos/cubit/home_page_state.dart';
import 'package:macchina_sos/cubit/page_status.dart';
import 'package:macchina_sos/service/user_service.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

import '../dto/user_info.dart';

class HomePageCubit extends Cubit<HomePageState> {
  HomePageCubit() : super(const HomePageState());

  void init() async {
    // Le indicamos al frontend que estamos ocupados
    emit(state.copyWith(status: PageStatus.loading));
    // Vamos a traer la información del usuario, para eso
    // Necesitamos el token con su identidad.
    final storage = FlutterSecureStorage();
    String? token = await storage.read(key: "TOKEN");
    try {
      if (token != null) {
        // Invocamos al service
        UserInfoDto userInfoDto = await UserService().getUserInfo(token);
        emit(state.copyWith(
            status: PageStatus.success, userInfoDto: userInfoDto));
      } else {
        // ignore: todo
        // TODO No hay token deberíamos botar al usuario al login
        emit(state.copyWith(
            status: PageStatus.failure,
            errorMessage: "Usuario no autenticado"));
      }
    } on Exception catch (ex, stacktrace) {
      emit(state.copyWith(
          status: PageStatus.failure,
          errorMessage: "Error al consultar usuario $ex \n $stacktrace"));
    }
  }
}
