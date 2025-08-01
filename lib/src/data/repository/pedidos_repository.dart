import 'package:multi_channel/src/data/models/client_model.dart';
import 'package:multi_channel/src/data/models/pedido_item.dart';
import 'package:multi_channel/src/data/models/pedido_model.dart';
import 'package:multi_channel/src/data/repository/client_repository.dart';

final clientRepository = ClientRepository();
final List<ClienteModel> clientes = clientRepository.getClientes();

class PedidosRepository {
  final _pedidos = [
    PedidoModel(
      id: '123456',
      cliente: clientes[0],
      canal: 'Loja Física',
      data: DateTime.now().subtract(const Duration(days: 1)),
      status: 'Pendente',
      itens: [
        PedidoItem(
            nomeProduto: 'Camisa Polo', quantidade: 2, valorUnitario: 50),
        PedidoItem(
            nomeProduto: 'Cinto Couro', quantidade: 1, valorUnitario: 90),
      ],
    ),
    PedidoModel(
      id: '123457',
      cliente: clientes[1],
      canal: 'Shopee',
      data: DateTime.now().subtract(const Duration(days: 2)),
      status: 'Enviado',
      itens: [
        PedidoItem(
            nomeProduto: 'Tênis Esportivo', quantidade: 1, valorUnitario: 180),
      ],
    ),
    PedidoModel(
      id: '123458',
      cliente: clientes[2],
      canal: 'Shopee',
      data: DateTime.now().subtract(const Duration(days: 2)),
      status: 'Enviado',
      itens: [
        PedidoItem(
            nomeProduto: 'Tênis Esportivo', quantidade: 1, valorUnitario: 180),
      ],
    ),
    PedidoModel(
      id: '123459',
      cliente: clientes[3],
      canal: 'Shopee',
      data: DateTime.now().subtract(const Duration(days: 3)),
      status: 'Enviado',
      itens: [
        PedidoItem(
            nomeProduto: 'Tênis Esportivo', quantidade: 1, valorUnitario: 180),
      ],
    ),
    PedidoModel(
      id: '123410',
      cliente: clientes[4],
      canal: 'Shopee',
      data: DateTime.now().subtract(const Duration(days: 2)),
      status: 'Enviado',
      itens: [
        PedidoItem(
            nomeProduto: 'Tênis Esportivo', quantidade: 1, valorUnitario: 180),
      ],
    ),
  ];

  List<PedidoModel> getPedidos() {
    return _pedidos;
  }
}
