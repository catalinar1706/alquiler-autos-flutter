import 'package:alquiler_autos/controller/alquiler_controller.dart';
import 'package:alquiler_autos/views/medioPago.dart';
import 'package:flutter/material.dart';

class DetalleVehiculoScreen extends StatefulWidget {
  final String imageUrl;
  final String marca;
  final String modelo;
  final String anio;
  final int disponibilidad;
  final int autoId;
  final int clienteId;

  const DetalleVehiculoScreen({
    super.key,
    required this.imageUrl,
    required this.marca,
    required this.modelo,
    required this.anio,
    required this.disponibilidad,
    required this.autoId,
    required this.clienteId,
  });

  @override
  State<DetalleVehiculoScreen> createState() => _DetalleVehiculoScreenState();
}

class _DetalleVehiculoScreenState extends State<DetalleVehiculoScreen> {
  void alquilarVehiculo() async {
    final String fechaInicio = DateTime.now().toIso8601String();
    final String fechaFin =
        DateTime.now().add(const Duration(days: 7)).toIso8601String();

    // Create an instance of AlquilerService
    final alquilerService = AlquilerService();

    try {
      // Call the method on the instance
      final response = await alquilerService.registrarAlquiler(
          widget.clienteId, widget.autoId, fechaInicio, fechaFin);

      print('Respuesta del servicio: $response');

      // The rest of your code remains the same
      if (response['success']) {
        // Note: you have 'succes' in your code, should be 'success'
        if (response.containsKey('data') &&
            response['data'] is Map &&
            response['data'].containsKey('mensaje')) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text('${response['data']['mensaje']}')),
          );
        } else {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text('Alquiler registrado con éxito')),
          );
          setState(
              () {}); // Actualiza la interfaz para reflejar la disponibilidad
        }
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Error: ${response['message']}')),
        );
      }
    } catch (e) {
      print('Error al registrar el alquiler: $e');
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Error de conexión $e')),
      );
    }
  }

  void confirmarAlquiler() {
    print('Confirmar alquiler llamado');
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          backgroundColor: Colors.white,
          title: const Text(
            'Confirmar Alquiler',
            style: TextStyle(color: Colors.black),
          ),
          content: const Text(
              '¿Estas seguro que deseas alquilar este vehiculo?',
              style: TextStyle(color: Colors.black)),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
                print('Confirmar alquiler cancelado');
              },
              child:
                  const Text('Cancelar', style: TextStyle(color: Colors.black)),
            ),
            TextButton(
                onPressed: () {
                  Navigator.of(context).pop();
                  print('Confirmar alquiler confirmado');
                  alquilarVehiculo();
                },
                child: const Text('Aceptar',
                    style: TextStyle(color: Colors.black))),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final disponible = widget.disponibilidad > 0;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.purple[100],
        title: const Text(
          "Detalle del vehiculo",
          style: TextStyle(color: Colors.purple),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              children: [
                const SizedBox(height: 15),
                SizedBox(
                  width: double.infinity,
                  child: Image.network(
                    widget.imageUrl,
                    height: 150,
                    width: 200,
                  ),
                ),
                const SizedBox(height: 15),
                Row(
                  children: [
                    Text(
                      "Marca: ${widget.marca}",
                      style: const TextStyle(
                          fontSize: 25, fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
                const SizedBox(height: 15),
                Row(
                  children: [
                    Text(
                      "Modelo: ${widget.modelo}",
                      style: const TextStyle(fontSize: 20),
                    ),
                  ],
                ),
                const SizedBox(height: 15),
                Row(
                  children: [
                    Text(
                      "Año: ${widget.anio}",
                      style: const TextStyle(fontSize: 20),
                    ),
                  ],
                ),
                const SizedBox(height: 15),
                Row(
                  children: [
                    Text(
                      "Disponibilidad: ${widget.disponibilidad}",
                      style: const TextStyle(fontSize: 20, color: Colors.green),
                    ),
                    // Text(
                    //   disponible ? " Disponible" : " No disponible",
                    //   style: const TextStyle(fontSize: 20, color: Colors.green),
                    // )
                  ],
                ),
              ],
            ),
            ElevatedButton(
              onPressed: disponible ? confirmarAlquiler : null,
              style: ElevatedButton.styleFrom(
                  backgroundColor: disponible ? Colors.red : Colors.grey),
              child: const Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.directions_car, color: Colors.white),
                  SizedBox(width: 5),
                  Text(
                    "Alquilar vehículo",
                    style: TextStyle(color: Colors.white, fontSize: 15),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
