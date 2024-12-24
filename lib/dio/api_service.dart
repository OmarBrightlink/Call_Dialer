import 'package:dio/dio.dart';
import 'package:logger/logger.dart';
import 'dio_client.dart';

class  ApiService{


  final DioClient _dioClient;

  ApiService(this._dioClient);

  final logger = Logger();

//Login
  Future<Map<String, dynamic>> login(String email, String password) async {
    final response = await _dioClient.dio.post(
      '/signin',
      data: {
        'username': email,
        'password': password,
      },
    );
    if (response.statusCode == 200) {
      return response.data;
    } else {
      throw Exception('');
    }
  }

  Future<List<Map<String, dynamic>>> getCountByStatus(
      String jwtToken, String selectedFilter) async {
    final response = await _dioClient.dio.get(
      '/employee/getCountByStatusAndEmp/$selectedFilter',
      options: Options(
        headers: {
          'Authorization': 'Bearer $jwtToken',
        },
      ),
    );

    if (response.statusCode == 200) {
      return List<Map<String, dynamic>>.from(response.data);
    } else {
      throw Exception('Failed to load leads');
    }
  }
}