import 'dart:io';
import 'dart:convert';

import 'package:lista_mapas_serie/controller.dart';

class Menu {
  Controller controller = Controller();

  void menu() {
    String input;

    do {
      print('''Digite uma opção no menu
  1 - Adicionar Série
  2 - Mostrar Lista de séries
  0 - Sair
  ''');

      input = stdin.readLineSync(encoding: utf8)!;

      switch (input) {
        case '1':
          print('Diigite o nome da série:');
          String nome = stdin.readLineSync(encoding: utf8)!;
          print('Digite seu gênero:');
          String genero = stdin.readLineSync(encoding: utf8)!;
          print('Digite seu ano de lançamento:');
          int ano = int.parse(stdin.readLineSync(encoding: utf8)!);
          controller.adicionarSerie(nome, genero, ano);

          break;
        case '2':
          controller.mostrarSerie();
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
}
