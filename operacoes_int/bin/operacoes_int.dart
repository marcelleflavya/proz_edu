//Operações matemáticas usando int
import 'dart:convert';
import 'dart:io';

void main() {
  print('Digite o primeiro número:');
  int a = int.parse(stdin.readLineSync(encoding: utf8)!);

  print('Digite o segundo número:');
  int b = int.parse(stdin.readLineSync(encoding: utf8)!);

  if (a != b) {
    //Soma
    int soma = a + b;
    print('A soma é $soma e o tipo é ${soma.runtimeType}');

    //Subtração
    int diferenca = a - b;
    print('A diferença é $diferenca e o tipo é ${diferenca.runtimeType}');

    //Multiplicação
    int resultado = a * b;
    print('A multiplicação é $resultado e o tipo é ${resultado.runtimeType}');

    //Média
    int media = ((a + b) / 2).toInt();
    print('A média é $media e o tipo é ${media.runtimeType}');
  } else {
    print('Os números devem ser diferentes');
  }
}
