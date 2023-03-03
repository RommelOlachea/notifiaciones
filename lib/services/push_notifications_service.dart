//3A:B6:B5:F1:D3:19:F9:9C:05:19:06:4A:32:B0:E7:9B:67:16:79:CE

import 'dart:async';

import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';

class PushNotificationsService {
  static FirebaseMessaging messaging = FirebaseMessaging.instance;
  static String? token;
  //el streamController nos permitira estar escuchando desde la
  //pantalla del home (o las pantallas)
  static StreamController<String> _messageStream =
      new StreamController.broadcast();

  //suscribimos el stream para poder estar escuchandolo
  static Stream<String> get messagesStream => _messageStream.stream;

  //cuando la aplicacion esta en el background, funcion personal
  static Future _backgroundHandler(RemoteMessage message) async {
    // print('background Handler ${message.messageId}');
    print(message.data);
    _messageStream.add(message.notification?.title ?? 'No title');
  }

  //cuando la aplicacion esta abierta
  static Future _onMessageHandler(RemoteMessage message) async {
    // print('onMessage Handler ${message.messageId}');
    print(message.data);
    _messageStream.add(message.notification?.body ?? 'No body');
  }

  static Future _onMessageOpenHandler(RemoteMessage message) async {
    print(message.data);
    print('onMessageOpenApp Handler ${message.messageId}');
  }

  static Future initializeApp() async {
    //push notitications
    await Firebase.initializeApp(); //inicializamos firebase
    token = await FirebaseMessaging.instance.getToken(); //obtenemos el token
    print('El token es: ${token}');

    //HANDLERS
    //cuando la aplicacion esta en el background
    FirebaseMessaging.onBackgroundMessage(_backgroundHandler);
    //cuando la aplicacion esta abierta
    FirebaseMessaging.onMessage.listen(_onMessageHandler);
    //cuando la aplicacion esta cerrada y llega la notificacion
    FirebaseMessaging.onMessageOpenedApp.listen(_onMessageOpenHandler);

    //local notifications
  }

  static closeStream() {
    _messageStream.close();
  }
}
