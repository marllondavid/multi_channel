import 'package:flutter/material.dart';

class AlertTerms extends StatelessWidget {
  const AlertTerms({super.key});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text('Termos e Condições'),
      content: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: const [
            Text(
              'Bem-vindo à nossa plataforma de gestão multicanal de vendas!',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10),
            Text(
              'Ao utilizar este sistema, você concorda com os seguintes termos:',
            ),
            SizedBox(height: 10),
            Text(
                '• O sistema permite a visualização de relatórios de vendas, cadastro de clientes e integração com múltiplos canais de venda.'),
            SizedBox(height: 5),
            Text(
                '• É de sua responsabilidade manter as informações de clientes e vendas atualizadas e corretas.'),
            SizedBox(height: 5),
            Text(
                '• Todos os dados inseridos poderão ser usados para gerar relatórios e insights de performance.'),
            SizedBox(height: 5),
            Text(
                '• O uso indevido da plataforma, incluindo tentativa de burlar regras ou acessar dados de outros usuários, resultará em suspensão da conta.'),
            SizedBox(height: 5),
            Text(
                '• A plataforma está sujeita a melhorias e atualizações constantes, podendo haver mudanças sem aviso prévio.'),
            SizedBox(height: 10),
            Text(
              'Ao clicar em "Aceitar", você concorda com todos os termos descritos acima.',
              style: TextStyle(fontStyle: FontStyle.italic),
            ),
          ],
        ),
      ),
      actions: [
        TextButton(
          onPressed: () {
            Navigator.of(context).pop(false);
          },
          child: const Text('Recusar'),
        ),
        ElevatedButton(
          onPressed: () {
            Navigator.of(context).pop(true);
          },
          child: const Text('Aceitar'),
        ),
      ],
    );
  }
}
