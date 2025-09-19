import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:jogo_da_velha/view_model/velha_view_model.dart';

class VelhaView extends StatelessWidget {
  VelhaView({super.key});

  List<String> grade = ['X', 'X', 'X', 'O', 'O', 'O', 'X', 'O', 'X'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //Cor de Fundo
      backgroundColor: Colors.white,

      //Jogador da Vez
      body: Column(
        children: [
          Expanded(
            flex: 1,
            child: Container(
              alignment: Alignment.bottomCenter,
              padding: EdgeInsets.all(20),
              child: Text(
                'Jogador da vez: X',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                ),
              ),
            ),
          ),

          //Grade
          Expanded(
            flex: 5,
            child: GridView.count(
              crossAxisCount: 3,
              crossAxisSpacing: 5,
              mainAxisSpacing: 10,
              padding: EdgeInsets.all(10),
              children: grade.map((item) {
                return Container(
                  color: Colors.purple,
                  width: 2,
                  height: 2,
                  child: Center(
                    child: Text(
                      item,
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 40,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                );
              }).toList(),
            ),
          ),

          Expanded(
            flex: 1,
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(backgroundColor: Colors.purple),
              onPressed: () {},
              child: Text(
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
