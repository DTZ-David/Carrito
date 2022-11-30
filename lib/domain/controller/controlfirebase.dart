import 'package:get/get.dart';

import '../../data/services/peticionesFirebase.dart';
import '../models/articles.dart';

class ConsultasController extends GetxController {
  final Rxn<List<Articulo>> _articuloFirestore = Rxn<List<Articulo>>();

  Future<void> consultaArticulos() async {
    _articuloFirestore.value = await PeticionesArticulo.consultarGral();
  }

  List<Articulo>? get getArticulosGral => _articuloFirestore.value;
}
