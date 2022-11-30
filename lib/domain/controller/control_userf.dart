import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:firebase_auth/firebase_auth.dart';

class ControlAuthFirebase extends GetxController {
  final FirebaseAuth authf = FirebaseAuth.instance;

  final Rx<dynamic> _uid = "".obs;
  final Rx<dynamic> _usuarior = "Sin Registro".obs;

  String get emailf => _usuarior.value;
  String get uid => _uid.value;
  Future<void> registrarEmail(String u, String p) async {
    try {
      UserCredential usuario =
          await authf.createUserWithEmailAndPassword(email: u, password: p);
      _uid.value = usuario.user!.uid;
      _usuarior.value = usuario.user!.email;
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        return Future.error('The password provided is too weak');
      } else if (e.code == 'email-already-in-use') {
        return Future.error('The account already exists for that email.');
      }
    }
  }

  Future<void> iniciarSesion(String u, String p) async {
    try {
      UserCredential usuario =
          await authf.signInWithEmailAndPassword(email: u, password: p);
      _uid.value = usuario.user!.uid;
      _usuarior.value = usuario.user!.email;
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        return Future.error('Usuario no existe');
      } else if (e.code == 'wrong-password') {
        return Future.error('Contraseña incorrecta');
      }
    }
  }
}
