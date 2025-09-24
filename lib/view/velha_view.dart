import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:jogo_da_velha/view_model/velha_view_model.dart';

class VelhaView extends StatelessWidget {
  const VelhaView({super.key});

  @override
  Widget build(BuildContext context) {
    // Ouve as mudanças no VelhaViewModel
    final viewModel = Provider.of<VelhaViewModel>(context);

    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: [
          // Jogador da Vez
          Expanded(
            flex: 1,
            child: Container(
              alignment: Alignment.bottomCenter,
              padding: const EdgeInsets.all(20),
              child: Text(
                'Jogador da vez: ${viewModel.jogadorAtual}',
                textAlign: TextAlign.center,
                style: const TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                ),
              ),
            ),
          ),

          // Tabuleiro
          Expanded(
            flex: 5,
            child: GridView.builder(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3,
                crossAxisSpacing: 5,
                mainAxisSpacing: 10,
              ),
              padding: const EdgeInsets.all(10),
              itemCount: 9,
              itemBuilder: (context, index) {
                int linhaJogada = index ~/ 3;
                int colunaJogada = index % 3;

                return InkWell(
                  onTap: () {
                    // Chama a função do ViewModel com a jogada
                    viewModel.fazerJogada(linhaJogada, colunaJogada);
                  },
                  child: Container(
                    color: Colors.purple,
                    child: Center(
                      child: Text(
                        viewModel.tabuleiro[linhaJogada][colunaJogada],
                        textAlign: TextAlign.center,
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 40,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                );
              },
            ),
          ),

          // Resultado do Jogo
          Expanded(
            flex: 1,
            child: Container(
              alignment: Alignment.bottomCenter,
              padding: const EdgeInsets.all(20),
              child: Text(
                viewModel.resultadoDoJogo ??
                    'Ganhador', // Usa o valor do ViewModel
                textAlign: TextAlign.center,
                style: const TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                ),
              ),
            ),
          ),

          // Botão Reset
          Expanded(
            flex: 1,
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(backgroundColor: Colors.purple),
              onPressed: () {
                viewModel.resetarJogo(); // Chama a função de reset do ViewModel
              },
              child: const Text(
                'Reset',
                textAlign: TextAlign.center,
                style: TextStyle(color: Colors.white),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
