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

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required String title}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Macchine SOS"),
      ),
      body: BlocBuilder<AppCubit, AppState>(
          builder: (BuildContext context, state) {
        if (state.isLoading) {
          return Center(child: CircularProgressIndicator());
        } else if (state.isUserLoggedIn) {
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
                    BlocProvider.of<AppCubit>(context).login("jpozo", "12345");
                  },
                  child: Text("LogIn"),
                )
              ],
            ),
          );
        }
      }),
    );
  }
}
