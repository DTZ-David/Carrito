import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;

import '../../domain/models/user.dart';

class PeticionUser {
  static Future<List<User>> validarUser(String user, String passwd) async {
    var url = Uri.parse(
        "https://desarolloweb2021a.000webhostapp.com/APIMOVIL/listaruser.php");
    final response = await http.post(url, body: {'user': user, 'pass': passwd});
    return compute(convertir, response.body);
  }

  static List<User> convertir(String respuestabody) {
    final pasar = json.decode(respuestabody).cast<Map<String, dynamic>>();

    return pasar.map<User>((json) => User.desdeJson(json)).toList();
  }
}
