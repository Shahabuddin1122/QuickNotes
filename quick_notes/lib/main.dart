import 'package:flutter/material.dart';
import 'package:quick_notes/screens/Home.dart';
import 'package:quick_notes/screens/add_note.dart';
import 'package:quick_notes/screens/view_notes.dart';
import 'package:quick_notes/utils/scheme.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    initialRoute: '/',
    theme: Scheme.lightTheme,
    themeMode: ThemeMode.system,
    routes: {
      '/': (context) => const Home(),
      '/view-notes': (context) => const ViewNotes(),
      '/add-notes': (contex) => const AddNote(),
    },
  ));
}
