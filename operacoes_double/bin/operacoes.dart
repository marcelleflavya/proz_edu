//Operações matemáticas usando double

import 'dart:convert';
import 'dart:io';

void main() {
  print('Digite o primeiro número:');
  double valor1 = double.parse(stdin.readLineSync(encoding: utf8)!);

  print('Digite o segundo número:');
  double valor2 = double.parse(stdin.readLineSync(encoding: utf8)!);

//Soma

  double soma = valor1 + valor2;

  print(' A soma é ${soma.toStringAsFixed(2)}');

//subtração

  double diferenca = valor1 - valor2;

  print(' A diferença é ${diferenca.toStringAsFixed(2)}');

//Multiplicação

  double resultado = valor1 * valor2;

  print(' O resultado é ${resultado.toStringAsFixed(2)}');

//Divisão

  double divisao = valor1 / valor2;

  print(' A divisão é ${divisao.toStringAsFixed(2)}');
}
