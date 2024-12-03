import 'dart:convert';
import 'dart:io';
import 'package:desafio_dart/controller.dart';
import 'package:desafio_dart/endereco.dart';
import 'package:desafio_dart/socio.dart';

class Menu {
  Controller controller = Controller();

  void iniciar() {
    String input;

    do {
      print('''Digite uma opção:
1 - Cadastrar uma nova empresa;
2 - Buscar Empresa cadastrada por CNPJ;
3 - Buscar Empresa por CPF/CNPJ do Sócio;
4 - Listar Empresas cadastradas em ordem alfabética (baseado na Razão Social);
5 - Excluir uma empresa (por ID);
0 - Sair.''');

      input = stdin.readLineSync(encoding: utf8)!;

      switch (input) {
        case '1':
          _escolherSocio();
          break;
        case '2':
          _buscarEmpresaCnpj();
          break;
        case '3':
          _buscarEmpresaCpfCnpjSocio();
          break;
        case '4':
          controller.listarEmpresasOrdemAlfabetica();
          break;
        case '5':
          _excluirporId();
          break;
        case '0':
          print('Encerrando aplicação.');
          break;
        default:
          print('Opção inválida, tente novamente.');
          break;
      }
    } while (input != '0');
  }

  _escolherSocio() {
    print('Digite 1 para Sócio Pessoa Física ou 2 para Sócio Pessoa jurídica:');
    String escolherSocio = stdin.readLineSync(encoding: utf8)!;
    Socio socio;
    if (escolherSocio == '1') {
      socio = controller.cadastroSociopf();
    } else {
      socio = controller.cadastroSociopj();
    }
    _cadastroEmpresa(socio);
  }

  _cadastroEmpresa(Socio socio) {
    print('Digite a razão social da empresa:');
    String razaoSocial = stdin.readLineSync(encoding: utf8)!;
    print('Digite o nome fantasia da empresa:');
    String nomeFantasia = stdin.readLineSync(encoding: utf8)!;
    String cnpj;
    while (true) {
      print('Digite o CNPJ de empresa apenas números:');
      cnpj = stdin.readLineSync(encoding: utf8)!;
      if (cnpj.length != 14 || int.tryParse(cnpj) == null) {
        print('CNPJ inválido. Deve ter 14 dígitos numéricos.');
      } else {
        break;
      }
    }
    String telefone;
    while (true) {
      print('Digite o telefone da empresa com apenas números:');
      telefone = stdin.readLineSync(encoding: utf8)!;
      String? formatarTelefone = controller.formatarTelefone(telefone);
      if (formatarTelefone != null) {
        telefone = formatarTelefone;
        break;
      }
    }
    Endereco endereco = controller.cadastroEndereco();
    controller.cadastroEmpresa(
        razaoSocial, nomeFantasia, cnpj, telefone, socio, endereco);
  }

  _buscarEmpresaCnpj() {
    if (controller.informacoesEmpresas.isEmpty) {
      print('A lista está vazia.');
      return;
    }
    print('Digite o CNPJ da empresa com apenas números:');
    String cnpj = stdin.readLineSync(encoding: utf8)!;
    controller.buscarEmpresaCnpj(cnpj);
  }

  void _buscarEmpresaCpfCnpjSocio() {
    if (controller.informacoesEmpresas.isEmpty) {
      print('A lista está vazia.');
      return;
    }
    print('Digite o documento do sócio com apenas números:');
    String documento = stdin.readLineSync(encoding: utf8)!;
    controller.buscarEmpresaCpfCnpjSocio(documento);
  }

  void _excluirporId() {
    if (controller.informacoesEmpresas.isEmpty) {
      print('A lista está vazia.');
      return;
    }
    print('Digite o ID da empresa:');
    String id = stdin.readLineSync(encoding: utf8)!;
    controller.excluirPorId(id);
  }
}
