import 'dart:convert';

import 'package:alquiler_autos/views/Login.dart';
import 'package:flutter/material.dart';
import 'package:alquiler_autos/views/menuPrincipal.dart';
import 'package:alquiler_autos/controller/cliente_clontroller.dart';

class register extends StatefulWidget {
  const register({super.key});

  @override
  State<register> createState() => _registerState();
}

class _registerState extends State<register> {
  final TextEditingController _nombreController = TextEditingController();
  final TextEditingController _correoController = TextEditingController();
  final TextEditingController _numLicController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _passwordControllervalida =
      TextEditingController();
  final ClienteService clienteService = ClienteService();

  void registrarCliente() async {
    // Get values from controllers
    final nombre = _nombreController.text;
    final correo = _correoController.text;
    final numLic = _numLicController.text;
    final password = _passwordController.text;
    final passwordvalida = _passwordControllervalida.text;

    if (nombre.isEmpty ||
        correo.isEmpty ||
        numLic.isEmpty ||
        password.isEmpty ||
        passwordvalida.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Por favor completa todos los campos')),
      );
      return;
    }

    if (password != passwordvalida) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Las contraseñas no coinciden')),
      );
      return;
    }

    try {
      final response = await clienteService.registrarCliente(
        nombre,
        correo,
        numLic,
        password,
      );
      print('Status code: ${response.statusCode}');
      print('Status body: ${response.body}');

      if (response.statusCode == 200 || response.statusCode == 201) {
        //Decode the response body to get the clienteId

        final responseData = jsonDecode(response.body);
        final clienteId = responseData['cliente']['id']; // Obtener el clienteId

        // Success message
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Registro exitoso')),
        );

        // Navigate to main menu with clienteId
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) =>
                Menuprincipal(clienteId: clienteId), // Pasar clienteId
          ),
        );
      } else {
        // Error message
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Error al registrar: ${response.body}')),
        );
      }
    } catch (e) {
      print('Error en el registro: $e');
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Error en la conexión con el servidor')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: const Color.fromARGB(255, 245, 237, 247),
        body: SingleChildScrollView(
          child: Padding(
              padding: const EdgeInsets.only(top: 100, left: 20, right: 20),
              child: Column(
                // mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Image.network(
                    "https://cdn.pixabay.com/photo/2020/01/28/20/28/car-4800932_640.png",
                    height: 150,
                    width: 250,
                  ),
                  const Text(
                    "Empecemos",
                    style: TextStyle(
                        color: Colors.pink,
                        fontSize: 30,
                        fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  const Text(
                    "Crea una nueva cuenta",
                    style: TextStyle(fontSize: 20),
                  ),
                  const SizedBox(height: 24.0),
                  TextField(
                    controller: _nombreController,
                    obscureText: true, // Para ocultar el texto
                    style: const TextStyle(
                      color: Colors.purple, // Color del texto
                      fontSize: 18, // Tamaño de la fuente
                    ),
                    decoration: InputDecoration(
                      labelText: 'Nombre completo', // Etiqueta del campo
                      labelStyle: const TextStyle(
                        color: Colors.pink, // Color de la etiqueta
                        fontWeight: FontWeight.bold, // Estilo de la etiqueta
                      ),
                      hintText: 'Ingresa tu nombre', // Texto de sugerencia
                      hintStyle: const TextStyle(
                        color: Colors.purple, // Color del texto de sugerencia
                      ),
                      border: OutlineInputBorder(
                        borderRadius:
                            BorderRadius.circular(12.0), // Bordes redondeados
                        borderSide: const BorderSide(
                            color: Colors.pink,
                            width: 2.0), // Color y grosor del borde
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12.0),
                        borderSide: const BorderSide(
                            color: Colors.purple,
                            width: 2.5), // Borde cuando el campo está enfocado
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12.0),
                        borderSide: const BorderSide(
                            color: Colors.pink,
                            width:
                                2.0), // Borde cuando el campo está habilitado pero no enfocado
                      ),
                      filled:
                          true, // Si quieres que el fondo del campo tenga color
                      fillColor: Colors.white, // Color de fondo del campo
                    ),
                  ),
                  const SizedBox(height: 16.0),
                  TextField(
                    controller: _correoController,
                    obscureText: true, // Para ocultar el texto
                    style: const TextStyle(
                      color: Colors.purple, // Color del texto
                      fontSize: 18, // Tamaño de la fuente
                    ),
                    decoration: InputDecoration(
                      labelText: 'Correo electronico', // Etiqueta del campo
                      labelStyle: const TextStyle(
                        color: Colors.pink, // Color de la etiqueta
                        fontWeight: FontWeight.bold, // Estilo de la etiqueta
                      ),
                      hintText: 'Ingresa tu correo', // Texto de sugerencia
                      hintStyle: const TextStyle(
                        color: Colors.pink, // Color del texto de sugerencia
                      ),
                      border: OutlineInputBorder(
                        borderRadius:
                            BorderRadius.circular(12.0), // Bordes redondeados
                        borderSide: const BorderSide(
                            color: Colors.pink,
                            width: 2.0), // Color y grosor del borde
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12.0),
                        borderSide: const BorderSide(
                            color: Colors.purple,
                            width: 2.5), // Borde cuando el campo está enfocado
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12.0),
                        borderSide: const BorderSide(
                            color: Colors.pink,
                            width:
                                2.0), // Borde cuando el campo está habilitado pero no enfocado
                      ),
                      filled:
                          true, // Si quieres que el fondo del campo tenga color
                      fillColor: Colors.white, // Color de fondo del campo
                    ),
                  ),

                  const SizedBox(height: 24.0),
                  TextField(
                    controller: _numLicController,
                    obscureText: true, // Para ocultar el texto
                    style: const TextStyle(
                      color: Colors.purple, // Color del texto
                      fontSize: 18, // Tamaño de la fuente
                    ),
                    decoration: InputDecoration(
                      labelText: 'Número de licencia', // Etiqueta del campo
                      labelStyle: const TextStyle(
                        color: Colors.pink, // Color de la etiqueta
                        fontWeight: FontWeight.bold, // Estilo de la etiqueta
                      ),
                      hintText: 'Ingresa tu número de licencia', // Texto de sugerencia
                      hintStyle: const TextStyle(
                        color: Colors.purple, // Color del texto de sugerencia
                      ),
                      border: OutlineInputBorder(
                        borderRadius:
                            BorderRadius.circular(12.0), // Bordes redondeados
                        borderSide: const BorderSide(
                            color: Colors.pink,
                            width: 2.0), // Color y grosor del borde
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12.0),
                        borderSide: const BorderSide(
                            color: Colors.purple,
                            width: 2.5), // Borde cuando el campo está enfocado
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12.0),
                        borderSide: const BorderSide(
                            color: Colors.pink,
                            width:
                                2.0), // Borde cuando el campo está habilitado pero no enfocado
                      ),
                      filled:
                          true, // Si quieres que el fondo del campo tenga color
                      fillColor: Colors.white, // Color de fondo del campo
                    ),
                  ),

                  const SizedBox(height: 16.0),
                  TextField(
                    // controller: _passwordController,
                    obscureText: true, // Para ocultar el texto
                    style: const TextStyle(
                      color: Colors.purple, // Color del texto
                      fontSize: 18, // Tamaño de la fuente
                    ),
                    decoration: InputDecoration(
                      labelText: 'Contraseña', // Etiqueta del campo
                      labelStyle: const TextStyle(
                        color: Colors.pink, // Color de la etiqueta
                        fontWeight: FontWeight.bold, // Estilo de la etiqueta
                      ),
                      hintText: 'Ingresa tu contraseña', // Texto de sugerencia
                      hintStyle: const TextStyle(
                        color: Colors.purple, // Color del texto de sugerencia
                      ),
                      border: OutlineInputBorder(
                        borderRadius:
                            BorderRadius.circular(12.0), // Bordes redondeados
                        borderSide: const BorderSide(
                            color: Colors.pink,
                            width: 2.0), // Color y grosor del borde
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12.0),
                        borderSide: const BorderSide(
                            color: Colors.purple,
                            width: 2.5), // Borde cuando el campo está enfocado
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12.0),
                        borderSide: const BorderSide(
                            color: Colors.pink,
                            width:
                                2.0), // Borde cuando el campo está habilitado pero no enfocado
                      ),
                      filled:
                          true, // Si quieres que el fondo del campo tenga color
                      fillColor: Colors.white, // Color de fondo del campo
                    ),
                  ),
                  const SizedBox(height: 16.0),
                  TextField(
                    controller: _passwordControllervalida,
                    obscureText: true, // Para ocultar el texto
                    style: const TextStyle(
                      color: Colors.purple, // Color del texto
                      fontSize: 18, // Tamaño de la fuente
                    ),
                    decoration: InputDecoration(
                      labelText: 'Confirma tu contraseña', // Etiqueta del campo
                      labelStyle: const TextStyle(
                        color: Colors.pink, // Color de la etiqueta
                        fontWeight: FontWeight.bold, // Estilo de la etiqueta
                      ),
                      hintText:
                          'Ingresa nuevamente tu contraseña', // Texto de sugerencia
                      hintStyle: const TextStyle(
                        color: Colors.purple, // Color del texto de sugerencia
                      ),
                      border: OutlineInputBorder(
                        borderRadius:
                            BorderRadius.circular(12.0), // Bordes redondeados
                        borderSide: const BorderSide(
                            color: Colors.pink,
                            width: 2.0), // Color y grosor del borde
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12.0),
                        borderSide: const BorderSide(
                            color: Colors.purple,
                            width: 2.5), // Borde cuando el campo está enfocado
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12.0),
                        borderSide: const BorderSide(
                            color: Colors.pink,
                            width:
                                2.0), // Borde cuando el campo está habilitado pero no enfocado
                      ),
                      filled:
                          true, // Si quieres que el fondo del campo tenga color
                      fillColor: Colors.white, // Color de fondo del campo
                    ),
                  ),
                  const SizedBox(height: 24.0),
                  ElevatedButton(
                      onPressed: registrarCliente,
                      style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.purple),
                      child: const Text(
                        "Registrarse",
                        style: TextStyle(color: Colors.white, fontSize: 20),
                      )),
                  const SizedBox(
                    height: 10,
                  ),
                  Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Text(
                            "¿Ya tienes una cuenta?",
                            style: TextStyle(fontSize: 16),
                          ),
                          const SizedBox(
                            width: 10,
                          ),
                          GestureDetector(
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => const login()));
                            },
                            child: (const Text(
                              "Iniciar sesión",
                              style: TextStyle(
                                  color: Colors.purple,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 18),
                            )),
                          ),
                        ],
                      ),
                    ],
                  )
                ],
              )),
        ));
  }
}
