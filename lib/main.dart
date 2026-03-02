import 'package:flutter/material.dart';
import 'mispantallas/inicio.dart';
import 'mispantallas/pantalla2.dart';
import 'mispantallas/pantalla3.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    title: 'Electro - Oscar Martinez',
    initialRoute: '/',
    routes: {
      '/': (context) => const Inicio(),
      '/pantalla2': (context) => const Pantalla2(),
      '/pantalla3': (context) => const Pantalla3(),
    },
  ));
}