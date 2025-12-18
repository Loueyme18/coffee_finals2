import 'package:flutter/material.dart';
import 'features/auth/sign_up_page.dart';
import 'features/auth/sign_in_page.dart';
import 'features/home/home_page.dart';
import 'features/home/settings/account_page.dart';
import 'features/home/settings/settings_page.dart';
import 'features/splash/splash_page.dart';
import 'features/splash/intro_page.dart';
import 'core/theme/app_theme.dart'; // for light/dark mode

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: AppTheme.lightTheme,     // 🌞 Light
      darkTheme: AppTheme.darkTheme,  // 🌙 Dark
      themeMode: ThemeMode.system,    // auto-switch based on device
      initialRoute: '/splash',
      onGenerateRoute: (settings) {
        final args = settings.arguments;

        switch (settings.name) {
          case '/splash':
            return MaterialPageRoute(builder: (_) => const SplashPage());

          case '/intro':
            return MaterialPageRoute(builder: (_) => const IntroPage());

          case '/signup':
            return MaterialPageRoute(builder: (_) => const SignUpPage());

          case '/signin':
            return MaterialPageRoute(builder: (_) => const SignInPage());

          case '/home':
            if (args is String) {
              return MaterialPageRoute(
                builder: (_) => HomePage(username: args),
              );
            }
            return _errorRoute();

          case '/account':
            if (args is String) {
              return MaterialPageRoute(
                builder: (_) => AccountPage(username: args),
              );
            }
            return _errorRoute();

          case '/settings':
            if (args is Map<String, String>) {
              return MaterialPageRoute(
                builder: (_) => SettingsPage(
                  username: args['username'] ?? 'Guest',
                  email: args['email'] ?? 'guest@email.com',
                ),
              );
            }
            return _errorRoute();

          default:
            return _errorRoute();
        }
      },
    );
  }
}

/// Helper route for invalid arguments or missing pages
Route<dynamic> _errorRoute() {
  return MaterialPageRoute(
    builder: (_) => const Scaffold(
      body: Center(
        child: Text(
          'Invalid arguments or Page not found',
          style: TextStyle(fontSize: 18, color: Colors.red),
        ),
      ),
    ),
  );
}
