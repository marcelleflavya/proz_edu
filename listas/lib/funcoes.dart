import 'dart:convert';
import 'dart:io';

void menu() {
  List<String> listaDeTemas = [];
  String input;

  do {
    print('''Digite uma opção:
  1 - Adicionar Tema
  2 - Remover Tema
  3 - Atualizar tema
  4 - Reordenar tema
  5 - Orderar em ordem alfabética
  6 - Mostrar lista
  0 - Sair
  ''');

    input = stdin.readLineSync(encoding: utf8)!;

    switch (input) {
      case '1':
        print('Digite o tema que deseja adicionar:');
        String tema = stdin.readLineSync(encoding: utf8)!;
        if (listaDeTemas.contains(tema)) {
          print('Esse $tema já existe, adicione um que não exista ainda.');
        } else {
          adicionarTema(listaDeTemas, tema);
          print('$tema foi adicionado.');
        }
        break;
      case '2':
        print('Digite qual tema deseja remover:');
        String tema = stdin.readLineSync(encoding: utf8)!;
        if (listaDeTemas.contains(tema)) {
          print(
              'Tem certeza que quer excluir esse tema? Digite 1 para confirmar e 2 pra cancelar');
          String confirma = stdin.readLineSync(encoding: utf8)!;
          if (confirma == '1') {
            removerTema(listaDeTemas, tema);
            print('$tema foi removido.');
          } else if (confirma == '2') {
            print('$tema foi mantido.');
          }
        } else {
          print('$tema não existe na lista.');
        }

        break;

      case '3':
        print('Digite qual tema deseja atualizar:');
        String tema = stdin.readLineSync(encoding: utf8)!;
        if (listaDeTemas.contains(tema)) {
          print('Digite a nova atualização desse tema:');
          String novoTema = stdin.readLineSync(encoding: utf8)!;
          print(
              'Confirme: $tema foi atualizado para $novoTema Digite 1 para confirmar e 2 pra cancelar');
          String confirma = stdin.readLineSync(encoding: utf8)!;
          if (confirma == '1') {
            atualizarTema(listaDeTemas, tema, novoTema);
            print('$novoTema foi atualizado');
          } else if (confirma == '2') {
            print('$tema foi mantido');
          }
        } else {
          print('$tema não existe na lista.');
        }

        break;

      case '4':
        reordenar(listaDeTemas);
        print('A lista foi reordenada aleatoriamente.');
        mostrarLista(listaDeTemas);
        break;
      case '5':
        ordemAlfabetica(listaDeTemas);
        print('A lista foi ordenada alfabeticamente.');
        mostrarLista(listaDeTemas);
        break;
      case '6':
        mostrarLista(listaDeTemas);
        break;
      case '0':
        print('Encerrando aplicação');
        break;
      default:
        print('Opção inválida, tente novamente.');
    }
  } while (input != '0');
}

void adicionarTema(List<String> listaDeTemas, String tema) {
  listaDeTemas.add(tema);
}

void removerTema(List<String> listaDeTemas, String tema) {
  listaDeTemas.remove(tema);
}

void atualizarTema(List<String> listaDeTemas, String tema, String novoTema) {
  /*if (listaDeTemas.contains(tema)) {
    listaDeTemas.remove(tema);
    listaDeTemas.add(novoTema);
  }*/

  int index = listaDeTemas.indexOf(tema);
  if (index != -1) {
    listaDeTemas[index] = novoTema;
  }
}

void reordenar(List<String> listaDeTemas) {
  listaDeTemas.shuffle();
}

void ordemAlfabetica(List<String> listaDeTemas) {
  listaDeTemas.sort();
}

void mostrarLista(List<String> listaDeTemas) {
  if (listaDeTemas.isEmpty) {
    print('Lista vazia');
  } else {
    print('Lista de temas:');
    listaDeTemas.forEach(print);
  }
}
