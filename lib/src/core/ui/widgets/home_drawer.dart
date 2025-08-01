import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:go_router/go_router.dart';
import 'package:multi_channel/src/core/ui/constants/colors_constants.dart';

class HomeDrawer extends StatelessWidget {
  final bool isDarkMode;
  final Function(bool) onThemeChanged;

  const HomeDrawer({
    required this.isDarkMode,
    required this.onThemeChanged,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            DrawerHeader(
              decoration: BoxDecoration(color: ColorsConstants.primaryColor),
              child: Text(
                'MultiCanal',
                style: TextStyle(color: Colors.white, fontSize: 18),
              ),
            ),
            ListTile(
              leading: const Icon(Icons.home),
              title: const Text('Início'),
              onTap: () {
                context.go('/home');
              },
            ),
            ListTile(
              leading: const Icon(FontAwesomeIcons.message),
              title: const Text('Central de Mensagens'),
              onTap: () {
                context.go('/message');
              },
            ),
            ListTile(
              leading: const Icon(Icons.people),
              title: const Text('Clientes'),
              onTap: () {
                context.go('/list-client');
              },
            ),
            ListTile(
              leading: const Icon(Icons.shopping_cart),
              title: const Text('Pedidos'),
              onTap: () {
                context.go('/list-pedido');
              },
            ),
            ListTile(
              leading: const Icon(Icons.analytics),
              title: const Text('Relatórios'),
              onTap: () {
                context.go('/report');
              },
            ),
            ListTile(
              leading: const Icon(Icons.shopify_sharp),
              title: const Text('Canais'),
              onTap: () {
                context.go('/channels');
              },
            ),
            Spacer(),
            SwitchListTile(
              title: const Text(
                'Modo Escuro',
                style: TextStyle(
                  fontSize: 13,
                  fontWeight: FontWeight.bold,
                ),
              ),
              value: isDarkMode,
              onChanged: onThemeChanged,
              secondary: const Icon(Icons.dark_mode),
            ),
          ],
        ),
      ),
    );
  }
}
