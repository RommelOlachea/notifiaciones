import 'package:flutter/material.dart';

class MessageScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    //obtenemos los argumentos cuando se navega a esta pantalla
    final args = ModalRoute.of(context)?.settings.arguments ?? 'No data';

    return Scaffold(
      appBar: AppBar(
        title: const Text('Message'),
      ),
      body: Center(
        child: Text(
          '$args',
          style: TextStyle(fontSize: 30),
        ),
      ),
    );
  }
}
