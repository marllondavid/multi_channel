import 'package:flutter/material.dart';
import 'package:multi_channel/src/core/ui/constants/colors_constants.dart';
import 'package:multi_channel/src/core/ui/widgets/home_drawer.dart';
import 'package:multi_channel/src/core/ui/widgets/shared_scaffold.dart';
import 'package:multi_channel/src/data/models/chat_client.dart';
import 'package:multi_channel/src/data/models/chat_message.dart';
import 'package:multi_channel/src/providers/theme_provider.dart';
import 'package:provider/provider.dart';

class MessageCenterPage extends StatefulWidget {
  const MessageCenterPage({super.key});

  @override
  State<MessageCenterPage> createState() => _MessageCenterPageState();
}

class _MessageCenterPageState extends State<MessageCenterPage> {
  int selectedChatIndex = 0;
  bool showLeftPanel = true;

  final List<ChatClient> clients = [
    ChatClient(
      name: 'João da Silva',
      avatarUrl:
          'data:image/jpeg;base64,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',
      lastMessage: 'O produto chegou hoje, obrigado!',
      messages: [
        ChatMessage(
            text: 'Olá, já recebeu o produto em sua residência?',
            fromClient: false),
        ChatMessage(text: 'Olá, chegou hoje sim.', fromClient: true),
        ChatMessage(
            text: 'Fico feliz! Qualquer coisa fico à disposição.',
            fromClient: false),
      ],
    ),
    ChatClient(
      name: 'Maria Oliveira',
      avatarUrl:
          "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQ97wv_mB5KYYhTmC0PE7YwaCFK-a_C5EEHdg&s",
      lastMessage: 'Vocês vendem por atacado?',
      messages: [
        ChatMessage(text: 'Vocês vendem por atacado?', fromClient: true),
        ChatMessage(
            text: 'Sim! A partir de 10 unidades já consideramos.',
            fromClient: false),
      ],
    ),
    ChatClient(
      name: 'Get Start',
      avatarUrl:
          "https://static.vecteezy.com/system/resources/previews/047/656/219/non_2x/abstract-logo-design-for-any-corporate-brand-business-company-vector.jpg",
      lastMessage: 'Vocês vendem por atacado?',
      messages: [
        ChatMessage(
            text: 'Qual o tempo para envio da minha mercadoria?',
            fromClient: true),
        ChatMessage(text: 'Em até 24hs', fromClient: false),
      ],
    ),
  ];

  final TextEditingController _msgController = TextEditingController();

  void sendMessage() {
    final text = _msgController.text.trim();
    if (text.isNotEmpty) {
      setState(() {
        clients[selectedChatIndex].messages.add(
              ChatMessage(text: text, fromClient: false),
            );
        _msgController.clear();
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);
    final selectedClient = clients[selectedChatIndex];

    return SharedScaffold(
        title: 'Central de Mensagens',
        drawer: HomeDrawer(
          isDarkMode: themeProvider.isDarkMode,
          onThemeChanged: themeProvider.toggleTheme,
        ),
        body: Row(
          children: [
            Container(
              width: 300,
              decoration: BoxDecoration(
                color: ColorsConstants.greyDark.withValues(alpha: 0.3),
                border: const Border(
                  right: BorderSide(color: Colors.grey, width: 0.5),
                ),
              ),
              child: ListView.separated(
                itemCount: clients.length,
                separatorBuilder: (_, __) => const Divider(height: 1),
                itemBuilder: (_, index) {
                  final client = clients[index];
                  return ListTile(
                    leading: CircleAvatar(
                      backgroundColor: Colors.grey.shade200,
                      radius: 24,
                      child: ClipOval(
                        child: Image.network(
                          client.avatarUrl,
                          width: 48,
                          height: 48,
                          fit: BoxFit.cover,
                          errorBuilder: (context, error, stackTrace) =>
                              const Icon(Icons.person, size: 24),
                        ),
                      ),
                    ),
                    title: Text(client.name),
                    subtitle: Text(
                      client.lastMessage,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                    selected: index == selectedChatIndex,
                    onTap: () {
                      setState(() {
                        selectedChatIndex = index;
                      });
                    },
                  );
                },
              ),
            ),
            Expanded(
              child: Column(
                children: [
                  Container(
                    padding: const EdgeInsets.all(16),
                    decoration: BoxDecoration(
                      color: Theme.of(context).cardColor,
                      border: Border(
                        bottom: BorderSide(color: Colors.grey.shade300),
                      ),
                    ),
                    child: Row(
                      children: [
                        CircleAvatar(
                          backgroundColor: Colors.grey.shade200,
                          radius: 24,
                          child: ClipOval(
                            child: Image.network(
                              selectedClient.avatarUrl,
                              width: 48,
                              height: 48,
                              fit: BoxFit.cover,
                              errorBuilder: (context, error, stackTrace) =>
                                  const Icon(Icons.person, size: 24),
                            ),
                          ),
                        ),
                        const SizedBox(width: 12),
                        Text(
                          selectedClient.name,
                          style: Theme.of(context).textTheme.titleMedium,
                        ),
                      ],
                    ),
                  ),
                  Expanded(
                    child: ListView.builder(
                      padding: const EdgeInsets.all(16),
                      itemCount: selectedClient.messages.length,
                      itemBuilder: (_, index) {
                        final msg = selectedClient.messages[index];
                        return Align(
                          alignment: msg.fromClient
                              ? Alignment.centerLeft
                              : Alignment.centerRight,
                          child: Container(
                            padding: const EdgeInsets.all(10),
                            margin: const EdgeInsets.symmetric(vertical: 4),
                            decoration: BoxDecoration(
                              color: msg.fromClient
                                  ? Colors.grey.shade200
                                  : ColorsConstants.primaryColor
                                      .withValues(alpha: 0.9),
                              borderRadius: BorderRadius.circular(8),
                            ),
                            child: Text(
                              msg.text,
                              style: TextStyle(
                                color: msg.fromClient
                                    ? Colors.black87
                                    : Colors.white,
                              ),
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.all(12),
                    decoration: BoxDecoration(
                      color: Theme.of(context).cardColor,
                      border: Border(
                        top: BorderSide(color: Colors.grey.shade300),
                      ),
                    ),
                    child: Row(
                      children: [
                        Expanded(
                          child: TextFormField(
                            controller: _msgController,
                            decoration: const InputDecoration(
                              hintText: 'Digite sua mensagem...',
                              border: OutlineInputBorder(),
                            ),
                          ),
                        ),
                        const SizedBox(width: 8),
                        IconButton(
                          onPressed: sendMessage,
                          icon: const Icon(Icons.send),
                          color: ColorsConstants.primaryColor,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ));
  }
}
