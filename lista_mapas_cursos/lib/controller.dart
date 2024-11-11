class Controller {
  List<Map<String, dynamic>> listaDeCursos = [];

  //List<Map<String, dynamic>> listaDeCursos ja é um atributo da classe, não precisa passar como parâmetro nas funções

  void adicionarDados(String nome, String turno, int cargaHoraria) {
    listaDeCursos
        .add({'nome': nome, 'turno': turno, 'cargaHoraria': cargaHoraria});
    print('$nome adicionado a lista');
  }

  void removerCurso(String nome) {
/*o removeWhere vai remover todos os itens dentro do parentese test, 
que no caso vai ser todos os dados relacionados ao nome que será igual ao nome(input) que o usuário irá passar.*/
    var procurandoCurso = listaDeCursos.any((dados) => dados['nome'] == nome);
    if (procurandoCurso) {
      listaDeCursos.removeWhere((dados) => dados['nome'] == nome);
      print('$nome foi removido com sucesso.');
    } else {
      print('$nome não está na lista.');
    }
  }

//Parâmetros passados para a atualização, removendo os antigos (turno, cargaHoraria) quando não estiver usando. Ja que se procura o curso pelo nome.
  void atualizarDados(
      String nome, String novoNome, String novoTurno, int novaCargaHoraria) {
    for (var dado in listaDeCursos) {
      if (dado['nome'] == nome) {
        dado['nome'] = novoNome;
        dado['turno'] = novoTurno;
        dado['cargaHoraria'] = novaCargaHoraria;
        print('Informações de $nome atualizadas');
        return;
      }
    }
    print('$nome não está na lista.');
  }

  void reordenarLista() {
    listaDeCursos.shuffle();
  }

  void ordenarAlfabeticamenteLista() {
    //sort() modifica a lista original e o compareTo acessa o nome do mapa a e o nome do mapa b, e retorna em ordem alfabetica.
    listaDeCursos.sort((a, b) => a['nome'].compareTo(b['nome']));
  }

  void mostrarLista() {
    if (listaDeCursos.isEmpty) {
      print('A lista de cursos está vazia.');
    } else {
      print('Registro de lista de cursos:');
      for (var i = 0; i < listaDeCursos.length; i++) {
        var dados = listaDeCursos[i];
        //${i + 1} representa  a posição. No caso, i começa em 0 e vai crescendo até chegar ao tamanho da lista. o ${i + 1} seria 0+1 que seria 1, o primeiro item da lista.
        print(
            '${i + 1} - Curso: ${dados['nome']}, ${dados['turno']}, ${dados['cargaHoraria']} horas');
      }
    }
  }
}
