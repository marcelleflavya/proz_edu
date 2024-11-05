import 'dart:convert';
import 'dart:io';

class Controller {
  void questao1() {
    print('Digite o primeiro valor:');
    var num1 = stdin.readLineSync(encoding: utf8)!;
    double num1Double = double.parse(num1);

    print('Digite o segundo valor:');
    var num2 = stdin.readLineSync(encoding: utf8)!;
    double num2Double = double.parse(num2);

    // ABAIXO CADA BLOCO É UMA RESOLUÇAO PARA A QUESTÃO:

    //USANDO TERNÁRIO
    String result = (num1Double == num2Double)
        ? 'Os números não podem ser iguais'
        : (num1Double > num2Double)
            ? '$num1Double é maior'
            : '$num2Double é maior';
    print(result);

    //COMBINAÇÃO DE TERNÁRIO E IF/ELSE

    /*if (num1 != num2) {
    final result = (num1Double > num2Double);
    print(result ? '$num1Double é maior' : '$num2Double é maior ');
  } else {
    print('Os números não podem ser iguais');
  }*/

    // USANDO IF/ELSE

    /*if (num1 != num2) {
    if ((num1Double > num2Double)) {
      print('$num1Double é o maior número');
    } else if ((num1Double < num2Double)) {
      print('$num2Double é o maior valor');
    }
  } else {
    print('Os números não podem ser iguais');
  } 


OU


  if (num1Double == num2Double) {
    print('Os números não podem ser iguais');
  } else {
    if (num1Double > num2Double) {
      print('$num1Double é maior');
    } else {
      print('$num2Double é maior');
    }
  
  ;*/
  }

  void questao2() {
    print('Quantas maças deseja comprar?');
    int a = int.parse(stdin.readLineSync(encoding: utf8)!);

    var p1 = (a * 0.30).toStringAsFixed(2);
    var p2 = (a * 0.25).toStringAsFixed(2);

    /*if (a <= (12)) {
    print('O valor da compra é = $p1');
  } else {
    print('O valor da compra é = $p2');
  }*/

    var result = ((a < (12))
        ? 'O valor da compra é = $p1'
        : 'O valor da compra é = $p2');

    print('R\$ $result');
  }

  void questao3() {
    print('Digite a medida do primeiro lado:');
    int a = int.parse(stdin.readLineSync(encoding: utf8)!);

    print('Digite a medida do segundolado:');
    int b = int.parse(stdin.readLineSync(encoding: utf8)!);

    print('Digite a medida do terceiro lado:');
    int c = int.parse(stdin.readLineSync(encoding: utf8)!);

    String classif = (a == b && b == c)
        ? 'Equilátero'
        : (a == b || a == c || b == c)
            ? 'Isósceles'
            // : (a != b) && (b != c) && (c != a)
            : 'Escaleno';
    //: '';

    print(classif);

    /*if ((a == b) && (b == c)) {
    print('Equilátero');
  } else if ((a == b) || (a == c) || (b == c)) {
    print('Isosceles');
  } else if ((a != b) && (b != c) && (c != a)) {
    print('Escaleno');
  }*/
  }

  void questao4() {
    print('Digite o primeiro número:');
    int a = int.parse(stdin.readLineSync(encoding: utf8)!);
    print('Digite o segundo número:');
    int b = int.parse(stdin.readLineSync(encoding: utf8)!);
    print('Digite o terceiro número:');
    int c = int.parse(stdin.readLineSync(encoding: utf8)!);

    if ((a > b) && (a > c)) {
      print('$a é o maior número');
    }
    if ((b > a) && (b > c)) {
      print('$b é o maior número');
    }
    if ((c > a) && (c > b)) {
      print('$c é o maior número');
    }

    if (a < b && a < c) {
      print('$a é o menor número');
    }
    if (b < a && b < c) {
      print('$b é o menor número');
    }
    if (c < a && c < b) {
      print('$c é o menor número');
    }

//E
    /* int maior = a;
  if (b > maior) {
    maior = b;
  }
  if (c > maior) {
    maior = c;
  }

  int menor = a;
  if (b < menor) {
    menor = b;
  }
  if (c < menor) {
    menor = c;
  }

  print('$maior é o maior número');
  print('$menor é o menor número');*/
  }

  void questao5() {
    double totalA;
    double totalG;

    print('Digite o número de litros de álcool vendido:');

    double A = double.parse(stdin.readLineSync(encoding: utf8)!);

    A <= 20 ? totalA = A - (A * (3 / 100)) : totalA = A - (A * (5 / 100));

    /*if (A <= 20) {
    totalA = A - (A * (3 / 100));
  } else {
    totalA = A - (A * (5 / 100));
  }*/

    print('Digite a quantidade de gasolina vendida:');
    double G = double.parse(stdin.readLineSync(encoding: utf8)!);

    G <= 20 ? totalG = G - (G * (4 / 100)) : totalG = G - (G * (6 / 100));

    /* if (G <= 20) {
    totalG = G - (G * (4 / 100));
  } else {
    totalG = G - (G * (6 / 100));
  }*/

    print(totalA);
    print(totalG);

    double litrosVendidos = (totalA + totalG);

    print(
        'A quantidade de combustível vendido foi ${litrosVendidos.toStringAsFixed(2)}');
  }

  void questao6() {
    print('Digite um número de 1 a 12:');
    String numero = stdin.readLineSync(encoding: utf8)!;

    switch (numero) {
      case '1':
        {
          print('Janeiro');
          break;
        }

      case '2':
        {
          print('Fevereiro');
          break;
        }
      case '3':
        {
          print('Março');
          break;
        }
      case '4':
        {
          print('Abril');
          break;
        }
      case '5':
        {
          print('Maio');
          break;
        }
      case '6':
        {
          print('Junho');
          break;
        }
      case '7':
        {
          print('Julho');
          break;
        }
      case '8':
        {
          print('Agosto');
          break;
        }
      case '9':
        {
          print('Setembro');
          break;
        }
      case '10':
        {
          print('Outubro');
          break;
        }
      case '11':
        {
          print('Novembro');
          break;
        }
      case '12':
        {
          print('Dezembro');
          break;
        }
    }
  }

  void questao7() {
    print('Digite a altura da pessoa em metros:');
    double altura = double.parse(stdin.readLineSync(encoding: utf8)!);

    print('Digite o sexo da pessoa(M - Masculino ou F - Feminino):');
    String sexo = stdin.readLineSync(encoding: utf8)!;

    double resultado =
        (sexo == 'M') ? (72.7 * altura) - 58 : (62.1 * altura) - 44.7;

    print('${resultado.toStringAsFixed(2)}Kg');
  }

  void questao8() {
    int valorMinimo = 500;
    int valorIncremento = 100;
    int descontoMaximo = 25;

    print('Digite o valor da compra:');
    int valorCompra = int.parse(stdin.readLineSync(encoding: utf8)!);

    for (valorCompra = valorMinimo;; valorCompra += valorIncremento) {
      int desconto = (valorCompra - valorMinimo) ~/ valorIncremento + 1;
      if (desconto > descontoMaximo) {
        desconto = descontoMaximo;
      }
      double valorFinal = valorCompra * (1 - (desconto / 100));

      print(
          'R\$$valorCompra - $desconto% - R\$${valorFinal.toStringAsFixed(2)}');

      if (desconto == descontoMaximo) {
        break;
      }
    }
  }

  void questao9() {
    int contador = 0;
    int i = 1;
    do {
      print('Digite a idade:');
      int idade = int.parse(stdin.readLineSync(encoding: utf8)!);

      if (idade >= 18) {
        contador++;
      }

      i++;
    } while (i <= 10);

    print(
        'Quantidade de pessoas com idade maior ou igual a 18 anos é $contador');

    /* int contador = 0;

  for (int i = 1; i <= 10; i++) {
    stdout.write('Digite a idade da pessoa $i: ');
    int idade = int.parse(stdin.readLineSync()!);

    if (idade >= 18) {
      contador++;
    }
  }*/
  }

  void questao10() {
    int idade;
    int contador = 1;
    int grupo1 = 0;
    int grupo2 = 0;
    int grupo3 = 0;
    int grupo4 = 0;
    int grupo5 = 0;

    do {
      print('Digite a idade:');
      idade = int.parse(stdin.readLineSync(encoding: utf8)!);
      contador++;

      if (idade <= 15) {
        grupo1++;
      } else if (idade >= 16 && idade <= 30) {
        grupo2++;
      } else if (idade >= 31 && idade <= 45) {
        grupo3++;
      } else if (idade >= 46 && idade <= 60) {
        grupo4++;
      } else if (idade > 60) {
        grupo5++;
      }
    } while (contador <= 15);
    double porcentGrupo1 = (grupo1 / 15) * 100;
    double porcentGrupo5 = (grupo5 / 15) * 100;

    print('''\nA quantidade de pessoas:
        Até 15 anos: $grupo1 ,
        De 16 a 30 anos: $grupo2 , 
        De 31 a 45 anos: $grupo3  , 
        De 46 a 60 anos: $grupo4 , 
        Acima de 60 anos: $grupo5''');

    print(
        '''\nA porcentagem de pessoas na primeira e na última faixa etária com relação ao
total de pessoas é : ${porcentGrupo1.toStringAsFixed(2)}%
 e ${porcentGrupo5.toStringAsFixed(2)}%''');
  }

  void questao11() {
    print("Digite um número inteiro:");
    int? numero = int.parse(stdin.readLineSync()!);

    for (int i = 1; i <= numero; i++) {
      if (i % 2 == 0) {
        print("Números pares:$i");
      }
    }

    for (int i = 1; i <= numero; i++) {
      if (i % 2 != 0) {
        print("Números Ímpares:$i");
      }
    }
  }

  void questao12() {
    int soma = 0;
    int incremento = 0;
    int idade;

    do {
      print('Digite uma idade:');
      idade = int.parse(stdin.readLineSync(encoding: utf8)!);

      if (idade != 0) {
        soma += idade;
        incremento++;
      }
    } while (idade != 0);

    if (incremento > 0) {
      double media = soma / incremento;
      print('A meédia das idades é: ${media.toStringAsFixed(2)}');
    } else {
      print('Os valores não foram válidos para determinar a média');
    }
  }

  void questao13() {
    int soma = 0;

    for (int i = 1; i <= 500; i++) {
      if (i % 2 == 1 && i % 3 == 0) {
        soma += i;

        // soma += 1; soma o valor atual que está na variavel 'soma ' com o que estiver na i e armazena o resultado novamente em soma
      }
    }

    print(soma);
  }

  void questao14() {
    print('Digite um valor para A:');
    int A = int.parse(stdin.readLineSync(encoding: utf8)!);

    int resultado = 1;

    for (int i = A; i >= 1; i--) {
      resultado *= i;

/* resultado *= i multiplica o valor atual de resultado pelo valor de i e armazena o resultado novamente em resultado.


inicialização: resultado = 1
Iteração 1: 
1×5=5
1×5=5 → resultado = 5

Iteração 2: 
5×4=20
5×4=20 → resultado = 20

Iteração 3: 
20×3=60
20×3=60 → resultado = 60

Iteração 4: 
60×2=120
60×2=120 → resultado = 120

Iteração 5: 
120×1=120
120×1=120 → resultado = 120

No final, o valor acumulado em resultado é 120, que é o fatorial de 5 (5!).*/

      print(' = $resultado');
    }
  }

  void questao15() {
    print('Digite um número:');
    int numero = int.parse(stdin.readLineSync(encoding: utf8)!);

    int maior = numero;
    int menor = numero;

    for (int i = 2; i <= 15; i++) {
      print('Digite um número:');
      int numero = int.parse(stdin.readLineSync(encoding: utf8)!);

      if (numero > maior) {
        maior = numero;
      }

      if (numero < menor) {
        menor = numero;
      }
    }

    print('O maior número é: $maior');
    print('O menor número é: $menor');
  }
}
