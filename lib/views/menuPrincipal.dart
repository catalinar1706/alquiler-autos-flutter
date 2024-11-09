import 'package:alquiler_autos/views/detallesVehiculo.dart';
import 'package:flutter/material.dart';

class Menuprincipal extends StatefulWidget {
  const Menuprincipal({super.key});

  @override
  State<Menuprincipal> createState() => _MenuprincipalState();
}

class _MenuprincipalState extends State<Menuprincipal> {
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
      body: ListView(
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
          Card(
            color: Colors.purple[100],
            child: ListTile(
              title: const Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Toyota Corolla",
                    style: TextStyle(color: Colors.purple, fontWeight: FontWeight.bold, fontSize: 20),
                  ),
                  SizedBox(
                      height: 5), // Espacio entre el título y la descripción
                  Row(
                    children: [
                      Text(
                        "Año 2022 -",
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 14, // Estilo para la descripción
                        ),
                      ),
                      Text(
                        " \$99.99/día",
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 14,
                        ),
                      ),
                    ],
                  )
                ],
              ),
              leading: Image.network(
                "https://pepeganga.vtexassets.com/arquivos/ids/689422/100443876-1.png?v=637783840263800000",
                width: 70, // Tamaño de la imagen
                height: 70,
                fit: BoxFit.cover, // Ajusta la imagen a un cuadrado
              ),
              trailing: const Icon(
                Icons.arrow_forward_ios,
                color: Colors.white, // Color del ícono
              ),
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => const Detallesvehiculo()));
              },
            ),
          ),
          Card(
            color: Colors.purple[100],
            child: ListTile(
              title: const Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Toyota Corolla",
                    style: TextStyle(color: Colors.purple,fontWeight: FontWeight.bold,  fontSize: 20),
                  ),
                  SizedBox(
                      height: 5), // Espacio entre el título y la descripción
                  Row(
                    children: [
                      Text(
                        "Año 2022 -",
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 14, // Estilo para la descripción
                        ),
                      ),
                      Text(
                        " \$99.99/día",
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 14,
                        ),
                      ),
                    ],
                  )
                ],
              ),
              leading: Image.network(
                "https://pepeganga.vtexassets.com/arquivos/ids/689422/100443876-1.png?v=637783840263800000",
                width: 70, // Tamaño de la imagen
                height: 70,
                fit: BoxFit.cover, // Ajusta la imagen a un cuadrado
              ),
              trailing: const Icon(
                Icons.arrow_forward_ios,
                color: Colors.white, // Color del ícono
              ),
              onTap: () {
                 Navigator.push(context,
                    MaterialPageRoute(builder: (context) => const Detallesvehiculo()));
              },
            ),
          ),
          Card(
            color: Colors.purple[100],
            child: ListTile(
              title: const Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Toyota Corolla",
                    style: TextStyle(color: Colors.purple,fontWeight: FontWeight.bold, fontSize: 20),
                  ),
                  SizedBox(
                      height: 5), // Espacio entre el título y la descripción
                  Row(
                    children: [
                      Text(
                        "Año 2022 -",
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 14, // Estilo para la descripción
                        ),
                      ),
                      Text(
                        " \$99.99/día",
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 14,
                        ),
                      ),
                    ],
                  )
                ],
              ),
              leading: Image.network(
                "https://pepeganga.vtexassets.com/arquivos/ids/689422/100443876-1.png?v=637783840263800000",
                width: 70, // Tamaño de la imagen
                height: 70,
                fit: BoxFit.cover, // Ajusta la imagen a un cuadrado
              ),
              trailing: const Icon(
                Icons.arrow_forward_ios,
                color: Colors.white, // Color del ícono
              ),
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => const Detallesvehiculo()));
              },
            ),
          ),
          Card(
            color: Colors.purple[100],
            child: ListTile(
              title: const Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Toyota Corolla",
                    style: TextStyle(color: Colors.purple,fontWeight: FontWeight.bold, fontSize: 20),
                  ),
                  SizedBox(
                      height: 5), // Espacio entre el título y la descripción
                  Row(
                    children: [
                      Text(
                        "Año 2022 -",
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 14, // Estilo para la descripción
                        ),
                      ),
                      Text(
                        " \$99.99/día",
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 14,
                        ),
                      ),
                    ],
                  )
                ],
              ),
              leading: Image.network(
                "https://pepeganga.vtexassets.com/arquivos/ids/689422/100443876-1.png?v=637783840263800000",
                width: 70, // Tamaño de la imagen
                height: 70,
                fit: BoxFit.cover, // Ajusta la imagen a un cuadrado
              ),
              trailing: const Icon(
                Icons.arrow_forward_ios,
                color: Colors.white, // Color del ícono
              ),
              onTap: () {
                 Navigator.push(context,
                    MaterialPageRoute(builder: (context) => const Detallesvehiculo()));
              },
            ),
          ),
          Card(
            color: Colors.purple[100],
            child: ListTile(
              title: const Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Toyota Corolla",
                    style: TextStyle(color: Colors.purple, fontWeight: FontWeight.bold, fontSize: 20),
                  ),
                  SizedBox(
                      height: 5), // Espacio entre el título y la descripción
                  Row(
                    children: [
                      Text(
                        "Año 2022 -",
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 14, // Estilo para la descripción
                        ),
                      ),
                      Text(
                        " \$99.99/día",
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 14,
                        ),
                      ),
                    ],
                  )
                ],
              ),
              leading: Image.network(
                "https://pepeganga.vtexassets.com/arquivos/ids/689422/100443876-1.png?v=637783840263800000",
                width: 70, // Tamaño de la imagen
                height: 70,
                fit: BoxFit.cover, // Ajusta la imagen a un cuadrado
              ),
              trailing: const Icon(
                Icons.arrow_forward_ios,
                color: Colors.white, // Color del ícono
              ),
              onTap: () {
                 Navigator.push(context,
                    MaterialPageRoute(builder: (context) => const Detallesvehiculo()));
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
