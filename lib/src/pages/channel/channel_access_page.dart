import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:multi_channel/src/core/ui/constants/colors_constants.dart';
import 'package:multi_channel/src/core/ui/widgets/home_drawer.dart';
import 'package:multi_channel/src/core/ui/widgets/shared_scaffold.dart';
import 'package:multi_channel/src/pages/channel/widgets/channel_card.dart';
import 'package:multi_channel/src/providers/theme_provider.dart';
import 'package:provider/provider.dart';

class ChannelAccessPage extends StatelessWidget {
  const ChannelAccessPage({super.key});

  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);

    return SharedScaffold(
      title: 'Acesso aos Canais',
      drawer: HomeDrawer(
        isDarkMode: themeProvider.isDarkMode,
        onThemeChanged: themeProvider.toggleTheme,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(18),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(height: 20),
            Wrap(
              spacing: 20,
              runSpacing: 20,
              children: [
                ChannelCard(
                  icon: FontAwesomeIcons.instagram,
                  title: 'Instagram',
                  url: 'https://instagram.com/sualoja',
                  color: Colors.purple,
                ),
                ChannelCard(
                  icon: FontAwesomeIcons.whatsapp,
                  title: 'WhatsApp',
                  url: 'https://wa.me/5599999999999',
                  color: Colors.green,
                ),
                ChannelCard(
                  iconImagePath: 'assets/images/shopee.png',
                  title: 'Shoppe',
                  url: 'https://shopee.com/sualoja',
                  color: Colors.orange,
                ),
                ChannelCard(
                  iconImagePath: 'assets/images/mercadolivre.png',
                  title: 'Mercado Livre',
                  url: 'https://shopee.com/sualoja',
                  color: ColorsConstants.mercadoLivre,
                ),
                ChannelCard(
                  iconImagePath: 'assets/images/amazon.png',
                  title: 'Amazon',
                  url: 'https://shopee.com/sualoja',
                  color: ColorsConstants.copyLink,
                ),
                ChannelCard(
                  icon: FontAwesomeIcons.store,
                  title: 'Loja Física (Catálogo)',
                  url: 'https://seusite.com/catalogo',
                  color: ColorsConstants.primaryColor,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
