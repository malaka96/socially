import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:socially/views/auth_views/login_screen.dart';
import 'package:socially/views/auth_views/register_screen.dart';
import 'package:socially/views/responsive/mobile_layout.dart';
import 'package:socially/views/responsive/responsive_layout.dart';
import 'package:socially/views/responsive/web_layout.dart';

class RouterClass {
  final router = GoRouter(
    initialLocation: "/register",
    errorPageBuilder: (context, state) {
      return MaterialPage(
        child: Scaffold(body: Center(child: Text('this page is not found'))),
      );
    },
    routes: [
      GoRoute(
        path: "/",
        name: "layout_manager",
        builder: (context, state) {
          return const ResponsiveLayout(
            mobileLayout: MobileLayout(),
            webLayout: WebLayout(),
          );
        },
      ),

      GoRoute(
        path: "/register",
        name: "register_screen",
        builder: (context, state) => RegisterScreen(),
      ),

      GoRoute(
        path: "/login",
        name: "login_screen",
        builder: (context, state) => LoginScreen(),
      )
    ],
  );
}
