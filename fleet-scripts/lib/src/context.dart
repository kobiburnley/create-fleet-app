import 'package:googleapis_auth/auth.dart';
import 'package:http/http.dart' as http;

class Context {
  ClientId _clientId;

  Future<ClientId> clientId() async {
    return _clientId ??= ClientId(
      '563584335869-fgrhgmd47bqnekij5i8b5pr03ho849e6.apps.googleusercontent.com',
      'j9iVZfS8kkCEFUPaAeJV0sAi'
      // '721475705359-noa6h4umet7g8dp9hrbmd0vl54sl4f25.apps.googleusercontent.com',
      // '4lBsQrLeCvm6GV-3gfTZ8Dgy',
    );
  }

  http.Client _httpClient;

  Future<http.Client> httpClient() async {
    return _httpClient ??= http.Client();
  }

}
