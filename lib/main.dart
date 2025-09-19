import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:jogo_da_velha/view/velha_view.dart';
import 'package:jogo_da_velha/view_model/velha_view_model.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (context) => VelhaViewModel(),
      child: MaterialApp(
        home: VelhaView(),
        debugShowCheckedModeBanner: false,
      ),
    ),
  );
}
