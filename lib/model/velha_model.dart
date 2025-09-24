class VelhaModel {
  List<List<String>> tabuleiro = [
    ['', '', ''],
    ['', '', ''],
    ['', '', ''],
  ];
  //Para lembrar: tabuleiro[linha][coluna]

  String jogadorAtual = 'X';
  bool jogoAtivo = true;
  int linhaJogada = -1;
  int colunaJogada = -1;
  String resultadoDoJogo = '';

  VelhaModel({
    required this.tabuleiro,
    required this.jogadorAtual,
    required this.linhaJogada,
    required this.colunaJogada,
  });

  void adicionarJogadaNoTabuleiro() {
    tabuleiro[linhaJogada][colunaJogada] = jogadorAtual;
  }

  bool? verificarGanhador(String jogadorAtual) {
    //Verifica Linha
    for (int i = 0; i < 3; i++) {
      if (tabuleiro[i][0] == jogadorAtual &&
          tabuleiro[i][1] == jogadorAtual &&
          tabuleiro[i][2] == jogadorAtual) {
        print('Ganhou Linha');
        //Se o jogador ganhou, retorne true
        return true;
      }
    }

    //Verifica Coluna
    for (int i = 0; i < 3; i++) {
      if (tabuleiro[0][i] == jogadorAtual &&
          tabuleiro[1][i] == jogadorAtual &&
          tabuleiro[2][i] == jogadorAtual) {
        print('Ganhou Coluna');
        //Se o jogador ganhou, retorne true
        return true;
      }
    }

    //Verifica Diagonal 1
    for (int i = 0; i < 3; i++) {
      if (tabuleiro[0][0] == jogadorAtual &&
          tabuleiro[1][1] == jogadorAtual &&
          tabuleiro[2][2] == jogadorAtual) {
        print('Ganhou Diagonal 1');
        //Se o jogador ganhou, retorne true
        return true;
      }
    }

    //Verifica Diagonal 2
    for (int i = 0; i < 3; i++) {
      if (tabuleiro[0][2] == jogadorAtual &&
          tabuleiro[1][1] == jogadorAtual &&
          tabuleiro[2][0] == jogadorAtual) {
        print('Ganhou Diagonal 2');
        //Se o jogador ganhou, retorne true
        return true;
      }
    }

    //Se não houve ganhador, retorne false
    return false;
  }

  bool verificarEmpate() {
    for (final linha in tabuleiro) {
      for (final coluna in linha) {
        if (coluna == ' ' || coluna == '') {
          //Se não houve empate, retorne falso
          return false;
        }
      }
    }
    //Se houve empate, retorne verdadeiro
    return true;
  }

  String? jogoDaVelha() {
    if (tabuleiro[linhaJogada][colunaJogada].isEmpty) {
      tabuleiro[linhaJogada][colunaJogada] = jogadorAtual;
      final jogadorQueFezAJogada = jogadorAtual;
      if (jogadorAtual == 'X') {
        jogadorAtual = 'O';
      } else {
        jogadorAtual = 'X';
      }
      if (verificarGanhador(jogadorQueFezAJogada)!) {
        jogoAtivo = false;
        resultadoDoJogo = 'O JOGADOR ${jogadorQueFezAJogada} GANHOU!';
      } else if (verificarEmpate()) {
        jogoAtivo = false;
        resultadoDoJogo = 'JOGO EMPATADO!';
      } else {
        resultadoDoJogo = '';
      }
    } else {
      resultadoDoJogo = 'POSIÇÃO OCUPADA!';
    }
    return resultadoDoJogo;
  }

  void resetarJogo() {
    tabuleiro = [
      ['', '', ''],
      ['', '', ''],
      ['', '', ''],
    ];
    jogadorAtual = 'X';
    jogoAtivo = true;
    linhaJogada = -1;
    colunaJogada = -1;
    resultadoDoJogo = '';
  }

}
