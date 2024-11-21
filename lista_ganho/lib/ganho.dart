import 'package:uuid/uuid.dart';

class Ganho {
  final String _id = Uuid().v1();
  final String nome;
  final double valor;

  Ganho({
    required this.nome,
    required this.valor,
  });

  String get id => _id;
}
