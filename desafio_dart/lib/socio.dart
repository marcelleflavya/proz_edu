import 'package:desafio_dart/endereco.dart';

class Socio {
  String nome; // razão social para o pj
  String documento; //cpf e cnpj
  Endereco endereco;
  Socio({
    required this.nome,
    required this.documento,
    required this.endereco,
  });
}
