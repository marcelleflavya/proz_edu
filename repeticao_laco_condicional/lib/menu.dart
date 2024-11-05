import 'dart:io';
import 'dart:convert';
import 'package:repeticao_laco_condicional/controller.dart';

class Menu {
  Controller controller = Controller();
  void iniciar() {
    String input;
    do {
      print('''Exercicícios de repetação e laço condicional
Digite a questão para ver o enunciado:
1 - Questão 1
2 - Questão 2
3 - Questão 3
4 - Questão 4
5 - Questão 5
6 - Questão 6
7 - Questão 7
8-  Questão 8
9 - Questão 9
10 - Questão 10
11 - Questão 11
12 - Questão 12
13 - Questão 13
14 - Questão 14
15 - Questão 15
0 - Sair
''');

      input = stdin.readLineSync(encoding: utf8)!;

      switch (input) {
        case '1':
          print(''' Escreva um programa para ler 2 valores
        (considere que não serão informados valores
        iguais) e escrever o maior deles.''');
          controller.questao1();
          break;
        case '2':
          print(
              '''As maçãs custam R\$0,30 cada se forem compradas menos do que uma dúzia,
        e R\$0,25 se forem compradas pelo menos doze.
        Escreva um programa que leia o número de maçãs compradas,
        calcule e escreva o valor total da compra.''');
          controller.questao2();
          break;
        case '3':
          print(
              '''Escreva um programa que leia as medidas dos lados de um triângulo
      e escreva se ele é Equilátero, Isósceles ou Escaleno.
      Sendo que: Triângulo Equilátero: possui os 3 ladosiguais.
      Triângulo Isóscele: possui 2 lados iguais.
      Triângulo Escaleno: possui 3 lados diferentes''');
          controller.questao3();
          break;
        case '4':
          print('''Faça um programa que leia três números,
      verifique (usando if e else) e mostre o maior e o menor deles''');
          controller.questao4();
          break;
        case '5':
          print(
              '''Um posto está vendendo combustíveis com a seguinte tabela de descontos:
      Álcool:\n
      • Até 20 litros: desconto de 3% por litro
      • Acima de 20 litros: Desconto de 5% por litro 99.
      Gasolina: 
      • Até 20 litros: desconto de 4% por litro
      • Acima de 20 litros, desconto de 6% por litro
      Escreva um algoritmo que leia o número de litros vendidos, o tipo de combustível (codificado
      da seguinte forma: A-álcool. G-gasolina), calcule e imprima o valor a ser pago pelo cliente.''');
          controller.questao5();
          break;
        case '6':
          print(
              '''Receba um número de 1 a 12 e imprima a qual mês aquele número corresponde no calendário''');
          Controller().questao6();
          break;
        case '7':
          print('''Tendo como dados de entrada a altura e o sexo de uma pessoa
      (M – Masculino ou F – Feminino),
      construa um algoritmo que calcule seu peso ideal, utilizando as seguinte fórmulas:
      a. Masculino: (72.7 * altura) – 58
      b. Feminino: (62.1 *altura) -44.7''');
          controller.questao7();
          break;
        case '8':
          print(
              '''Uma loja tem uma política de descontos de acordo com o valor da compra do
      cliente. Os descontos começam acima dos R\$500. A cada 100 reais acima dos R\$500,00
      o cliente ganha 1% de desconto cumulativo até 25%.
      a. Por exemplo: R\$500 = 1% || R\$600,00 = 2% ... etc...
      b. Faça um programa que exiba essa tabela de descontos no seguinte
      formato: Valordacompra – porcentagem de desconto – valor final''');
          controller.questao8();
          break;
        case '9':
          print(
              '''Faça um programa que receba a idade de dez pessoas e que calcule
             e mostre a quantidade de pessoas com idade maior ou igual a 18 anos.''');
          controller.questao9();
          break;
        case '10':
          print(
              '''Faça um programa que receba a idade de 15 pessoas e que calcule e mostre:
      a. A quantidade de pessoas em cada faixa etária\n
      b. A porcentagem de pessoas na primeira e na última faixa etária com relação ao total de pessoas
      • Até 15 anos
      • De 16 a 30 anos
      • De 31 a 45 anos
      • De 46 a 60 anos
      • Acima de 60 anos''');
          controller.questao10();
          break;
        case '11':
          print(
              '''Escreva um código que recebe um inteiro e mostra os números pares e ímpares
      (separados), de 1 até esse inteiro.''');
          controller.questao11();
          break;
        case '12':
          print(
              '''um programa que receba várias idades e que calcule e mostre a média das idades
      digitadas. Finalize digitando idade igual a zero.''');
          controller.questao12();
          break;
        case '13':
          print(
              '''Desenvolver um algoritmo que efetue a soma de todos os números ímpares que são
      múltiplos de três e que se encontram no conjunto dos números de 1 até 500.''');
          controller.questao13();
          break;
        case '14':
          print(
              ''''Escreva um algoritmo que leia um valor inicial A e imprima a seqüência de valores do
      cálculo de A! (lê-se : A fatorial)e o seu resultado. Ex: 5! = 5 X 4 X 3 X 2 X 1 = 120''');
          controller.questao14();
          break;
        case '15':
          print('15 números e mostre o maior e o menor dos números inseridos.');
          controller.questao15();
          break;
        case '0':
          print('Encerrando aplicação');
          break;
        default:
          print('Opção inválida, tente novamente!');
          break;
      }
    } while (input != '0');
  }
}
