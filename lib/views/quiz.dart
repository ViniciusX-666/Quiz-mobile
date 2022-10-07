import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:quis/views/resultado.dart';
import '../quiz_dados.dart';

class Quiz extends StatefulWidget {
  // Quiz({super .key }):super(key: key);

  @override
  State<Quiz> createState() => _QuizState();
}

class _QuizState extends State<Quiz> {
  int perguntaNumero = 1;
  int acertos = 0;
  int erros = 0;

  @override
  Widget build(BuildContext context) {
    //quiz.shuffle(); //embaralha as perguntas

    quiz.forEach((elemento) {
      int alternativaCorreta = elemento['alternativa_correta'];
      List respostas = elemento['respostas'];

      String respostaCorreta = elemento['respostas'][alternativaCorreta - 1];

      respostas.shuffle();
      int i = 1;
      //pegar a resposta correta
      respostas.forEach((elemento) {
        if (elemento == respostaCorreta) {
          alternativaCorreta = i;
        }
        i++;
      });
      elemento['alternativa_correta'] = alternativaCorreta;
    });

    // quiz.add({
    //   "pergunta": "O Flutter é?",
    //   "respostas": [
    //     "Uma linguagem",
    //     "Um aplicativo",
    //     "Um SDK",
    //     "Um notebook",
    //   ],
    //   "alternativa_correta": 3
    // });
    // for(int i = 3;i<=20;i++){
    //   quiz.add([
    //     "pergunta": "Pergunta $i",
    //     "respostas":[
    //       "Resposta 1",
    //       "Resposta 2",
    //       "Resposta 3",
    //       "Resposta 4",
    //     ],
    //     "alternativa_correta":1,
    //   ]);
    // }

    void respondeu(int respostaNumero) {
      setState(() {
        if (quiz[perguntaNumero - 1]['alternativa_correta'] == respostaNumero) {
          print('Acertou');
          acertos++;
        } else {
          print('Errou');
          erros++;
        }
        print('acertos totais: $acertos | erros totais: $erros');

        if (perguntaNumero == 10) {
          print('Terminou o Quiz');
          Navigator.pushNamed(context, 'resultado',
              arguments: Argumentos(acertos));
        } else {
          perguntaNumero++;
        }
      });
    }

    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Quiz Curso de Flutter'),
        ),
        body: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Align(
                  alignment: Alignment.topRight,
                  child: Text(
                    'Pergunta de $perguntaNumero a 10',
                    style: TextStyle(fontSize: 20),
                  ),
                ),
                Text(
                  'Pergunta: \n' + quiz[perguntaNumero - 1]['pergunta'],
                  style: TextStyle(fontSize: 20),
                ),
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () {
                      print('pressionado1');
                      respondeu(1);
                    },
                    child: Text(
                      quiz[perguntaNumero - 1]['respostas'][0],
                      style: TextStyle(fontSize: 20),
                    ),
                    style: ElevatedButton.styleFrom(
                      padding: EdgeInsets.fromLTRB(100, 20, 100, 20),
                    ),
                  ),
                ),
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () {
                      print('pressionado2');
                      respondeu(2);
                    },
                    child: Text(
                      quiz[perguntaNumero - 1]['respostas'][1],
                      style: TextStyle(fontSize: 20),
                    ),
                    style: ElevatedButton.styleFrom(
                      padding: EdgeInsets.fromLTRB(100, 20, 100, 20),
                    ),
                  ),
                ),
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () {
                      print('pressionado3');
                      respondeu(3);
                    },
                    child: Text(
                      quiz[perguntaNumero - 1]['respostas'][2],
                      style: TextStyle(fontSize: 15),
                    ),
                    style: ElevatedButton.styleFrom(
                      padding: EdgeInsets.fromLTRB(100, 20, 100, 20),
                    ),
                  ),
                ),
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () {
                      print('pressionado4');
                      respondeu(4);
                    },
                    child: Text(
                      quiz[perguntaNumero - 1]['respostas'][3],
                      style: TextStyle(fontSize: 20),
                    ),
                    style: ElevatedButton.styleFrom(
                      padding: EdgeInsets.fromLTRB(100, 20, 100, 20),
                    ),
                  ),
                ),
              ]),
        ),
      ),
    );
  }
}
