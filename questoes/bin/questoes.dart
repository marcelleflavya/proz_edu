import 'dart:convert';
import 'dart:io';
import 'dart:math';

void main() {
  print('''Digite qual questão deseja:
  1 - Conversão de temperatura
  2 - Calculo de Imc
  3 - Conversão de tempo
  0 - sair''');

  String menu = stdin.readLineSync(encoding: utf8)!;

  switch (menu) {
    case '1':
      print('Digite a temperatura em celsius:');
      double tempCelsius = double.parse(stdin.readLineSync(encoding: utf8)!);
      double resultado = ((9 * tempCelsius) + 160 / 5);
      //formula dada no exercicio. Existe outra.
      print('O resultado da operação é ${resultado}°F');
      break;
    case '2':
      print('Digite o peso em kg:');
      double peso = double.parse(stdin.readLineSync(encoding: utf8)!);
      print('Digite a altura em m:');
      double altura = double.parse(stdin.readLineSync(encoding: utf8)!);
      double alturaM = altura / 100;
      double imc = peso / pow(alturaM, 2);
      print('O resultado da operação é ${imc.toStringAsFixed(2)}');
      break;
    case '3':
      print('Digite um tempo em minutos:');
      int minutos = int.parse(stdin.readLineSync(encoding: utf8)!);
      //Converter para dias, horas e minutos. Um dia tem 1440 minutos, e 1 hora tem 60 minutos.
      int dias = minutos ~/ 1440;
      //a parte inteira revela os dias
      int resto = minutos % 1440;
      int hora = resto ~/ 60;
      // cada hora tem 60 minutos
      int minuto = minutos % 60;
      print(
          'O resultado da operação é $dias dias, $hora horas e $minuto minutos.');
      break;
    case '0':
      print('Operação encerrada!');
      break;
  }
}
