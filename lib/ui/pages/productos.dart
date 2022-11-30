import 'package:carrito_getx_02/domain/controller/controlcarrito.dart';
import 'package:carrito_getx_02/ui/pages/carrito.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Productos extends StatelessWidget {
  const Productos({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    ControlCompras controlc = Get.find();
    return Scaffold(
      appBar: AppBar(
        title: const Text('Listado de Productos'),
        actions: [
          IconButton(
              onPressed: () {
                Get.to(() => const Carrito());
              },
              icon: const Icon(Icons.shopping_cart)),
          IconButton(
              onPressed: () {}, icon: const Icon(Icons.exit_to_app_outlined))
        ],
      ),
      body: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              IconButton(
                  onPressed: () {
                    controlc.remArticulo();
                  },
                  icon: const Icon(Icons.remove_circle)),
              const Text('Mouse Optico'),
              IconButton(
                  onPressed: () {
                    controlc.addArticulo();
                  },
                  icon: const Icon(Icons.add_circle)),
              Obx(() => Text('${controlc.cantidad}'))
            ],
          )
        ],
      ),
    );
  }
}
