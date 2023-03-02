import 'package:flutter/material.dart';
import 'package:notificaciones/services/push_notifications_service.dart';
import 'package:notificaciones/screens/home_screen.dart';
import 'package:notificaciones/screens/message_screen.dart';

void main() async {
  //con WidgetsFlutterBinding.ensureInitialized(); esta linea nos aseguramos que primero se initialize todo,
  //antes que los widgets
  WidgetsFlutterBinding.ensureInitialized();
  await PushNotificationsService.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Material App',
      initialRoute: 'home',
      routes: {'home': (_) => HomeScreen(), 'message': (_) => MessageScreen()},
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Material App Bar'),
        ),
        body: const Center(
          child: Text('Hello World'),
        ),
      ),
    );
  }
}

/*Cambiamos nuestro ID de la aplicacion el com.example.notificaciones
  por com.rommelolachea.notificaciones */

/*El token del dispositivo nos sirve para identificarlo, y es unico,
y se puede generar cada vez que la aplicacion es instalada */
