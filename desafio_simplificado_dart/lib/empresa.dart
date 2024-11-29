import 'package:uuid/uuid.dart';
import 'package:desafio_simplificado_dart/endereco.dart';
import 'package:desafio_simplificado_dart/socio.dart';

class Empresa extends Endereco {
  final id = Uuid().v1();
  final date = DateTime.now();
  String razaoSocial;
  String nomeFantasia;
  String cnpj;
  String telefone;
  Socio socio;
  Empresa({
    required this.razaoSocial,
    required this.nomeFantasia,
    required this.cnpj,
    required this.telefone,
    required this.socio,
    required super.logradouro,
    required super.numeroEndereco,
    required super.bairro,
    required super.cidade,
    required super.estado,
    required super.cep,
  });
}
