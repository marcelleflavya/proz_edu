import 'package:desafio_simplificado_dart/endereco.dart';

class Socio extends Endereco {
  String nome;
  String cpf;
  Socio({
    required this.nome,
    required this.cpf,
    required super.logradouro,
    required super.numeroEndereco,
    required super.bairro,
    required super.cidade,
    required super.estado,
    required super.cep,
  });
}
