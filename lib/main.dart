

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
          title: 'Macchina SOS',
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
