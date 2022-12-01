// ignore_for_file: prefer_const_constructors, library_private_types_in_public_api, unused_import

import 'dart:html';

import 'package:flutter/material.dart';

class login_admin extends StatefulWidget {
  @override
  _login_adminState createState() => _login_adminState();
}

class _login_adminState extends State<login_admin> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/images/fondo.jpg"),
            fit: BoxFit.cover,
          ),
        ),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                width: 300,
                child: TextField(
                  decoration: InputDecoration(
                    hintText: "Usuario",
                    hintStyle: TextStyle(color: Colors.white),
                    enabledBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.white),
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Container(
                width: 300,
                child: TextField(
                  decoration: InputDecoration(
                    hintText: "Contraseña",
                    hintStyle: TextStyle(color: Colors.white),
                    enabledBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.white),
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => home_admin()),
                  );
                },
                child: Text("Iniciar Sesión"),
              ),
            ],
          ),
        ),
      ),
    );
  }
  
  home_admin() {}
}
