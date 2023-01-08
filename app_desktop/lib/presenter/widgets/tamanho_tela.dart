import 'package:get/get.dart';

class TamanhoTela {

  static double altura = Get.mediaQuery.size.height;

  static double largura = Get.mediaQuery.size.width;

  /// Retorna uma porcentagem da altura conforme a [porcentagem] selecionada
  static double porcentagemAltura(double porcentagem) {
    return TamanhoTela.altura * porcentagem;
  }

  /// Retorna uma porcentagem da largura conforme a [porcentagem] selecionada
  static double porcentagemLargura(double porcentagem) {
    return TamanhoTela.largura * porcentagem;
  }

}