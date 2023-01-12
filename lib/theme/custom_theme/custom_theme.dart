import 'package:flutter/material.dart';

class CustomTheme{
 static ThemeData get lightTheme{
   return ThemeData(
     brightness: Brightness.dark,
     primaryColor: Colors.blueAccent,
     fontFamily: 'Georgia',
     appBarTheme: const AppBarTheme(color: Colors.deepPurpleAccent),
     textTheme:  const TextTheme(
       headline1: TextStyle(fontSize: 60,fontWeight: FontWeight.bold,color: Colors.white),
       headline3: TextStyle(fontSize: 40, fontWeight: FontWeight.bold,color: Colors.purple),
       headline6: TextStyle(fontSize: 20, fontWeight: FontWeight.normal),
       bodyText2: TextStyle(fontSize: 18,fontWeight: FontWeight.bold, fontFamily: 'Roboto', color: Colors.white),
       bodyText1: TextStyle(fontSize: 14,fontWeight: FontWeight.bold, fontFamily: 'Roboto', color: Colors.white),
     ),
     elevatedButtonTheme: ElevatedButtonThemeData(
         style: ElevatedButton.styleFrom(
             padding: const EdgeInsets.symmetric(horizontal: 40,vertical: 25),
             shape: RoundedRectangleBorder(
                 borderRadius: BorderRadius.circular(50)
             ),
             shadowColor: Colors.white,
             textStyle: const TextStyle(fontSize: 20,fontStyle: FontStyle.normal)
         )
     ),
   );
 }
}