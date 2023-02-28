import 'package:flutter/material.dart';

class MessageScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Message'),
      ),
      body: const Center(
        child: Text(
          'Message Screen',
          style: TextStyle(fontSize: 30),
        ),
      ),
    );
  }
}