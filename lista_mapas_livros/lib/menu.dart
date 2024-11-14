import 'dart:convert';
import 'dart:io';
import 'package:lista_mapas_livros/controller.dart';

class Menu {
  Controller controller = Controller();
  void iniciar() {
    String input;

    do {
      print('''Digite uma opção:
      1 - Adicionar Livro
      2 - Remover livro
      3 - Atualizar Dados do livro
      4 - Reordenar aleatoriamente
      5 - Ordenar alfabeticamente
      6 - Mostrar lista de livros
      0 - Sair
''');
      input = stdin.readLineSync(encoding: utf8)!;

      switch (input) {
        case '1':
          _adicionarLivros();
          break;
        case '2':
          _removerLivros();
          break;
        case '3':
          _atualizarDadosLivros();
          break;
        case '4':
          controller.reordenarLivros();
          controller.listadeLivros.forEach(print);
          break;
        case '5':
          controller.ordenarAlfabeticamente();
          controller.listadeLivros.forEach(print);
          break;
        case '6':
          controller.mostrarLista();
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

//o _ antes do nome da função significa que é privada, entao ela so pode ser acessada aqui nessa função menu();
  void _adicionarLivros() {
    print('Digite o nome do livro:');
    String nome = stdin.readLineSync(encoding: utf8)!;
    print('Digite o autor:');
    String autor = stdin.readLineSync(encoding: utf8)!;
    int? paginas;
    do {
      print('Digite a quantidade de páginas:');
      paginas = int.tryParse(stdin.readLineSync(encoding: utf8)!);
      if (paginas == null) {
        print(
            'Entrada inválida. Por favor, digite um número inteiro para páginas.');
      }
    } while (paginas == null);

    int? ano;
    do {
      print('Digite o ano da publicação (formato yyyy):');
      ano = int.tryParse(stdin.readLineSync(encoding: utf8)!);
      if (ano == null || ano.toString().length != 4) {
        print('Entrada inválida. Por favor, digite um ano no formato yyyy.');
        ano = null;
      }
    } while (ano == null);

    int? isbn;
    do {
      print('Digite o isbn da publicação com 13 digitos:');
      isbn = int.tryParse(stdin.readLineSync(encoding: utf8)!);
      if (isbn == null || isbn.toString().length != 13) {
        print(
            'Entrada inválida. Por favor, digite um isbn com números inteiros e com 13 digitos.');
        isbn = null;
      }
    } while (isbn == null);

    controller.adicionarLivros(nome, autor, paginas, ano, isbn);
  }

  void _removerLivros() {
    if (controller.listadeLivros.isEmpty) {
      print('Essa lista está vazia!');
      return;
    }
    print('Digite qual livro deseja remover da lista:');
    String nome = stdin.readLineSync(encoding: utf8)!;
    var procurandoLivro = controller.buscaLivro(nome);

    if (procurandoLivro!.isNotEmpty) {
      if (confirma(
          'Tem certeza que deseja remover o $nome da lista? Digite 1 para confirmar ou 2 para cancelar:')) {
        controller.removerLivros(nome);
      } else {
        print('$nome mantido na lista.');
      }
    } else {
      print('$nome não está na lista.');
    }
  }

  void _atualizarDadosLivros() {
    if (controller.listadeLivros.isEmpty) {
      print('Essa lista está vazia!');
      return;
    }
    print('Digite qual livro deseja atualizar da lista:');
    String nome = stdin.readLineSync(encoding: utf8)!;
    var procurandoLivro = controller.buscaLivro(nome);
    if (procurandoLivro!.isNotEmpty) {
      print('Qual campo deseja atualizar?');
      String campo = stdin.readLineSync(encoding: utf8)!;
      print('Digite o novo valor para $campo?');
      String novoValor = stdin.readLineSync(encoding: utf8)!;
      switch (campo) {
        case 'nome':
          controller.atualizarDadosLivros(
              nome,
              novoValor,
              procurandoLivro['autor'],
              procurandoLivro['paginas'],
              procurandoLivro['ano'],
              procurandoLivro['isbn']);
          break;
        case 'autor':
          controller.atualizarDadosLivros(
              nome,
              procurandoLivro['nome'],
              novoValor,
              procurandoLivro['paginas'],
              procurandoLivro['ano'],
              procurandoLivro['isbn']);
          break;
        case 'paginas':
          int novoPaginas =
              int.tryParse(novoValor) ?? procurandoLivro['paginas'];
          controller.atualizarDadosLivros(
              nome,
              procurandoLivro['nome'],
              procurandoLivro['autor'],
              novoPaginas,
              procurandoLivro['ano'],
              procurandoLivro['isbn']);
          break;
        case 'ano':
          //o tryParse vai converter para um número inteiro, se der certo,
          // vai retornar o número e se nao der certo vai retornar o valor antigo que é  (procurandoLivro['paginas'])
          //é como se fosse um ternário, mas se der o else ele mantem o que ja estava.
          int novoAno = int.tryParse(novoValor) ?? procurandoLivro['ano'];
          controller.atualizarDadosLivros(
              nome,
              procurandoLivro['nome'],
              procurandoLivro['autor'],
              procurandoLivro['paginas'],
              novoAno,
              procurandoLivro['isbn']);
          break;
        case 'isbn':
          controller.atualizarDadosLivros(
              nome,
              procurandoLivro['nome'],
              procurandoLivro['autor'],
              procurandoLivro['paginas'],
              procurandoLivro['ano'],
              novoValor);
          break;
        default:
          print('Campo inválido.');
          break;
      }
    } else {
      print('$nome não está na lista.');
    }
  }

  bool confirma(String mensagem) {
    print(mensagem);
    String confirma = stdin.readLineSync(encoding: utf8)!;
    if (confirma == '1') {
      return true;
    }
    return false;
  }
}
