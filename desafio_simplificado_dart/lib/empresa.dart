import 'package:desafio_simplificado_dart/endereco.dart';
import 'package:desafio_simplificado_dart/socio.dart';
import 'package:uuid/uuid.dart';

class Empresa {
  final id = Uuid().v1();
  final date = DateTime.now();
  String razaoSocial;
  String nomeFantasia;
  String cnpj;
  String telefone;
  Socio socio;
  Endereco endereco;
  Empresa({
    required this.razaoSocial,
    required this.nomeFantasia,
    required this.cnpj,
    required this.telefone,
    required this.socio,
    required this.endereco,
  });
}
