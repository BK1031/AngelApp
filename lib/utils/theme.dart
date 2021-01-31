import 'package:flutter/material.dart';

bool darkMode = false;
bool darkAppBar = false;

Color mainColor = const Color(0xFFF19AB9);
Color accentColor = const Color(0xFFFFDD77);

// LIGHT THEME
const lightTextColor = Colors.black;
const lightBackgroundColor = Color(0xFFf9f9f9);
const lightCardColor = Colors.white;
const lightDividerColor = const Color(0xFFC9C9C9);

// DARK THEME
const darkTextColor = Colors.white;
const darkBackgroundColor = const Color(0xFF212121);
const darkCardColor = const Color(0xFF2C2C2C);
const darkDividerColor = const Color(0xFF616161);

// BLACK THEME
const blackTextColor = Colors.white;
const blackBackgroundColor = const Color(0xFF212121);
const blackCardColor = const Color(0xFF2C2C2C);
const blackDividerColor = const Color(0xFF616161);

// CURRENT COLORs
var currTextColor = darkTextColor;
var currBackgroundColor = darkBackgroundColor;
var currCardColor = darkCardColor;
var currDividerColor = darkDividerColor;

final mainTheme = new ThemeData(
    primaryColor: mainColor,
    accentColor: mainColor,
    brightness: Brightness.dark,
    cardTheme: CardTheme(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(8.0)))
    )
);