class Controller {
  List<String> listaDeCategorias = [];

  void adicionarCategoria(List<String> listaDeCategorias, String nome) {
    listaDeCategorias.add(nome);
  }

  bool buscarCategoria(List<String> listaDeCategorias, String nome) {
    return listaDeCategorias.contains(nome);
  }

  void excluirCategoria(List<String> listaDeCategorias, String nome) {
    listaDeCategorias.remove(nome);
  }

  void registroCategoria(List<String> listaDeCategorias) {
    if (listaDeCategorias.isEmpty) {
      print('Lista está vazia');
    } else {
      listaDeCategorias.forEach(print);
    }
  }
}
