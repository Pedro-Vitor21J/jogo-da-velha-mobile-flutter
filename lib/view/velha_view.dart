import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:jogo_da_velha/view_model/velha_view_model.dart';

class VelhaView extends StatelessWidget {
  const VelhaView({super.key});

  @override
  Widget build(BuildContext context) {
    final viewModel = Provider.of<VelhaViewModel>(context);

    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          // Jogador da Vez
          Padding(
            padding: const EdgeInsets.only(top: 20.0, bottom: 20.0),
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

          // Tabuleiro
          Expanded(
            child: GridView.builder(
              shrinkWrap: true,
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
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 50),
            child: Text(
              viewModel.resultadoDoJogo ?? '',
              textAlign: TextAlign.center,
              style: const TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.bold,
                fontSize: 20,
              ),
            ),
          ),

          // Botão Reset
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.purple,
              fixedSize: const Size(150, 50),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
            ),
            onPressed: () {
              viewModel.resetarJogo();
            },
            child: const Text(
              'Reset',
              textAlign: TextAlign.center,
              style: TextStyle(color: Colors.white, fontSize: 18),
            ),
          ),
          const SizedBox(height: 30),
        ],
      ),
    );
  }
}
