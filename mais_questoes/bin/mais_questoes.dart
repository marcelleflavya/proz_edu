import 'dart:convert';
import 'dart:io';

void main() {
  exercicio1();
  exercicio2();
  exercicio3();
  exercicio4();
}

void exercicio1() {
  // Escreva um programa para ler as coordenadas (x,y) de pontos no sistema cartesiano. Escreva o quadrante a que ele pertence.
  print(' Digite o valor para x:');
  double x = double.parse(stdin.readLineSync(encoding: utf8)!);
  print('Digite o valor para y:');
  double y = double.parse(stdin.readLineSync(encoding: utf8)!);

  if (x > 0 && y > 0) {
    print('Primeiro quadrante');
  } else if (x < 0 && y > 0) {
    print('Segundo quadrante');
  } else if (x < 0 && y < 0) {
    print('Terceiro quadrante');
  } else if (x > 0 && y < 0) {
    print('Quarto quadrante');
  }
}

void exercicio2() {
  //Identificar qual o desconto de acordo com quem está comprando usando swicth case
  print('''Selecione o cliente
  1 - cliente comum
  2 - funcionário
  3 - vip
  0 - sair''');
  String menu = stdin.readLineSync(encoding: utf8)!;

  print('Digite o valor da compra:');
  double valor = double.parse(stdin.readLineSync(encoding: utf8)!);

  switch (menu) {
    case '1':
      print('O valor total é  R\$${valor.toStringAsFixed(2)}');
      break;
    case '2':
      double resultadoF = valor - (valor * (10 / 100));
      print('O valor com desconto é R\$${resultadoF.toStringAsFixed(2)}');
      break;
    case '3':
      double resultadoV = valor - (valor * (5 / 100));
      print('O valor com desconto é R\$${resultadoV.toStringAsFixed(2)}');
      break;
    case '4':
      print('Operação encerrada');
      break;
  }
}

void exercicio3() {
  //Escreva um código que recebeum inteiro e mostra os números pares e ímpares, de 1até esse inteiro recebido.
  print('Digite um número inteiro:');
  int n = int.parse(stdin.readLineSync(encoding: utf8)!);

  for (int i = 1; i <= n; i++) {
    if (i % 2 == 0) {
      print('$i é par');
    } else {
      print('$i é impar');
    }
  }
}

void exercicio4() {
  int a = 3;
  int b = 8;

  // resul1 = 0;  a == b
  // resul2 = 1; // (a > b)
  // resul3 =-1; // (a < b)

  int x = a.compareTo(b);
  print(x);

  String c = 'AB'; //Aqui ele conta o número de letras para poder comparar
  String d = 'ABC';
  print(c.compareTo(d));
}
