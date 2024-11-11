class Controller {
  List<Map<String, dynamic>> listaDeSeries = [];

  void adicionarSerie(String nome, String genero, int ano) {
    listaDeSeries.add({'nome': nome, 'genero': genero, 'ano': ano});
    print('$nome adicionado com sucesso!');
  }

  void mostrarSerie() {
    if (listaDeSeries.isEmpty) {
      print('A lista está vazia!');
    } else {
      print('Registro das séries:');
      for (var i = 0; i < listaDeSeries.length; i++) {
        var dados = listaDeSeries[i];

        print(
            '${1 + 1} - Série: ${dados['nome']}, ${dados['genero']}, ${dados['ano']}');
      }
    }
  }
}
