import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:multi_channel/src/core/ui/widgets/shared_background.dart';
import 'package:multi_channel/src/pages/error/error_page.dart';
import 'package:multi_channel/src/pages/home/home_page.dart';
import 'package:multi_channel/src/pages/login/login_page.dart';
import 'package:multi_channel/src/pages/register/register_user_page.dart';
import 'package:multi_channel/src/pages/reset/reset_password_page.dart';

class AppRouter {
  final GoRouter router;

  AppRouter()
      : router = GoRouter(
          initialLocation: '/auth/login',
          routes: [
            GoRoute(
              path: '/auth/login',
              name: 'login',
              builder: (context, state) => SharedBackground(
                child: const LoginPage(),
              ),
            ),
            GoRoute(
              path: '/resetpassword',
              name: 'resetpassword',
              builder: (context, state) => SharedBackground(
                child: const ResetPasswordPage(),
              ),
            ),
            GoRoute(
              path: '/register',
              name: 'register',
              builder: (context, state) => SharedBackground(
                child: const RegisterUserPage(),
              ),
            ),
            GoRoute(
              path: '/home',
              name: 'home',
              builder: (context, state) => SharedBackground(
                child: const HomePage(),
              ),
            ),
          ],
          redirect: (BuildContext context, GoRouterState state) {
            if (state.uri.toString() == '/') {
              return '/auth/login';
            }
            return null;
          },
          errorBuilder: (context, state) {
            return SharedBackground(child: const ErrorPage());
          },
        );
}
