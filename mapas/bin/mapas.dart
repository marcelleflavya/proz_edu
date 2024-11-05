/*Exercício: faça perguntas ao usuario Sistema de Estoque Simples
Crie um sistema simples de estoque usando mapas. Imagine que você tem uma loja e precisa controlar a quantidade de produtos e seus preços. Faça o seguinte:
Crie um mapa onde a chave seja o nome do produto (como String) e o valor seja outro mapa contendo:
preco (um número double)
quantidade (um número int que representa a quantidade em estoque)

Exemplo inicial de estrutura do mapa:

dart
Copiar código
{
  'camiseta': {'preco': 29.90, 'quantidade': 10},
  'calça': {'preco': 59.90, 'quantidade': 5},
}
Implemente as funções:

adicionarProduto(String nome, double preco, int quantidade): para adicionar um novo produto ao estoque.
atualizarQuantidade(String nome, int novaQuantidade): para atualizar a quantidade de um produto existente.
exibirEstoque(): para imprimir todos os produtos com seus preços e quantidades.
Teste o sistema:

Adicione alguns produtos ao estoque.
Atualize a quantidade de um produto existente.
Exiba o estoque final para verificar se tudo está funcionando corretamente.
Dica:
Essa estrutura é útil para simular uma pequena aplicação de controle de inventário e te ajudará a entender como trabalhar com mapas e funções no Dart.

Boa prática!*/

import 'package:mapas/funcoes.dart';

void main() {
  menu();
}
