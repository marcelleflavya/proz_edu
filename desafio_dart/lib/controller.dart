import 'dart:convert';
import 'dart:io';
import 'package:desafio_dart/empresa.dart';
import 'package:desafio_dart/endereco.dart';
import 'package:desafio_dart/socio.dart';
import 'package:desafio_dart/sociopf.dart';
import 'package:desafio_dart/sociopj.dart';

class Controller {
  List<Empresa> informacoesEmpresas = [];

  Endereco cadastroEndereco() {
    print('Digite o logradouro:');
    String logradouro = stdin.readLineSync(encoding: utf8)!;
    int? numeroEndereco;
    while (true) {
      print('Digite o número do logradouro:');
      numeroEndereco = int.tryParse(stdin.readLineSync(encoding: utf8)!);
      if (numeroEndereco != null) {
        break;
      } else {
        print("Número inválido. Deve conter apenas dígitos numéricos.");
      }
    }
    print('Digite o bairro do logradouro:');
    String bairro = stdin.readLineSync(encoding: utf8)!;
    print('Digite a cidade:');
    String cidade = stdin.readLineSync(encoding: utf8)!;
    print('Digite o estado:');
    String estado = stdin.readLineSync(encoding: utf8)!;
    String cep;
    while (true) {
      print('Digite o CEP do Logradouro:');
      cep = stdin.readLineSync(encoding: utf8)!;
      String? cepFormatado = formatarCep(cep);
      if (cepFormatado != null) {
        cep = cepFormatado;
        break;
      }
    }
    return Endereco(
        logradouro: logradouro,
        numeroEndereco: numeroEndereco,
        bairro: bairro,
        cidade: cidade,
        estado: estado,
        cep: cep);
  }

  Sociopf cadastroSociopf() {
    print('Digite o nome do sócio:');
    String nome = stdin.readLineSync(encoding: utf8)!;
    String cpf;
    while (true) {
      print('Digite o CPF do sócio com apenas números:');
      cpf = stdin.readLineSync(encoding: utf8)!;
      if (cpf.length != 11 || int.tryParse(cpf) == null) {
        print('CPF inválido. Deve ter 11 dígitos numéricos.');
      } else {
        break;
      }
    }
    Endereco endereco = cadastroEndereco();
    return Sociopf(nome: nome, documento: cpf, endereco: endereco);
  }

  Sociopj cadastroSociopj() {
    print('Digite a razão social da sócio:');
    String razaoSocialSocio = stdin.readLineSync(encoding: utf8)!;
    print('Digite o nome fantasia do sócio:');
    String nomeFantasiaSocio = stdin.readLineSync(encoding: utf8)!;
    String cnpj;
    while (true) {
      print('Digite o CNPJ do sócio apenas números:');
      cnpj = stdin.readLineSync(encoding: utf8)!;
      if (cnpj.length != 14 || int.tryParse(cnpj) == null) {
        print('CNPJ inválido. Deve ter 14 dígitos numéricos.');
      } else {
        break;
      }
    }
    Endereco endereco = cadastroEndereco();
    return Sociopj(
        nomeFantasiaSocio: nomeFantasiaSocio,
        nome: razaoSocialSocio,
        documento: cnpj,
        endereco: endereco);
  }

  void cadastroEmpresa(String razaoSocial, String nomeFantasia, String cnpj,
      String telefone, Socio socio, Endereco endereco) {
    informacoesEmpresas.add(Empresa(
        razaoSocial: razaoSocial,
        nomeFantasia: nomeFantasia,
        cnpj: cnpj,
        telefone: telefone,
        socio: socio,
        endereco: endereco));
    print('Empresa cadastrada com sucesso!');
  }

  void buscarEmpresaCnpj(String cnpj) {
    final empresa = informacoesEmpresas.firstWhere(
      (empresa) => empresa.cnpj == cnpj,
      orElse: () => Empresa(
        razaoSocial: 'Não encontrada',
        nomeFantasia: 'Não encontrada',
        cnpj: 'Não encontrada',
        telefone: 'Não encontrada',
        socio: Socio(
          nome: 'Não encontrada',
          documento: 'Não encontrada',
          endereco: Endereco(
            logradouro: 'Não encontrada',
            numeroEndereco: 00,
            bairro: 'Não encontrada',
            cidade: 'Não encontrada',
            estado: 'Não encontrada',
            cep: 'Não encontrada',
          ),
        ),
        endereco: Endereco(
          logradouro: 'Não encontrada',
          numeroEndereco: 00,
          bairro: 'Não encontrada',
          cidade: 'Não encontrada',
          estado: 'Não encontrada',
          cep: 'Não encontrada',
        ),
      ),
    );
    if (empresa.cnpj == 'Não encontrada') {
      print('O CNPJ $cnpj não corresponde a nenhuma empresa listada.');
    } else {
      print('Empresa encontrada: ${empresa.razaoSocial}');
    }
  }

  void buscarEmpresaCpfCnpjSocio(String documento) {
    if (informacoesEmpresas.isEmpty) {
      print('A lista de empresas está vazia');
      return;
    }
    final empresa = informacoesEmpresas.firstWhere(
      (empresa) => empresa.socio.documento == documento,
      orElse: () => Empresa(
        razaoSocial: 'Não encontrada',
        nomeFantasia: 'Não encontrada',
        cnpj: 'Não encontrada',
        telefone: 'Não encontrada',
        socio: Socio(
          nome: 'Não encontrada',
          documento: 'Não encontrada',
          endereco: Endereco(
            logradouro: 'Não encontrada',
            numeroEndereco: 00,
            bairro: 'Não encontrada',
            cidade: 'Não encontrada',
            estado: 'Não encontrada',
            cep: 'Não encontrada',
          ),
        ),
        endereco: Endereco(
          logradouro: 'Não encontrada',
          numeroEndereco: 00,
          bairro: 'Não encontrada',
          cidade: 'Não encontrada',
          estado: 'Não encontrada',
          cep: 'Não encontrada',
        ),
      ),
    );
    if (empresa.socio.documento == 'Não encontrada') {
      print('O dados não correspondem a nenhum sócio registrado');
    } else {
      print('Empresa encontrada: ${empresa.razaoSocial}');
    }
  }

  void listarEmpresasOrdemAlfabetica() {
    if (informacoesEmpresas.isEmpty) {
      print('A lista de empresas está vazia');
      return;
    }
    informacoesEmpresas.sort((a, b) => a.razaoSocial.compareTo(b.razaoSocial));
    mostrarLista();
  }

  void excluirPorId(String id) {
    if (informacoesEmpresas.isEmpty) {
      print('A lista de empresas está vazia.');
      return;
    }
    final buscando = informacoesEmpresas.any((empresa) => empresa.id == id);
    if (buscando) {
      informacoesEmpresas.removeWhere((empresa) => empresa.id == id);
      print('Empresa com ID $id excluída da lista.');
    } else {
      print('Empresa com ID $id não encontrada.');
    }
  }

  String formatarSocio(Socio socio) {
    if (socio is Sociopf) {
      return '''
CPF: ${formatarCpf(socio.documento)}
Nome Completo: ${socio.nome}
Endereço: ${socio.endereco.logradouro}, ${socio.endereco.numeroEndereco}, ${socio.endereco.bairro}, ${socio.endereco.cidade}/${socio.endereco.estado}, ${socio.endereco.cep}
''';
    } else if (socio is Sociopj) {
      return '''
CNPJ: ${formatarCnpj(socio.documento)}
Razão Social: ${socio.nome}
Nome Fantasia: ${socio.nomeFantasiaSocio}
Endereço: ${socio.endereco.logradouro}, ${socio.endereco.numeroEndereco}, ${socio.endereco.bairro}, ${socio.endereco.cidade}/${socio.endereco.estado}, ${socio.endereco.cep}
''';
    }
    return 'Sócio desconhecido';
  }

  void mostrarLista() {
    if (informacoesEmpresas.isEmpty) {
      print('A lista de empresas está vazia.');
      return;
    }
    for (var empresa in informacoesEmpresas) {
      print('''
ID: ${empresa.id}
CNPJ:  ${formatarCnpj(empresa.cnpj)} Data Cadastro: ${empresa.date} 
Razão Social: ${empresa.razaoSocial}
Nome Fantasia: ${empresa.nomeFantasia}
Telefone: ${empresa.telefone}
Endereço: ${empresa.endereco.logradouro}, ${empresa.endereco.numeroEndereco}, ${empresa.endereco.bairro}, ${empresa.endereco.cidade}/${empresa.endereco.estado}, ${empresa.endereco.cep}
Sócio: 
${formatarSocio(empresa.socio)}
''');
    }
  }

  String? formatarTelefone(String telefone) {
    if (telefone.length != 11 || int.tryParse(telefone) == null) {
      print("Telefone inválido. Deve conter 11 dígitos numéricos.");
    } else {
      return "(${telefone.substring(0, 2)}) ${telefone.substring(2, 7)}-${telefone.substring(7, 11)}";
    }
    return null;
  }

  String? formatarCep(String cep) {
    if (cep.length != 8 || int.tryParse(cep) == null) {
      print("CEP inválido. Deve conter 8 dígitos numéricos.");
    } else {
      return "${cep.substring(0, 5)}-${cep.substring(5, 8)}";
    }
    return null;
  }

  String? formatarCnpj(String cnpj) {
    if (cnpj.length == 14 || int.tryParse(cnpj) != null) {
      return "${cnpj.substring(0, 2)}.${cnpj.substring(2, 5)}.${cnpj.substring(5, 8)}/${cnpj.substring(8, 12)}-${cnpj.substring(12, 14)}";
    }
    return null;
  }

  String? formatarCpf(String cpf) {
    if (cpf.length == 11 || int.tryParse(cpf) != null) {
      return "${cpf.substring(0, 3)}.${cpf.substring(3, 6)}.${cpf.substring(6, 9)}-${cpf.substring(9, 11)}";
    }
    return null;
  }
}
