import 'package:dio/dio.dart';

class ApiService {
  final _baseUrl = 'https://fcm.googleapis.com/';
  final Dio _dio;

  ApiService(this._dio);

  Map<String, dynamic> headers = {
  'Content-Type': 'application/json',
  'Authorization': 'key=AAAAIfZRlbM:APA91bFG-7ELbJVljay7EJT-DqaMtFH0uP2Yg_fZB7kbJvJRK8HyeF17bHbHZfJugUVF25t0yZrpLKd4HOifKyggqzzMi45l9_8UiUDvlouxa-lGzaXQwdV9PCUyaP7T7xbNtcxGZ2EU',
};


  Future<void> post({required String endPoint,required data}) async {
    var response = await _dio.post(
      '$_baseUrl$endPoint',
      data: data,
      options: Options(headers:headers )
      );
    print(response.data);
  }
}