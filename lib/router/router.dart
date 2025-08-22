import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:socially/views/responsive/mobile_layout.dart';
import 'package:socially/views/responsive/responsive_layout.dart';
import 'package:socially/views/responsive/web_layout.dart';

class RouterClass {
  final router = GoRouter(
    initialLocation: "/",
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
    ],
  );
}
