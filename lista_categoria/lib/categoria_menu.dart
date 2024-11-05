import 'dart:convert';
import 'dart:io';
import 'controller.dart';

class CategoriaMenu {
  final Controller controller = Controller();
  List<String> listaDeCategorias = [];

  void menu() {
    String input;

    do {
      print('''Digite a opção desejada:
  1 - Adicionar categoria
  2 - Buscar categoria
  3 - Excluir categoria
  4 - Registro final das categorias
  0 - Sair
''');

      input = stdin.readLineSync(encoding: utf8)!;

      switch (input) {
        case '1':
          print('Digite o nome da categoria:');
          String nome = stdin.readLineSync(encoding: utf8)!;
          controller.adicionarCategoria(listaDeCategorias, nome);
          print('$nome adicionado com sucesso');
          break;
        case '2':
          print('Digite o nome da categoria:');
          String nome = stdin.readLineSync(encoding: utf8)!;
          if (controller.buscarCategoria(listaDeCategorias, nome)) {
            print('$nome está na lista');
          } else {
            print('$nome não está na lista');
          }
          print('Registro da lista de categorias atualizado:');
          controller.registroCategoria(listaDeCategorias);
          break;
        case '3':
          print('Digite o nome da categoria:');
          String nome = stdin.readLineSync(encoding: utf8)!;
          if (listaDeCategorias.contains(nome)) {
            print(
                'Tem certeza que deseja excluir $nome? Digite 1 para confirma e 2 para cancelar');
            String confirma = stdin.readLineSync(encoding: utf8)!;
            if (confirma == '1') {
              controller.excluirCategoria(listaDeCategorias, nome);
              print('$nome foi excluido da lista.');
            } else if (confirma == '2') {
              print('$nome será mantido na lista.');
            }
          } else {
            print('$nome não está na lista.');
          }
          print('Registro da lista de categorias atualizado:');
          controller.registroCategoria(listaDeCategorias);
          break;
        case '4':
          print('Registro da lista de categorias:');
          controller.registroCategoria(listaDeCategorias);
          break;
        case '0':
          print('Encerrando aplicação');
          break;
        default:
          print('Opção inválida, tente novamente');
          break;
      }
    } while (input != '0');
  }
}
