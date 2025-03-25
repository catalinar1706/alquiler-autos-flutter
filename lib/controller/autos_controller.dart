import 'dart:convert';
import 'package:http/http.dart' as http;

class AutosController {
  final String baseUrl = 'https://backend-alquiler-autos-rz0d.onrender.com/api/autos';

  // Método para obtener vehículos disponibles
  Future<List<Map<String, dynamic>>> obtenerAutosDisponibles() async {
    try {
      final url = Uri.parse(baseUrl);
      final response = await http.get(url);
      print('Response Status Code: ${response.statusCode}'); // Depuración
      print('Response Body: ${response.body}'); // Depuración

      if (response.statusCode == 200) {
        final List<dynamic> data = jsonDecode(response.body);
        
        print('Número de autos recibidos: ${data.length}'); // Depuración

        // Convertir los datos a una lista de mapas
        final autos = data.map((auto) {
          print('Auto individual: $auto'); // Depuración de cada auto
          return {
            'id': auto['id'],
            'marca': auto['marca'] ?? 'Desconocida',
            'modelo': auto['modelo'] ?? 'Desconocido',
            'anio': auto['anio'] ?? 'N/A',
            'disponibilidad': auto['disponibilidad'] ?? false,
            'imageUrl': auto['imagen'] ?? 'https://via.placeholder.com/150',
            'precio': auto['valorAlquiler'] != null
                ? '\$${auto['valorAlquiler']}/día'
                : 'Precio no disponible'
          };
        }).toList();
        print('Autos mapeados: $autos'); // Depuración
        return autos;
      } else {
        throw Exception('Error al obtener vehículos: Código ${response.statusCode}');
      }
    } catch (e) {
      print('Error al obtener Autos Disponibles: $e');
      return [];
    }
  }
}