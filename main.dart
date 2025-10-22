import 'package:flutter/material.dart';
import 'dart:math';

void main() {
  runApp(const MyApp());
}

// app principale
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Inferior Mind',
      theme: ThemeData(useMaterial3: true),
      home: const GamePage(),
    );
  }
}

class GamePage extends StatefulWidget {
  const GamePage({super.key});

  @override
  State<GamePage> createState() => _GamePageState();
}

class _GamePageState extends State<GamePage> {
  final List<Color> colorList = [
    Colors.grey,
    Colors.red,
    Colors.green,
    Colors.blue,
    Colors.yellow,
  ];

  List<int> scelta = [0, 0, 0, 0]; // scelta giocatore
  List<int> codiceSegreto = []; // codice segreto generato

  @override
  void initState() {
    super.initState();
    generaCodice(); // quando parte il gioco genera codice
  }

  void generaCodice() {
    final random = Random();
    codiceSegreto = List.generate(4, (_) => random.nextInt(4) + 1);
    // debug
    print("Codice segreto: $codiceSegreto");
  }

  void cambiaColore(int index) {
    setState(() {
      int nuovo = scelta[index] + 1;
      if (nuovo >= colorList.length) {
        nuovo = 0;
      }
      scelta[index] = nuovo;
    });
  }

  void controllaRisultato() {
    bool vinto = true;
    for (int i = 0; i < 4; i++) {
      if (scelta[i] != codiceSegreto[i]) {
        vinto = false;
        break;
      }
    }

    String titolo = vinto ? "Hai vinto " : "Sbagliato ";
    String messaggio = vinto
        ? "Hai indovinato tutto!"
        : "Non è giusto, riprova...";

    showDialog(
      context: context,
      builder: (ctx) {
        return AlertDialog(
          title: Text(titolo),
          content: Text(messaggio),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(ctx);
                setState(() {
                  scelta = [0, 0, 0, 0];
                  generaCodice();
                });
              },
              child: const Text("OK"),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Inferior Mind (versione semplificata)"),
        centerTitle: true,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text(
            "Cerca di indovinare il codice segreto!",
            style: TextStyle(fontSize: 18),
          ),
          const SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: List.generate(4, (i) {
              return Padding(
                padding: const EdgeInsets.all(6.0),
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: colorList[scelta[i]],
                    minimumSize: const Size(55, 55),
                    shape: const CircleBorder(),
                  ),
                  onPressed: () => cambiaColore(i),
                  child: null,
                ),
              );
            }),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: controllaRisultato,
        child: const Icon(Icons.check),
      ),
    );
  }
}
