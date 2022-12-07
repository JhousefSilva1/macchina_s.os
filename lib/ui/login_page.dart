// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:macchina_sos/cubit/login_cubit.dart';
import 'package:macchina_sos/cubit/login_state.dart';
import 'package:macchina_sos/cubit/page_status.dart';

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
/*
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
*/
class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _usernameController = TextEditingController();
  final _passwordController = TextEditingController();

  @override
  Widget build(BuildContext ctx1) {
    return BlocProvider(
      create: (context) => LoginCubit(),
      child: Scaffold(
          appBar: AppBar(
            title: const Text("Login"),
          ),
          body: BlocConsumer<LoginCubit, LoginState>(
            listener: (ctx3, state) {
              if (state.status == PageStatus.loading) {
                _showDialog(context, "Autenticación",
                    "Verificando sus credenciales", false);
              } else if (state.status == PageStatus.success &&
                  state.loginSuccess) {
                Navigator.pop(ctx3); // quito el dialog
                Navigator.pushNamed(ctx3, '/home');
              } else {
                Navigator.pop(ctx3); // quito el dialog
                _showDialog(context, "Error", state.errorMessage!, true);
              }
            },
            builder: (context, state) => Center(child: formLogin(context)),
          )),
    );
  }

  Widget formLogin(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Text("Login"),
        TextField(
          controller: _usernameController,
          decoration: const InputDecoration(
            hintText: "Username",
          ),
        ),
        TextField(
          controller: _passwordController,
          decoration: const InputDecoration(
            hintText: "Password",
          ),
        ),
        ElevatedButton(
            onPressed: () {
              BlocProvider.of<LoginCubit>(context)
                  .login(_usernameController.text, _passwordController.text);
            },
            child: const Text("Login")),
        ElevatedButton(
            onPressed: () {
              Navigator.pushNamed(context, '/register');
            },
            child: const Text("Create account"))
      ],
    );
  }

  Future<void> _showDialog(BuildContext context, String title, String message,
      bool closeable) async {
    return showDialog<void>(
      context: context,
      barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(title),
          content: SingleChildScrollView(
            child: ListBody(
              children: <Widget>[
                Text(message),
              ],
            ),
          ),
          actions: <Widget>[
            closeable
                ? TextButton(
                    child: const Text('Cerrar'),
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                  )
                : Container(),
          ],
        );
      },
    );
  }
}
  /*

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
}*/

