import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_plant_application/screens/forgot_password.dart';
import 'package:flutter_plant_application/screens/on_boarding_screen.dart';
import 'package:flutter_plant_application/screens/root_screen.dart';
import 'package:flutter_plant_application/screens/scan_screen.dart';
import 'package:flutter_plant_application/screens/sign_in_screen.dart';
import 'package:flutter_plant_application/screens/sign_up_screen.dart';
import 'package:go_router/go_router.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      routerConfig: _router,
      title: 'On Boarding Screen',
    );
  }
}

final GoRouter _router = GoRouter(
  routes: [
    GoRoute(
      path: "/",
      builder: (context, state) => const OnBoardingScreen(),
    ),
    GoRoute(
      path: "/signIn",
      builder: (context, state) => const SignIn(),
    ),
    GoRoute(
      path: "/signUp",
      builder: (context, state) => const SignUp(),
    ),
    GoRoute(
      path: "/scan",
      builder: (context, state) => const ScanScreen(),
    ),
    GoRoute(
      path: "/root",
      builder: (context, state) => const RootPage(),
    ),
    GoRoute(
      path: "/forgot-password",
      builder: (context, state) => const ForgotPassword(),
    ),
  ],
);
