// Exercicios com string
//exibir apenas o primeiro e o ultimo nome.
//Nome completo do usuario deve ser no mínimo três nomes.

import 'dart:convert';
import 'dart:io';

void main() {
  print('Digite seu nome completo:');
  String nomeCompleto = stdin.readLineSync(encoding: utf8)!;

  int nomes = nomeCompleto.split(' ').length;

  if (nomes >= 3) {
    int primeiro = nomeCompleto.indexOf(' ');
    int ultimo = nomeCompleto.lastIndexOf(' ');

    String primeiroNome = nomeCompleto.substring(0, primeiro);
    String ultimoNome = nomeCompleto.substring(ultimo + 1); // o + 1 elimina o espaço antes do ultimo nome

    print(primeiroNome);
    print(ultimoNome);
  } else {
    print('Insira no minimo três nomes');
  }
}
