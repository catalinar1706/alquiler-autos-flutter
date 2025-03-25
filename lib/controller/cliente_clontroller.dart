import 'dart:convert';
import 'package:http/http.dart' as http;

class ClienteService {
  final String baseUrl = "https://backend-alquiler-autos-rz0d.onrender.com/api";

  Future<http.Response> registrarCliente(
    String nombre,
    String correo,
    String numLic,
    String password,
  ) async {
    final url = Uri.parse('$baseUrl/clientes');

    try {
      final response = await http.post(
        url,
        headers: {'Content-Type': 'application/json'},
        body: jsonEncode({
          'nombre': nombre,
          'correo': correo,
          'numLic': numLic,
          'password': password,
        }),
      );

      return response;
    } catch (e) {
      print('Error en la petición HTTP: $e');
      throw Exception('Error de conexión al servidor: $e');
    }
  }

  Future<Map<String, dynamic>> loginCliente(
    String correo,
    String password,
  ) async {
    final url = Uri.parse('$baseUrl/clientes/login');

    try {
      // Fixed typo in Content-Type header (applition -> application)
      final response = await http.post(
        url,
        headers: {'Content-Type': 'application/json'},
        body: jsonEncode({'correo': correo, 'password': password}),
      );

      Map<String, dynamic> responseData;
      try {
        responseData = jsonDecode(response.body);
      } catch (e) {
        return {
          'success': false,
          'mensaje': 'Error al procesar la respuesta del servidor',
        };
      }

      if (response.statusCode == 200) {
        return {
          'success': true,
          'mensaje': responseData['mensaje'] ?? 'Inicio de sesión exitoso',
          'cliente': responseData['cliente'],
        };
      } else {
        return {
          'success': false,
          'mensaje': responseData['mensaje'] ?? 'Error: ${response.statusCode}',
        };
      }
    } catch (e) {
      // Handle network or other errors
      print('Error en la petición HTTP: $e');
      return {'success': false, 'mensaje': 'Error de conexión al servidor'};
    }
  }
}