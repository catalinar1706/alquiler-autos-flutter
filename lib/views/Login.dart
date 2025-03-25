import 'package:flutter/material.dart';
import 'package:alquiler_autos/views/menuPrincipal.dart';
import 'package:alquiler_autos/controller/cliente_clontroller.dart';
import 'package:alquiler_autos/views/register.dart';

class login extends StatefulWidget {
  const login({super.key});

  @override
  State<login> createState() => _loginState();
}

class _loginState extends State<login> {
  final TextEditingController _correoController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final ClienteService clienteService = ClienteService();

  void iniciarSesion() async {
    final correo = _correoController.text;
    final password = _passwordController.text;

    final result = await clienteService.loginCliente(correo, password);

    if (result['success'] && result.containsKey('cliente')) {
      final clienteId = result['cliente']?['id'];

      // Verificar que el usuario tenga datos validos antes de iniciar sesion
      ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Inicio de sesión exitoso')));

      Future.delayed(const Duration(seconds: 1), () {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
              builder: (context) => Menuprincipal(clienteId: clienteId)),
        );
      });
    } else {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          content: Text(result['message'] ?? 'Credenciales incorrectas')));
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
                  "Bienvenido",
                  style: TextStyle(
                      color: Colors.pink,
                      fontSize: 30,
                      fontWeight: FontWeight.bold),
                ),
                const Text(
                  "Inicia sesión para continuar",
                  style: TextStyle(fontSize: 20),
                ),
                const SizedBox(height: 24.0),
                TextField(
                  controller: _correoController,
                  obscureText: true, // Para ocultar el texto
                  style: const TextStyle(
                    color: Colors.pink, // Color del texto
                    fontSize: 18, // Tamaño de la fuente
                  ),
                  decoration: InputDecoration(
                    labelText: 'Correo', // Etiqueta del campo
                    labelStyle: const TextStyle(
                      color: Colors.pink, // Color de la etiqueta
                      fontWeight: FontWeight.bold, // Estilo de la etiqueta
                    ),
                    hintText: 'Ingresa tu correo', // Texto de sugerencia
                    hintStyle: const TextStyle(
                      color: Colors.purple, // Color del texto de sugerencia
                    ),
                    border: OutlineInputBorder(
                      borderRadius:
                          BorderRadius.circular(12.0), // Bordes redondeados
                      borderSide: const BorderSide(
                          color: Colors.purple,
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
                    color: Colors.pink, // Color del texto
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
                          color: Colors.purple,
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
                      iniciarSesion();
                    },
                    style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.purple),
                    child: const Text(
                      "Iniciar sesion",
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
                          "¿Olvidaste tu contraseña?",
                          style: TextStyle(fontSize: 16),
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        GestureDetector(
                          onTap: () {
                            // Navigator.push(
                            //     context,
                            //     MaterialPageRoute(
                            //         builder: (context) => Menuprincipal()));
                          },
                          child: (const Text(
                            "Recuperar",
                            style: TextStyle(
                                color: Colors.purple,
                                fontWeight: FontWeight.bold,
                                fontSize: 18),
                          )),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text(
                          "¿No tienes una cuenta?",
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
                                    builder: (context) => const register()));
                          },
                          child: (const Text(
                            "Registrate",
                            style: TextStyle(
                                color: Colors.purple,
                                fontWeight: FontWeight.bold,
                                fontSize: 18),
                          )),
                        )
                      ],
                    ),
                  ],
                )
              ],
            )),
      ),
    );
  }
}
