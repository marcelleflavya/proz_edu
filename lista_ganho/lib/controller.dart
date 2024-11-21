import 'package:lista_ganho/ganho.dart';

class Controller {
  List<Ganho> listaDeGanhos = [];

  void adicionarGanho(String nome, double valor) {
    listaDeGanhos.add(Ganho(nome: nome, valor: valor));
    print('$nome adicionado a lista.');
  }

  void buscarGanhoId(String id) {
    if (listaDeGanhos.isEmpty) {
      print('A lista de ganhos está vazia.');
      return;
    }
    final ganho = listaDeGanhos.firstWhere(
      (ganho) => ganho.id == id,
      orElse: () => Ganho(nome: 'Não encontrou', valor: 0.0),
    );
    if (ganho.id == 'Não encontrou') {
      print('Nenhum ganho corresponde ao ID informado');
    }else{
      print('''
ID: ${ganho.id}
Título: ${ganho.nome}
Valor: ${ganho.valor} 
''');
    }
  }

void buscarGanhoTitulo(String nome) {
    if (listaDeGanhos.isEmpty) {
      print('A lista de ganhos está vazia.');
    }
    final ganhosEncontrados =
        listaDeGanhos.where((ganho) => ganho.nome == nome).toList();
    if (ganhosEncontrados.isNotEmpty) {
      for (var ganho in ganhosEncontrados) {
        print('''
        ID: ${ganho.id}
        Título: ${ganho.nome}
        Valor: ${ganho.valor} 
        ''');
      }
    } else {
      print('Ganho com título "$nome" não encontrado.');
    }
  } 

  void mostrarGanhos() {
    if (listaDeGanhos.isEmpty) {
      print('A lista de ganhos está vazia.');
    } else {
      print('Registro da lista de ganhos:');
      for (var ganho in listaDeGanhos) {
        print('''
ID: ${ganho.id}
Título: ${ganho.nome}
Valor: ${ganho.valor} 
''');
      }
    }
  }
}
