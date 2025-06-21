import 'package:flutter/material.dart';
import 'package:get_location/screens/home_screen.dart';
import 'package:get_location/screens/best_capital.dart';
import 'package:go_router/go_router.dart';
import 'package:flutter_web_plugins/flutter_web_plugins.dart';

void main() {
  usePathUrlStrategy();
  runApp(const MyApp());
}

final GoRouter _router = GoRouter(
  initialLocation: "/",
  routes: [
    GoRoute(path: "/", builder: (context, routerState) => HomeScreen()),
    GoRoute(
      path: "/bestCapital",
      builder: (context, routerState) => BestCapital(),
    ),
  ],
);

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerConfig: _router,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        textTheme: TextTheme()
      ),
    );
  }
}
