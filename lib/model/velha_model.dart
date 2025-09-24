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

  bool? verificarGanhador(String jogadorQueFezAJogada) {
    //Verifica Linha
    for (int i = 0; i < 3; i++) {
      if (tabuleiro[i][0] == jogadorQueFezAJogada &&
          tabuleiro[i][1] == jogadorQueFezAJogada &&
          tabuleiro[i][2] == jogadorQueFezAJogada) {
        print('Ganhou Linha');
        //Se o jogador ganhou, retorne true
        return true;
      }
    }

    //Verifica Coluna
    for (int i = 0; i < 3; i++) {
      if (tabuleiro[0][i] == jogadorQueFezAJogada &&
          tabuleiro[1][i] == jogadorQueFezAJogada &&
          tabuleiro[2][i] == jogadorQueFezAJogada) {
        print('Ganhou Coluna');
        //Se o jogador ganhou, retorne true
        return true;
      }
    }

    //Verifica Diagonal 1
    for (int i = 0; i < 3; i++) {
      if (tabuleiro[0][0] == jogadorQueFezAJogada &&
          tabuleiro[1][1] == jogadorQueFezAJogada &&
          tabuleiro[2][2] == jogadorQueFezAJogada) {
        print('Ganhou Diagonal 1');
        //Se o jogador ganhou, retorne true
        return true;
      }
    }

    //Verifica Diagonal 2
    for (int i = 0; i < 3; i++) {
      if (tabuleiro[0][2] == jogadorQueFezAJogada &&
          tabuleiro[1][1] == jogadorQueFezAJogada &&
          tabuleiro[2][0] == jogadorQueFezAJogada) {
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
      String jogadorQueFezAJogada = jogadorAtual;
      if (jogadorAtual == 'X') {
        jogadorAtual = 'O';
      } else {
        jogadorAtual = 'X';
      }
      if (verificarGanhador(jogadorQueFezAJogada)!) {
        resultadoDoJogo = 'O JOGADOR ${jogadorQueFezAJogada} GANHOU!';
        jogoAtivo = false;
      } else if (verificarEmpate()) {
        resultadoDoJogo = 'JOGO EMPATADO!';
        jogoAtivo = false;
      } else {
        resultadoDoJogo = '';
      }
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
