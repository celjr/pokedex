import 'package:flutter_test/flutter_test.dart';
import 'package:http/http.dart' as http;

void main(){
  test('should return a response',() async {
    var uri = Uri.parse('https://pokeapi.co/api/v2/pokemon/');
    var response = await http.get(uri);
    
    
    expect(response,isInstanceOf<http.Response>());
    
  });
}