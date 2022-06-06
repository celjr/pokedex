import 'package:pokedex/src/core/domain/services/http_service.dart';
import 'package:http/http.dart' as http;

class HttpServiceImp implements HttpService {
  @override
  Future get<T>(String url) async {
    var uri = Uri.parse(url);
    var response = await http.get(uri);

    return response;
  }
}
