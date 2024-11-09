import 'package:alquiler_autos/views/medioPago.dart';
import 'package:flutter/material.dart';

class Detallesvehiculo extends StatefulWidget {
  const Detallesvehiculo({super.key});

  @override
  State<Detallesvehiculo> createState() => _DetallesvehiculoState();
}

class _DetallesvehiculoState extends State<Detallesvehiculo> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.purple[100],
          title: const Text(
            "Detalle del vehiculo",
            style: TextStyle(color: Colors.purple),
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                children: [
                  SizedBox(
                    width: double.infinity,
                    child: Image.network(
                      "https://pepeganga.vtexassets.com/arquivos/ids/689422/100443876-1.png?v=637783840263800000",
                      height: 250,
                      width: 250,
                    ),
                  ),
                  const Row(
                    children: [
                      Text(
                        "Marca:",
                        style: TextStyle(
                            fontSize: 25, fontWeight: FontWeight.bold),
                      ),
                      Text(
                        "Toyota",
                        style: TextStyle(
                            fontSize: 25, fontWeight: FontWeight.bold),
                      )
                    ],
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  const Row(
                    children: [
                      Text(
                        "Modelo:",
                        style: TextStyle(
                          fontSize: 20,
                        ),
                      ),
                      Text(
                        "Corolla",
                        style: TextStyle(
                          fontSize: 20,
                        ),
                      )
                    ],
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  const Row(
                    children: [
                      Text(
                        "Año:",
                        style: TextStyle(
                          fontSize: 20,
                        ),
                      ),
                      Text(
                        "2022",
                        style: TextStyle(
                          fontSize: 20,
                        ),
                      )
                    ],
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  const Row(
                    children: [
                      Text(
                        "Disponibilidad:",
                        style: TextStyle(fontSize: 20, color: Colors.green),
                      ),
                      Text(
                        "Disponible",
                        style: TextStyle(fontSize: 20, color: Colors.green),
                      )
                    ],
                  ),
                ],
              ),
              ElevatedButton(
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const Mediopago()));
                },
                style: ElevatedButton.styleFrom(backgroundColor: Colors.purple),
                child: const Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.directions_car,
                      color: Colors.white,
                    ),
                    SizedBox(
                      width: 5,
                    ),
                    Text(
                      "Alquilar vehiculo",
                      style: TextStyle(color: Colors.white, fontSize: 20),
                    )
                  ],
                ),
              ),
            ],
          ),
        ));
  }
}
