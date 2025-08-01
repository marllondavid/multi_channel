import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class NotificationCenter extends StatefulWidget {
  const NotificationCenter({super.key});

  @override
  State<NotificationCenter> createState() => _NotificationCenterState();
}

class _NotificationCenterState extends State<NotificationCenter> {
  final List<Map<String, dynamic>> notifications = [
    {
      'title': 'Mensagem do Cliente',
      'desc': 'João: "Qual o prazo de entrega?"',
      'icon': FontAwesomeIcons.solidMessage,
      'color': Colors.blueAccent
    },
    {
      'title': 'Pedido em Andamento',
      'desc': 'Pedido #1234 está sendo processado.',
      'icon': FontAwesomeIcons.boxOpen,
      'color': Colors.orange
    },
    {
      'title': 'Pagamento Confirmado',
      'desc': 'R\$ 259,00 recebidos via PIX.',
      'icon': FontAwesomeIcons.moneyBill,
      'color': Colors.green
    },
    {
      'title': 'Nova Avaliação',
      'desc': 'Cliente avaliou seu produto com 5 estrelas.',
      'icon': FontAwesomeIcons.star,
      'color': Colors.amber
    },
    {
      'title': 'Estoque Baixo',
      'desc': 'Produto "Fone Bluetooth" com menos de 5 unidades.',
      'icon': FontAwesomeIcons.triangleExclamation,
      'color': Colors.redAccent
    },
    {
      'title': 'Carrinho Abandonado',
      'desc': 'Cliente deixou itens no carrinho há 2 dias.',
      'icon': FontAwesomeIcons.cartShopping,
      'color': Colors.deepPurple
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Padding(
          padding: EdgeInsets.only(bottom: 12),
          child: Text(
            'Notificações',
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        Expanded(
          child: ListView.separated(
            itemCount: notifications.length,
            separatorBuilder: (_, __) => const Divider(height: 16),
            itemBuilder: (_, index) {
              final item = notifications[index];
              return Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  FaIcon(
                    item['icon'],
                    size: 18,
                    color: item['color'],
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          item['title'],
                          style: const TextStyle(
                            fontWeight: FontWeight.w600,
                            fontSize: 13,
                          ),
                        ),
                        const SizedBox(height: 4),
                        Text(
                          item['desc'],
                          style: const TextStyle(
                            fontSize: 12,
                            color: Colors.black54,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              );
            },
          ),
        ),
      ],
    );
  }
}
