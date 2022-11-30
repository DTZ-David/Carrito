import 'package:get/get.dart';

class ControlCompras extends GetxController {
  final _producto = 0.obs;

  int get cantidad => _producto.value;

  void addArticulo() {
    _producto.value = _producto.value + 1;
  }

  void remArticulo() {
    _producto.value = _producto.value - 1;
  }
}
