/* Com base nos exercicios de operações matemáticas,
crie um menu onde o usuário poderá selecionar qual operação ele deseja realizar,
e para cada situação execute o algorítimo necessário para realizar cada uma das operações.
Use while ou do while*/

import 'dart:convert';
import 'dart:io';

void main() {
  String input;
  int a = 0;
  int b = 0;

  void pergunta() {
    print('Digite o primeiro número:');
    a = int.parse(stdin.readLineSync(encoding: utf8)!);

    print('Digite o segundo número:');
    b = int.parse(stdin.readLineSync(encoding: utf8)!);
  }

  do {
    print('''Digite o número correspondente a operação que deseja realizar:
  1 - soma
  2 - subtração
  3 - multiplicação
  4 - divisão
  5 - média
  0 - sair
  ''');
    input = stdin.readLineSync(encoding: utf8)!;

    switch (input) {
      case '1':
        pergunta();
        int soma = a + b;
        print('A soma é ${soma.toStringAsFixed(2)}');
        break;
      case '2':
        pergunta();
        int diferenca = a - b;
        print('A subtração é ${diferenca.toStringAsFixed(2)}');
        break;
      case '3':
        pergunta();
        int resultado = a * b;
        print('A multiplicação é ${resultado.toStringAsFixed(2)}');
        break;
      case '4':
        pergunta();
        int divisao = (a / b).toInt();
        print('A divisão é ${divisao.toStringAsFixed(2)}');
        break;
      case '5':
        pergunta();
        int media = ((a + b) / 2).toInt();
        print('A média é ${media.toStringAsFixed(2)}');
        break;
      case '0':
        print('Encerrando a aplicação!');
        break;
    }
  } while (input != '0');
}
