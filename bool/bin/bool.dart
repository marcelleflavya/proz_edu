//operações com tipo de dados booleano

import 'dart:convert';
import 'dart:io';

void main() {
  print('Digite o primeiro número:');
  int a = int.parse(stdin.readLineSync(encoding: utf8)!);

  print('Digite o segundo número:');
  int b = int.parse(stdin.readLineSync(encoding: utf8)!);

  bool igual = (a == b);
  bool aMaior = (a > b);
  //bool aMenor = (a < b);

  print(igual
      ? 'Os números são iguais'
      : aMaior
          ? 'a é maior que b'
          : 'a é menor que b');
}
