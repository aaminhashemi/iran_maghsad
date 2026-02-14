import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../features/splash/views/splash_screen.dart';
import '../../features/home/views/home_screen.dart';
import '../../features/home/views/multi_step_form_screen.dart'; // اضافه کن
import '../../features/login/views/login_screen.dart';
import '../../features/error/views/error_screen.dart';

final appRouter = GoRouter(
  initialLocation: '/splash',
  routes: [
    GoRoute(
      path: '/splash',
      name: 'splash',
      builder: (context, state) => const SplashScreen(),
    ),
    GoRoute(
      path: '/home',
      name: 'home',
      builder: (context, state) => const HomeScreen(),
    ),
    GoRoute(
      path: '/form',
      name: 'form',
      builder: (context, state) => const MultiStepFormScreen(), // مسیر جدید
    ),
    GoRoute(
      path: '/login',
      name: 'login',
      builder: (context, state) => const LoginScreen(),
    ),
    GoRoute(
      path: '/error',
      name: 'error',
      builder: (context, state) => const ErrorScreen(),
    ),
  ],
);