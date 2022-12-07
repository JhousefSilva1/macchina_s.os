/*
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:macchina_sos/view/login_page.dart';

import 'cubit/app_cubit.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Macchine SOS',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MultiBlocProvider(
        providers: [
          BlocProvider(create: (context) => AppCubit()),
          // BlocProvider(create: (context) => LoginCubit()),
          // BlocProvider(create: (context) => MakeOrder()),
        ],
        child: const MyHomePage(title: 'Macchine SOS'),
      ),
    );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({Key? key, required String title}) : super(key: key);

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Macchine SOS"),
      ),
      body: BlocBuilder<AppCubit, AppState>(
        //escucha los eventos del cubit
        builder: (BuildContext context, state) {
          if (!state.isUserLoggedIn) {
            return LoginPage();
          }  else if (state.isUserLoggedIn) {
            return Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("Bienvenido ${state.loginResponseDto!.firstName}"),
                  ElevatedButton(
                    onPressed: () {
                      BlocProvider.of<AppCubit>(context).logOut();
                    },
                    child: Text("LogOut"),
                  )
                ],
              ),
            );
          } else {
            return Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("No estas logueado"),
                  ElevatedButton(
                    onPressed: () {
                      BlocProvider.of<AppCubit>(context)
                          .login("jpozo", "12345");
                    },
                    child: Text("LogIn"),
                  )
                ],
              ),
            );
          }
        },
      ),
    );
  }
}
*/

import 'package:macchina_sos/ui/home_page.dart';
import 'package:macchina_sos/ui/login_page.dart';
import 'package:macchina_sos/ui/order_page.dart';
import 'package:macchina_sos/ui/register_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'cubit/app_cubit.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (context) => AppCubit(),
        child: MaterialApp(
          title: 'Pedidos Ya!',
          theme: ThemeData(
            // This is the theme of your application.
            primarySwatch: Colors.purple,
          ),
          initialRoute: "/",
          routes: {
            "/": (context) => const LoginPage(),
            "/home": (context) => const HomePage(),
            "/newOrder": (context) => const OrderPage(),
            "/register": (context) => const RegisterPage(),
          },
        ));
  }
}
