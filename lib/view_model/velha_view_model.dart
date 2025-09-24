import 'package:flutter/material.dart';
import 'package:jogo_da_velha/model/velha_model.dart';

class VelhaViewModel extends ChangeNotifier {
  final VelhaModel _velhaModel = VelhaModel(
    tabuleiro: [
      ['', '', ''],
      ['', '', ''],
      ['', '', ''],
    ],
    jogadorAtual: 'X',
    linhaJogada: -1,
    colunaJogada: -1,
  );

  String get jogadorAtual => _velhaModel.jogadorAtual;
  List<List<String>> get tabuleiro => _velhaModel.tabuleiro;
  String? get resultadoDoJogo => _velhaModel.resultadoDoJogo;
  bool get jogoAtivo => _velhaModel.jogoAtivo;

  void fazerJogada(int linha, int coluna) {
    if (_velhaModel.tabuleiro[linha][coluna].isEmpty) {
      _velhaModel.linhaJogada = linha;
      _velhaModel.colunaJogada = coluna;
      _velhaModel.jogoDaVelha();
      notifyListeners();
    }
  }

  void resetarJogo() {
    _velhaModel.resetarJogo();
    notifyListeners();
  }
}
