import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:multi_channel/src/core/ui/widgets/shared_background.dart';
import 'package:multi_channel/src/data/models/client_model.dart';
import 'package:multi_channel/src/pages/channel/channel_access_page.dart';
import 'package:multi_channel/src/pages/clients/list_client_page.dart';
import 'package:multi_channel/src/pages/clients/client_form_page.dart';
import 'package:multi_channel/src/pages/error/error_page.dart';
import 'package:multi_channel/src/pages/home/home_page.dart';
import 'package:multi_channel/src/pages/login/login_page.dart';
import 'package:multi_channel/src/pages/message/message_center_page.dart';
import 'package:multi_channel/src/pages/pedido/list_pedido_page.dart';
import 'package:multi_channel/src/pages/register/register_user_page.dart';
import 'package:multi_channel/src/pages/report/report_pages.dart';
import 'package:multi_channel/src/pages/reset/reset_password_page.dart';
import 'package:multi_channel/src/pages/splash/splash_page.dart';

class AppRouter {
  final GoRouter router;

  AppRouter()
      : router = GoRouter(
          initialLocation: '/splash',
          routes: [
            GoRoute(
              path: '/splash',
              name: 'splash',
              builder: (context, state) => const SplashPage(),
            ),
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
            GoRoute(
              path: '/list-client',
              name: 'listclient',
              builder: (context, state) => SharedBackground(
                child: const ListClientPage(),
              ),
            ),
            GoRoute(
              path: '/cadastro-cliente',
              name: 'cadastrocliente',
              builder: (context, state) {
                final cliente = state.extra as ClienteModel?;
                return SharedBackground(
                  child: ClientFormPage(cliente: cliente),
                );
              },
            ),
            GoRoute(
              path: '/list-pedido',
              name: 'listarpedido',
              builder: (context, state) {
                return SharedBackground(
                  child: ListPedidosPage(),
                );
              },
            ),
            GoRoute(
              path: '/message',
              name: 'message',
              builder: (context, state) {
                return SharedBackground(
                  child: MessageCenterPage(),
                );
              },
            ),
            GoRoute(
              path: '/report',
              name: 'report',
              builder: (context, state) {
                return SharedBackground(
                  child: ReportPages(),
                );
              },
            ),
            GoRoute(
              path: '/channels',
              name: 'channels',
              builder: (context, state) {
                return SharedBackground(
                  child: ChannelAccessPage(),
                );
              },
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
