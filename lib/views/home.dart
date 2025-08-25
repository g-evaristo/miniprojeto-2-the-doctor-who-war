import 'dart:math';
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  final List<String> _batalha = [
    "dalek",
    "cybermen",
    "weepingangle",
  ];

  String _imagem = "tardis";

  void _jogador(String jogador) {
    int sorteio = Random().nextInt(3);

    switch (_batalha[sorteio]) {
      case "dalek":
        _imagem = "dalek_1";

        if (jogador == "cybermen") {
          setState(() {
            _resultadoBatalha = "SISTEMA VENCEU";
          });
        } else if (jogador == "weepingangle") {
          setState(() {
            _resultadoBatalha = "JOGADOR VENCEU";
          });
        } else {
          setState(() {
            _resultadoBatalha = "EMPATE";
          });
        }
        break;

      case "cybermen":
        _imagem = "cybermen_2";

        if (jogador == "weepingangle") {
          setState(() {
            _resultadoBatalha = "SISTEMA VENCEU";
          });
        } else if (jogador == "dalek") {
          setState(() {
            _resultadoBatalha = "JOGADOR VENCEU";
          });
        } else {
          setState(() {
            _resultadoBatalha = "EMPATE";
          });
        }

        break;
      case "weepingangle":
        _imagem = "weepingangle_3";

        if (jogador == "cybermen") {
          setState(() {
            _resultadoBatalha = "JOGADOR VENCEU";
          });
        } else if (jogador == "dalek") {
          setState(() {
            _resultadoBatalha = "SISTEMA VENCEU";
          });
        } else {
          setState(() {
            _resultadoBatalha = "EMPATE";
          });
        }

        break;
    }
  }

  final String _resultadoAleatorio = "Escolha um:";

  String _resultadoBatalha = "RESULTADO";

  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("The Doctor Who War",
              style: const TextStyle(fontSize: 50, fontFamily: 'DoctorWho')),
          backgroundColor: Color(0xFF283976),
          centerTitle: true,
        ),
        body: Container(
          width: double.infinity,
          color: Colors.white,
          padding: const EdgeInsets.all(40),
          child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Image.asset(
                  'img/$_imagem.png',
                ),
                Text(
                  _resultadoAleatorio,
                  style: const TextStyle(
                    fontSize: 20,
                    fontStyle: FontStyle.italic,
                    fontFamily: 'DoctorWho',
                    color: Colors.black,
                  ),
                  textAlign: TextAlign.justify,
                ),
                Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      GestureDetector(
                        onTap: () => _jogador("dalek"),
                        child: Image.asset(
                          'img/dalek_1.png',
                        ),
                      ),
                      GestureDetector(
                        onTap: () => _jogador("cybermen"),
                        child: Image.asset(
                          'img/cybermen_2.png',
                        ),
                      ),
                      GestureDetector(
                        onTap: () => _jogador("weepingangle"),
                        child: Image.asset(
                          'img/weepingangle_3.png',
                        ),
                      ),
                    ]),
                Text(
                  _resultadoBatalha,
                  style: const TextStyle(
                    fontSize: 20,
                    fontFamily: 'DoctorWho',
                    fontStyle: FontStyle.italic,
                    color: Colors.black,
                  ),
                  textAlign: TextAlign.justify,
                ),
              ]),
        ));
  }
}
