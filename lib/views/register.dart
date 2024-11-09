import 'package:alquiler_autos/views/Login.dart';
import 'package:flutter/material.dart';
import 'package:alquiler_autos/views/menuPrincipal.dart';

class register extends StatefulWidget {
  const register({super.key});

  @override
  State<register> createState() => _registerState();
}

class _registerState extends State<register> {
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
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
                    // controller: _passwordController,
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
                    controller: _passwordController,
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
                    // controller: _passwordController,
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
                      onPressed: () {
                        // print("email: ${_emailController.text} ");
                        // print("password: ${_passwordController.text} ");
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const Menuprincipal()));
                      },
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
                                      builder: (context) => login()));
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
