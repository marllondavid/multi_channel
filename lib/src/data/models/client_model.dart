class ClienteModel {
  final String nome;
  final String cpfCnpj;
  final String telefone;
  final String cep;
  final String rua;
  final String numero;
  final String? complemento;
  final String bairro;
  final String estado;
  final String cidade;
  final String email;
  final String origem;

  ClienteModel({
    required this.nome,
    required this.cpfCnpj,
    required this.telefone,
    required this.cep,
    required this.rua,
    required this.numero,
    this.complemento,
    required this.bairro,
    required this.estado,
    required this.cidade,
    required this.email,
    required this.origem,
  });

  Map<String, dynamic> toMap() {
    return {
      'nome': nome,
      'cpfCnpj': cpfCnpj,
      'telefone': telefone,
      'cep': cep,
      'rua': rua,
      'numero': numero,
      'complemento': complemento,
      'bairro': bairro,
      'estado': estado,
      'cidade': cidade,
      'email': email,
      'origem': origem,
    };
  }

  factory ClienteModel.fromMap(Map<String, dynamic> map) {
    return ClienteModel(
      nome: map['nome'] ?? '',
      cpfCnpj: map['cpfCnpj'] ?? '',
      telefone: map['telefone'] ?? '',
      cep: map['cep'] ?? '',
      rua: map['rua'] ?? '',
      numero: map['numero'] ?? '',
      complemento: map['complemento'],
      bairro: map['bairro'] ?? '',
      estado: map['estado'] ?? '',
      cidade: map['cidade'] ?? '',
      email: map['email'] ?? '',
      origem: map['origem'] ?? '',
    );
  }
}
