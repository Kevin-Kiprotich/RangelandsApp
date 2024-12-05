import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:rangelandsapp/pages/data_collection.dart';

void main() {
  runApp(const MyApp());
}

final kColorScheme = ColorScheme.fromSeed(
    seedColor: const Color.fromRGBO(207, 16, 45, 1),
    primary: const Color.fromRGBO(166, 50, 12, 1),
    secondary: const Color.fromRGBO(16, 148, 72, 1),
    surface: Colors.white,
    onSurface: const Color.fromRGBO(46, 46, 46, 1),);

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
            colorScheme: kColorScheme,
            useMaterial3: true,
            textTheme: TextTheme(
              displayLarge: GoogleFonts.montserrat(
                fontSize: 26,
                fontWeight: FontWeight.bold,
                color: kColorScheme.primary,
              ),
              titleLarge: GoogleFonts.inter(
                fontSize: 18,
                fontWeight: FontWeight.w700,
              ),
              titleMedium: GoogleFonts.inter(
                fontSize: 16,
                fontWeight: FontWeight.w600,
              ),
              titleSmall: GoogleFonts.inter(
                fontSize: 14,
                fontWeight: FontWeight.w700,
              ),
              bodyLarge: GoogleFonts.inter(
                fontSize: 14,
                fontWeight: FontWeight.bold,
              ),
              bodyMedium:
                  GoogleFonts.inter(fontSize: 14, fontWeight: FontWeight.w600),
              bodySmall: GoogleFonts.inter(fontSize: 14),
              labelLarge: GoogleFonts.inter(
                fontSize: 12,
                fontWeight: FontWeight.w600,
              ),
              labelMedium:
                  GoogleFonts.inter(fontSize: 10, fontWeight: FontWeight.w600),
              labelSmall: GoogleFonts.inter(fontSize: 8),
            ),
            textButtonTheme: TextButtonThemeData(
                style: ButtonStyle(
              foregroundColor: WidgetStateProperty.all(
                const Color.fromRGBO(0, 126, 255, 1),
              ),
            ))),
        home: const HomePage());
  }
}
