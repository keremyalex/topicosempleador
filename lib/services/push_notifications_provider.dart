
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class PushNotificationsProvider {
  final _storage = new FlutterSecureStorage();
  FirebaseMessaging _firebaseMessaging = FirebaseMessaging();


  initNotifications() {
    _firebaseMessaging.requestNotificationPermissions();

    _firebaseMessaging.getToken().then((token) async{
      print('=====TOKEN====');
      print(token);

      await _storage.write(
                          key: 'tokenPush', value: token);

      //fvj1wTxTRSyFcJPEZvzGms:APA91bH9RbYifM0ZB2XbnllUN7_kmz1OHyvb-Vn0FYSSWxY6JyXI03eq0LSBr8cXpK6HkUn9umc14aiiXJPCg0SNKhxSFu9gB806_Ocz6109ytXopDHydsED-OhbhZ1lZKAFmKmM3XFN
      //fBsw4dp4SZij9v8oq2ybSm:APA91bGm5-HxWbUL7ZrqKnSBqMtphb1CA0WPYxYP1RyOhCzvQ0BqUvJ8dEvBCiMf7PGJKeNimeIUO-IOF9bk8iJYDMWQpS6ReCK0HEuB7QqDhm5EqeyLaGTb4PcN3Jh83hRxRgaOh4aC
    });

    _firebaseMessaging.configure(onMessage: (info) {
      print('====== ON MESSAGE =====');
      print(info);

    }, onLaunch: (info) {
      print('====== ON LAUNCH =====');
      print(info);
    }, onResume: (info) {
      print('====== ON RESUME =====');
      print(info);
      // final notificacion = info['data']['comida'];
      // _mensajesStreamController.sink.add(notificacion);
    });
  }

  // dispose() {
  //   _mensajesStreamController?.close();
  // }
}
