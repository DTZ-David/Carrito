import 'package:carrito_getx_02/domain/controller/control_userf.dart';
import 'package:carrito_getx_02/domain/controller/controlcarrito.dart';
import 'package:carrito_getx_02/domain/controller/controlfirebase.dart';
import 'package:carrito_getx_02/domain/controller/controluser.dart';
import 'package:carrito_getx_02/ui/app.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  GetPlatform.isWeb
      ? await Firebase.initializeApp(
          options: const FirebaseOptions(
              apiKey: "AIzaSyBt7J0GzuX9COQ4P5QHSoPK5SOH5jGiQJE",
              authDomain: "carrito-f32a9.firebaseapp.com",
              projectId: "carrito-f32a9",
              storageBucket: "carrito-f32a9.appspot.com",
              messagingSenderId: "894959679047",
              appId: "1:894959679047:web:4dd7cf7ac7fe763fa9a362"))
      : await Firebase.initializeApp();
  Get.put(ControlCompras());
  Get.put(ControladorUser());
  Get.put(ControlAuthFirebase());
  Get.put(ConsultasController());

  runApp(const App());
}
