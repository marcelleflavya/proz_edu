class Controller {
  List<Map<String, dynamic>> listadeLivros = [];

  void adicionarLivros(
      String nome, String autor, int paginas, int ano, int isbn) {
    listadeLivros.add({
      'nome': nome,
      'autor': autor,
      'paginas': paginas,
      'ano': ano,
      'isbn': isbn
    });
    print('$nome adicionado a lista!');
  }

  void removerLivros(String nome) {
    if (listadeLivros.isEmpty) {
      print('Essa lista está vazia!');
      return;
    }
    var procurandoLivro = listadeLivros.any((dados) => dados['nome'] == nome);
    if (procurandoLivro) {
      listadeLivros.removeWhere((dados) => dados['nome'] == nome);
      print('$nome foi removido da lista.');
    } else {
      print('$nome não está na lista.');
    }
  }

  void atualizarDadosLivros(String nome, String novoNome, String novoAutor,
      int novoPaginas, int novoAno, String novoIsbn) {
    if (listadeLivros.isEmpty) {
      print('Essa lista está vazia!');
      return;
    }
    for (var dado in listadeLivros) {
      if (dado['nome'] == nome) {
        dado['nome'] = novoNome;
        dado['autor'] = novoAutor;
        dado['paginas'] = novoPaginas;
        dado['ano'] = novoAno;
        dado['isbn'] = novoIsbn;
        print('Informações de $nome atualizadas');
        return;
        //tem o return para encerrar a execução quando uma condição específica é atendida.
        //Se não fosse encontrado, já sairia dessa função.
      } else {
        print('$nome não está na lista');
      }
    }
  }

  void reordenarLivros() {
    if (listadeLivros.isEmpty) {
      print('Essa lista está vazia!');
      return;
    }
    listadeLivros.shuffle();
    print('Os livros foram odernados aleatoriamente.');
  }

  void ordenarAlfabeticamente() {
    if (listadeLivros.isEmpty) {
      print('Essa lista está vazia!');
      return;
    }
    listadeLivros.sort((a, b) => a['nome'].compareTo(b['nome']));
    print('Os livros foram ordenados de forma alfabética.');
  }

  void mostrarLista() {
    if (listadeLivros.isEmpty) {
      print('Essa lista está vazia!');
      return;
    } else {
      print('Registro de livros:');
      for (var i = 0; i < listadeLivros.length; i++) {
        var dados = listadeLivros[i];
        print(
            '${i + 1} - Nome: ${dados['nome']}, Autor: ${dados['autor']}, Número de páginas: ${dados['paginas']} , Ano de publicação: ${dados['ano']}, ISBN: ${dados['isbn']}');
      }
    }
  }

  Map<String, dynamic>? buscaLivro(String nome) {
    var resultado = listadeLivros.firstWhere(
      (dados) => dados['nome'] == nome,
      orElse: () => {},
    );
    return resultado.isEmpty ? null : resultado;
  }
//Aqui o else vai retornar um mapa vazio, se for verdade vai ser null e se for falso, vai retornar o resultado do mapa.
}
