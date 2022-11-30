import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../domain/controller/control_userf.dart';

class Loginf extends StatefulWidget {
  const Loginf({Key? key}) : super(key: key);

  @override
  State<Loginf> createState() => _LoginfState();
}

class _LoginfState extends State<Loginf> {
  TextEditingController controluser = TextEditingController();
  TextEditingController controlpassw = TextEditingController();
  ControlAuthFirebase controlu = Get.find();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const CircleAvatar(
                radius: 70,
                backgroundImage: NetworkImage(
                    "https://www.elheraldo.co/sites/default/files/articulo/2021/01/04/471_anos_de_valledupar.jpg"),
              ),
              TextField(
                controller: controluser,
                decoration:
                    const InputDecoration(labelText: 'Ingrese el Usuario'),
              ),
              TextField(
                controller: controlpassw,
                obscureText: true,
                decoration:
                    const InputDecoration(labelText: 'Ingrese la Contraseña'),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  //Login
                  IconButton(
                    onPressed: () {
                      controlu
                          .iniciarSesion(controluser.text, controlpassw.text)
                          .then((value) {
                        if (controlu.emailf != 'Sin Registro') {
                          Get.offAllNamed('/listararticulos');
                        } else {
                          Get.showSnackbar(const GetSnackBar(
                            title: 'Validacion de Usuarios',
                            message: 'Error desde logica',
                            icon: Icon(Icons.warning),
                            duration: Duration(seconds: 5),
                            backgroundColor: Colors.red,
                          ));
                        }
                      }).catchError((e) {
                        Get.showSnackbar(const GetSnackBar(
                          title: 'Validacion de Usuarios',
                          message: 'Error de creacion',
                          icon: Icon(Icons.warning),
                          duration: Duration(seconds: 5),
                          backgroundColor: Colors.red,
                        ));
                      });
                    },
                    icon: const Icon(Icons.login),
                  ),

                  const SizedBox(
                    width: 20,
                  ),
                  //Registro
                  IconButton(
                      onPressed: () {
                        controlu
                            .registrarEmail(controluser.text, controlpassw.text)
                            .then((value) {
                          if (controlu.emailf != 'Sin Registro') {
                            Get.offAllNamed('/listararticulos');
                          } else {
                            Get.showSnackbar(const GetSnackBar(
                              title: 'Validacion de Usuarios',
                              message: 'Datos Invalidos',
                              icon: Icon(Icons.warning),
                              duration: Duration(seconds: 5),
                              backgroundColor: Colors.red,
                            ));
                          }
                        }).catchError((e) {
                          Get.showSnackbar(const GetSnackBar(
                            title: 'Validacion de Usuarios',
                            message: 'Datos Invalidos',
                            icon: Icon(Icons.warning),
                            duration: Duration(seconds: 5),
                            backgroundColor: Colors.red,
                          ));
                        });
                      },
                      icon: const Icon(Icons.app_registration)),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
