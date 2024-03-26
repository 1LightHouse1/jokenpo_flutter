import 'package:flutter/material.dart';
import 'package:jokempo/jokempo_home.dart';

void main() {
  final ThemeData thema = ThemeData();
  
  MaterialApp(
    debugShowCheckedModeBanner: false,
    home: JokempoHome(),
    theme: ThemeData().copyWith(
      colorScheme: thema.colorScheme.copyWith(
        primary: Colors.amber,
      ),
    ),
  );
}
