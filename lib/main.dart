import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:skinsense1/chatscreen.dart';
import 'package:skinsense1/firebase_options.dart';
import 'package:skinsense1/survey.dart';
import 'package:skinsense1/welcomescreen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  try {
    await Firebase.initializeApp();
    print("Firebase initialized successfully");
  } catch (e) {
    print("Error initializing Firebase: $e");
  }
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: WelcomeScreen(),
      routes: {
        '/next': (context) => SurveyScreen (),
        '/chat': (context) => GeminiChatScreen(),


      },
    );
  }
}