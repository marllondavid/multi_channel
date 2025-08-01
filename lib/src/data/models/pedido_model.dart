import 'package:multi_channel/src/data/models/client_model.dart';
import 'package:multi_channel/src/data/models/pedido_item.dart';

class PedidoModel {
  final String id;
  final ClienteModel cliente;
  final String canal;
  final DateTime data;
  final String status;
  final List<PedidoItem> itens;
  final String? observacao;

  PedidoModel({
    required this.id,
    required this.cliente,
    required this.canal,
    required this.data,
    required this.status,
    required this.itens,
    this.observacao,
  });

  double get valorTotal =>
      itens.fold(0, (total, item) => total + item.subtotal);

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'cliente': cliente.toMap(),
      'canal': canal,
      'data': data.toIso8601String(),
      'status': status,
      'itens': itens.map((item) => item.toMap()).toList(),
      'observacao': observacao,
    };
  }

  factory PedidoModel.fromMap(Map<String, dynamic> map) {
    return PedidoModel(
      id: map['id'],
      cliente: ClienteModel.fromMap(map['cliente']),
      canal: map['canal'],
      data: DateTime.parse(map['data']),
      status: map['status'],
      itens: List<PedidoItem>.from(
        (map['itens'] as List).map((item) => PedidoItem.fromMap(item)),
      ),
      observacao: map['observacao'],
    );
  }
}
