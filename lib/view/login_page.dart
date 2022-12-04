// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../cubit/app_cubit.dart';
/*
class LoginPage extends StatelessWidget {
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text("Login"),
          // ignore: prefer_const_constructors
          TextField(
            key: Key("loginForm_usernameInput_textField"),
            // ignore: prefer_const_constructors
            decoration: InputDecoration(
              labelText: "Username",
            ),
          ),
          TextField(
            key: Key("loginForm_passwordInput_textField"),
            decoration: InputDecoration(
              labelText: "Password",
            ),
          ),

          ElevatedButton(
            onPressed: () => {
             // print("login"),
             BlocProvider.of<AppCubit>(context).login("username", "password")
            },
            child: Text("LogIn"),
          )
        ],
      ),
    );
  }
}
*/

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _formKey = GlobalKey<FormState>();
  final _usernameController = TextEditingController();
  final _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Center(
        child: BlocConsumer<AppCubit, AppState>(
      listener: (context, state) async {
        if (state.isLoading) {
          ScaffoldMessenger.of(context).showSnackBar(
            //  await Future.delayed(Duration(seconds: 4)),
            SnackBar(
              content: Text("Loading..."),
              // content: Text("Bienvenido ${state.loginResponseDto!.firstName}"),
            ),
          );
        }
      },
      builder: (context, state) {
        return formLogin();
      },
    ));
  }

  Widget formLogin() {
    // ignore: dead_code
    return Column(mainAxisAlignment: MainAxisAlignment.center, children: [
      TextField(
        key: Key('loginForm_usernameInput_textField'),
        controller: _usernameController,
        decoration: const InputDecoration(
          labelText: 'Username',
        ),
      ),
      TextField(
        key: const Key('loginForm_passwordInput_textField'),
        controller: _passwordController,
        decoration: const InputDecoration(
          labelText: 'Password',
        ),
      ),
      ElevatedButton(
        key: const Key('loginForm_continue_raisedButton'),
        onPressed: () {
          BlocProvider.of<AppCubit>(context).login(
            _usernameController.text,
            _passwordController.text,
          );
        },
        child: const Text('Login'),
      ),
    ]);
  }
}
