class PedidoItem {
  final String nomeProduto;
  final int quantidade;
  final double valorUnitario;

  PedidoItem({
    required this.nomeProduto,
    required this.quantidade,
    required this.valorUnitario,
  });

  double get subtotal => quantidade * valorUnitario;

  Map<String, dynamic> toMap() {
    return {
      'nomeProduto': nomeProduto,
      'quantidade': quantidade,
      'valorUnitario': valorUnitario,
    };
  }

  factory PedidoItem.fromMap(Map<String, dynamic> map) {
    return PedidoItem(
      nomeProduto: map['nomeProduto'],
      quantidade: map['quantidade'],
      valorUnitario: map['valorUnitario'],
    );
  }
}
