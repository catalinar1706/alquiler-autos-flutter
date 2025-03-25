import 'package:alquiler_autos/views/detallesVehiculo.dart';
import 'package:alquiler_autos/controller/autos_controller.dart';
import 'package:flutter/material.dart';
import 'package:async/async.dart';

class Menuprincipal extends StatefulWidget {
  final int clienteId;
  Menuprincipal({required this.clienteId});

  @override
  State<Menuprincipal> createState() => _MenuprincipalState();
}

class _MenuprincipalState extends State<Menuprincipal> {
  final AutosController autosController = AutosController();
  List<Map<String, dynamic>> listaDeAutos = [];
  bool isLoading = true;
  CancelableOperation? _autosOperation; // Operación cancelable

  @override
  void initState() {
    super.initState();
    cargarAutos();
  }

  @override
  void dispose() {
    _autosOperation?.cancel(); // Cancela la operación al descartar el widget
    super.dispose();
  }

  void cargarAutos() async {
    try {
      final autos = await autosController.obtenerAutosDisponibles();
      if (mounted) {
        // Verificar si el widget está montado
        setState(() {
          listaDeAutos = autos;
          isLoading = false;
        });
      }
    } catch (e) {
      if (mounted) {
        // Verificar si el widget está montado
        setState(() {
          isLoading = false;
        });
      }
      print('Error al cargar autos: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.purple[100],
        title: const Text(
          "Alquiler de autos",
          style: TextStyle(color: Colors.purple),
        ),
      ),
      drawer: Drawer(
        backgroundColor: Colors.purple[300],
        child: Column(
          children: [
            const SizedBox(
              height: 80,
            ),
            Image.network(
              "https://images.vexels.com/content/135118/preview/flat-user-sign-with-round-background-492cda.png",
              width: 150,
              height: 150,
            ),
            const SizedBox(
              height: 10,
            ),
            const Text(
              "Nombre de usuario",
              style: TextStyle(
                color: Colors.white,
                fontSize: 20,
              ),
            ),
            const Text(
              "correo@ejemplo.com",
              style: TextStyle(color: Colors.white),
            ),
            const SizedBox(
              height: 30,
            ),
            const Divider(),
            ListTile(
              title: Text(
                "Número de licencia",
                style: TextStyle(color: Colors.grey[300]),
              ),
              subtitle: Text(
                "1026789972",
                style: TextStyle(color: Colors.grey[300]),
              ),
              leading: const Icon(Icons.badge_rounded),
              iconColor: Colors.grey[300],
              onTap: () {
                // Navigator.push(context,
                //     MaterialPageRoute(builder: (context) => const Sobremi()));
              },
            ),
            const Divider(),
            ListTile(
              title: Text(
                "Cambiar contraseña",
                style: TextStyle(color: Colors.grey[300]),
              ),
              leading: const Icon(Icons.lock),
              iconColor: Colors.grey[300],
              onTap: () {},
            ),
            const Divider(),
            ListTile(
              title: Text(
                "Revisar alquileres",
                style: TextStyle(color: Colors.grey[300]),
              ),
              leading: const Icon(Icons.search),
              iconColor: Colors.grey[300],
              onTap: () {},
            ),
          ],
        ),
      ),
      body: Column(
        children: [
          const SizedBox(
            height: 16,
          ),
          Padding(
            padding: const EdgeInsets.all(
                5.0), // Espaciado alrededor del campo de texto
            child: TextField(
              decoration: InputDecoration(
                filled: true, // Relleno de color de fondo
                fillColor: Colors.pink[100], // Color de fondo
                prefixIcon: const Icon(
                  Icons.search, // Ícono de búsqueda
                  color: Colors.white, // Color del ícono
                ),
                hintText: "Buscar vehiculo", // Texto sugerido
                hintStyle: const TextStyle(
                  color: Colors.white, // Color del texto sugerido
                ),
                border: OutlineInputBorder(
                  borderRadius:
                      BorderRadius.circular(12.0), // Bordes redondeados
                  borderSide: BorderSide.none, // Sin borde visible
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12.0),
                  borderSide: const BorderSide(color: Colors.purple, width: 2),
                ),
              ),
            ),
          ),
          Expanded(
            child: isLoading
                ? const Center(child: CircularProgressIndicator())
                : listaDeAutos.isEmpty
                    ? const Center(child: Text('No hay autos disponibles'))
                    : ListView.builder(
                        itemCount: listaDeAutos.length,
                        itemBuilder: (BuildContext context, int index) {
                          return Card(
                            color: Colors.purple[100],
                            margin: const EdgeInsets.symmetric(
                              horizontal: 10,
                              vertical: 5,
                            ),
                            child: ListTile(
                              title: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    '${listaDeAutos[index]['marca']} ${listaDeAutos[index]['modelo']}',
                                    style: const TextStyle(
                                      color: Colors.purple,
                                      fontSize: 20,
                                    ),
                                  ),
                                  const SizedBox(height: 5),
                                  Row(
                                    children: [
                                      Text(
                                        'Año ${listaDeAutos[index]['anio']} -',
                                        style: const TextStyle(
                                          color: Colors.white,
                                          fontSize: 14,
                                        ),
                                      ),
                                      Text(
                                        '${listaDeAutos[index]['precio']}',
                                        style: const TextStyle(
                                          color: Colors.white,
                                          fontSize: 14,
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                              leading: Image.network(
                                listaDeAutos[index][
                                    'imageUrl'], // Usa la URL de la imagen del auto
                                width: 60,
                                height: 30,
                                fit: BoxFit.contain,
                              ),
                              trailing: const Icon(
                                Icons.arrow_forward_ios,
                                color: Colors.white,
                              ),
                              onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => DetalleVehiculoScreen(
                                      clienteId: widget.clienteId,
                                      imageUrl: listaDeAutos[index]['imageUrl'],
                                      marca: listaDeAutos[index]['marca'],
                                      modelo: listaDeAutos[index]['modelo'],
                                      anio: listaDeAutos[index]['anio'],
                                      disponibilidad: listaDeAutos[index]
                                          ['disponibilidad'],
                                      autoId: listaDeAutos[index]['id'],
                                    ),
                                  ),
                                );
                              },
                            ),
                          );
                        },
                      ),
          ),
        ],
      ),
      backgroundColor: Colors.grey[200],
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.purple[100],
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(
              Icons.home,
              color: Colors.pink,
            ),
            label: "Inicio",
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.directions_car,
              color: Colors.purple,
            ),
            label: "Alquiler",
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.account_circle_rounded,
              color: Colors.purple,
            ),
            label: "Usuarios",
          ),
        ],
        currentIndex: 0, // Índice actual
        selectedItemColor: Colors.pink, // Color del ítem seleccionado
        unselectedItemColor: Colors.purple, // Color del ítem no seleccionado
        selectedLabelStyle: const TextStyle(
          fontSize: 16, // Tamaño de fuente para el label seleccionado
          fontWeight:
              FontWeight.bold, // Peso de la fuente para el label seleccionado
          color: Colors.pink, // Color para el label seleccionado
        ),
        unselectedLabelStyle: const TextStyle(
          fontSize: 14, // Tamaño de fuente para el label no seleccionado
          fontWeight: FontWeight
              .normal, // Peso de la fuente para el label no seleccionado
          color: Colors.grey, // Color para el label no seleccionado
        ),
      ),
    );
  }
}
