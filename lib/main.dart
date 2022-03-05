import 'package:flutter/material.dart';
import 'package:flutter_plate_reader_example/recognize_controller.dart';
import 'package:get/get.dart';

void main() {
  runApp(const App());
}

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const Home(),
    );
  }
}

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<RecognizeController>(
      init: RecognizeController(),
      builder: (r) {
        return Scaffold(
          appBar: AppBar(
            title: const Text('Recognize Example'),
          ),
          body: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  r.textsOcr.isEmpty
                      ? "Apronte a câmera para a placa e toque para capturar"
                      : r.textsOcr.first.value.toString(),
                  style: const TextStyle(fontSize: 18),
                  textAlign: TextAlign.center,
                ),
              ],
            ),
          ),
          floatingActionButton: FloatingActionButton(
            onPressed: () => r.read(),
            tooltip: 'Ler',
            child: const Icon(Icons.read_more),
          ), // This trailing comma makes auto-formatting nicer for build methods.
        );
      },
    );
  }
}
