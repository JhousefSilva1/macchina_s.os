import 'package:flutter_bloc/flutter_bloc.dart';

class AppState {
  final bool isUserLoggedIn;

  AppState({required this.isUserLoggedIn}); //construciotr
}

class AppCubit extends Cubit<AppState> {
  //Cubit tiene estado la clase AppState

  AppCubit() : super(AppState(isUserLoggedIn: false)); //inicializa el estado

//Logica de negocio para hacer LogIn contra backend
  void logIn() {
    emit(AppState(isUserLoggedIn: true));
  }

/*
  void logOut(){
    emit(AppState(isUserLoggedIn: false));
  }*/

}
