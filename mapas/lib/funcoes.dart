import 'dart:convert';
import 'dart:io';

void menu(){
  Map<String, Map<String, dynamic>> estoque = {};
   String input;

  do {
    print('''Sistema de estoque: Escolha uma opção:
  1 - Adicionar produto
  2 - Atualizar quantidade
  3 - Exibir estoque
  0 - Sair''');

    input = stdin.readLineSync(encoding: utf8)!;
    switch (input) {
      case '1':
        print('Digite o nome do produto:');
        String nome = stdin.readLineSync(encoding: utf8)!;
        print('Digite o preço do produto:');
        double preco = double.parse(stdin.readLineSync(encoding: utf8)!);
        print('Digite quantas unidades esse produtos tem:');
        int quantidade = int.parse(stdin.readLineSync(encoding: utf8)!);
        adicionarProduto(estoque, nome, preco, quantidade);
        break;
      case '2':
        print('Digite qual produto deseja atualizar:');
        String nome = stdin.readLineSync(encoding: utf8)!;
        if (!estoque.containsKey(nome)) {
          print('Produto não encontrado no estoque.');
          break;
        }
        print('Digite a nova quantidade:');
        int novaQuantidade = int.parse(stdin.readLineSync(encoding: utf8)!);
        atualizarQuantidade(estoque, nome, novaQuantidade);
        break;
      case '3':
        exibirEstoque(estoque);
        break;
      case '0':
        print('Encerrando aplicação');
        break;
      default:
        print('Opção inválida, tente novamente.');
    }
  } while (input != '0');
}



void adicionarProduto(Map<String, Map<String, dynamic>> estoque, String nome,
    double preco, int quantidade) {
  estoque.addAll({
    nome: {'preco': preco, 'quantidade': quantidade}
  });
   print('Produto $nome adicionado com sucesso.');
}

void atualizarQuantidade(Map<String, Map<String, dynamic>> estoque, String nome,
    int novaQuantidade) {
  estoque.update(nome, (input) {
    input['quantidade'] = novaQuantidade;
    return input;
  });
   print('Quantidade do produto $nome atualizada com sucesso.');
}

void exibirEstoque(Map<String, Map<String, dynamic>> estoque) {
if (estoque.isEmpty) {
    print('Estoque vazio.');
  } else {
    estoque.forEach((nome, dados) {
      print('Produto: $nome, Preço: R\$${dados['preco']}, Quantidade: ${dados['quantidade']}');
    });
  }
}

