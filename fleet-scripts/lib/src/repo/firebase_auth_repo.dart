import 'package:googleapis_auth/auth.dart';
import 'package:googleapis_auth/auth_io.dart';
import 'package:http/http.dart' as http;
import 'package:meta/meta.dart';

import '../service/run_browser.dart';

class FirebaseAuthRepo {
  final http.Client httpClient;

  FirebaseAuthRepo({@required this.httpClient});

  Future<AccessCredentials> getCredentials({
    @required ClientId clientId,
    @required List<String> scopes,
  }) {
    return obtainAccessCredentialsViaUserConsent(
      clientId,
      scopes,
      httpClient,
      runBrowser,
    );
  }

  ClientId get defaultClientId => ClientId(
        '563584335869-fgrhgmd47bqnekij5i8b5pr03ho849e6.apps.googleusercontent.com',
        'j9iVZfS8kkCEFUPaAeJV0sAi',
      );

  List<String> get defaultScopes => [
        'email',
        'openid',
        'https://www.googleapis.com/auth/firebase',
        'https://www.googleapis.com/auth/cloud-platform',
        'https://www.googleapis.com/auth/cloudplatformprojects.readonly'
      ];
}
