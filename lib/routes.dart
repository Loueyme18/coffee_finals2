import 'package:flutter/material.dart';

// Import all your feature pages
import 'features/splash/splash_page.dart';
import 'features/splash/intro_page.dart';
import 'features/auth/sign_up_page.dart';
import 'features/auth/sign_in_page.dart';
import 'features/home/home_page.dart';
import 'features/home/settings/account_page.dart';

final Map<String, WidgetBuilder> appRoutes = {
  '/splash': (context) => const SplashPage(),
  '/intro': (context) => const IntroPage(),
  '/signup': (context) => const SignUpPage(),
  '/signin': (context) => const SignInPage(),
  '/home': (context) => const HomePage(username: 'Guest'), // supply default or handle args
  '/account': (context) => const AccountPage(username: 'Guest'), // same here
};
