import 'package:http/http.dart' as http;
import '../model/crypto_model.dart';

class CryptoService {
  final String baseUrl =
      'https://mocki.io/v1/05a1da2e-4e2f-4047-906d-ba277dc66708';
  Future<CryptoModel> fetchCryptoData() async {
    final response = await http.get(Uri.parse(baseUrl));
    if (response.statusCode == 200) {
      return cryptoModelFromJson(response.body);
    } else {
      throw Exception('Failed to fetch crypto data: ${response.statusCode}');
    }
  }
}
