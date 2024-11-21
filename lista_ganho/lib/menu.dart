import 'dart:io';
import 'dart:convert';
import 'package:lista_ganho/controller.dart';

class Menu {
  Controller controller = Controller();

  void iniciar() {
    String input;

    do {
      print('''Digite uma opção:
    1 - Adicionar um ganho
    2 - Buscar o ganho pelo Id
    3 - Buscar o ganho pelo título
    4 - Registro final de ganhos
    0 - Sair''');

      input = stdin.readLineSync(encoding: utf8)!;

      switch (input) {
        case '1':
          _adicionarGanho();
          break;
        case '2':
          _buscarGanhoId();
          break;
        case '3':
          _buscarGanhoTitulo();
          break;
        case '4':
          controller.mostrarGanhos();
          break;
        case '0':
          print('Encerrando aplicação!');
          break;
        default:
          print('Opção inválida, tente novamente!');
          break;
      }
    } while (input != '0');
  }

  void _adicionarGanho() {
    print('Digite o Título do ganho:');
    String nome = stdin.readLineSync(encoding: utf8)!;
    print('Digite o valor do ganho:');
    double valor = double.parse(stdin.readLineSync(encoding: utf8)!);
    controller.adicionarGanho(nome, valor);
  }

  void _buscarGanhoId() {
    print('Digite o id do ganho para localizá-lo:');
    String id = stdin.readLineSync(encoding: utf8)!;
    controller.buscarGanhoId(id);
  }

  void _buscarGanhoTitulo() {
    print('Digite o nome do ganho para localizá-lo:');
    String nome = stdin.readLineSync(encoding: utf8)!;
    controller.buscarGanhoTitulo(nome);
  }
}
