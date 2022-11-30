import 'package:carrito_getx_02/data/services/peticionesUser.dart';
import 'package:get/get.dart';

import '../models/user.dart';

class ControladorUser extends GetxController {
  final Rxn<List<User>> _users = Rxn<List<User>>();

  List<User>? get user => _users.value;

  Future<void> enviarDatos(String u, String p) async {
    _users.value = await PeticionUser.validarUser(u, p);
  }
}
