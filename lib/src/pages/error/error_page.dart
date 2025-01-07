import 'package:flutter/material.dart';

class ErrorPage extends StatelessWidget {
  const ErrorPage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    double iconSize = MediaQuery.of(context).size.width * 0.3;
    iconSize = iconSize > 200 ? 200 : iconSize;

    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                Icons.error_outline,
                size: iconSize,
                color: Colors.grey,
              ),
              const SizedBox(height: 24),

              const Text(
                'LOJA NÃO ENCONTRADA',
                style: TextStyle(
                  fontSize: 32,
                  fontWeight: FontWeight.bold,
                  color: Colors.grey,
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 20),
              // Subtítulo ou descrição adicional

              // ElevatedButton.icon(
              //   onPressed: () {
              //     // Ação ao pressionar o botão, por exemplo, recarregar a página
              //     // Você pode ajustar a ação conforme necessário
              //     Navigator.of(context).popUntil((route) => route.isFirst);
              //   },
              //   icon: const Icon(Icons.refresh),
              //   label: const Text('Recarregar'),
              //   style: ElevatedButton.styleFrom(
              //     padding:
              //         const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
              //     textStyle: const TextStyle(fontSize: 16),
              //   ),
              // ),
            ],
          ),
        ),
      ),
    );
  }
}
