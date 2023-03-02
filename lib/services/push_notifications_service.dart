//3A:B6:B5:F1:D3:19:F9:9C:05:19:06:4A:32:B0:E7:9B:67:16:79:CE

import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';

class PushNotificationsService {
  static FirebaseMessaging messaging = FirebaseMessaging.instance;
  static String? token;

  static Future initializeApp() async {
    //push notitications
    await Firebase.initializeApp(); //inicializamos firebase
    token = await FirebaseMessaging.instance.getToken(); //obtenemos el token
    print(token);
    //local notifications
  }
}
