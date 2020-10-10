import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:googleapis_auth/auth.dart';

// ignore: implementation_imports
import 'package:googleapis_auth/src/auth_http_utils.dart'
    show AutoRefreshingClient;
import 'package:googleapis_beta/firebase/v1beta1.dart';
import 'package:http/http.dart' as http;
import 'package:meta/meta.dart';

const pageSize = 100;

class FirebaseProjectRepo {
  final http.Client httpClient;

  FirebaseProjectRepo({@required this.httpClient});

  FirebaseApi firebaseApiFromAuth(
    ClientId clientId,
    AccessCredentials credentials,
  ) =>
      fromAuth(httpClient, clientId, credentials);

  Future<List<FirebaseProject>> findAllProjects({
    @required ClientId clientId,
    @required AccessCredentials credentials,
  }) async {
    final firebaseApi = firebaseApiFromAuth(clientId, credentials);
    final res = await firebaseApi.projects.list(pageSize: pageSize);
    return res.results;
  }

  Future<FirebaseAppInfo> findOrCreateApp({
    @required String packageName,
    @required FirebaseProject project,
    @required ClientId clientId,
    @required AccessCredentials credentials,
  }) async {
    final firebaseApi = firebaseApiFromAuth(clientId, credentials);

    final projectName = project.name;
    try {
      await firebaseApi.projects.androidApps.create(
        AndroidApp()..packageName = packageName,
        projectName,
      );
    } catch (_) {}

    final searchResponse = await firebaseApi.projects.searchApps(
      projectName,
      filter: 'namespace="$packageName"',
    );

    if (searchResponse.apps.isEmpty) {
      throw Exception('App with package name "$packageName" was not found');
    }

    if (searchResponse.apps.length > 1) {
      print(
        'Warning: more than 1 app was found with package name "$packageName"',
      );
    }

    return searchResponse.apps.first;
  }

  Future<int> readProjectIndex() async {
    final completer = Completer<int>();

    final subscription = stdin.transform(utf8.decoder).transform(const LineSplitter()).listen(
      (line) {
        final index = int.tryParse(line.trim());
        completer.complete(index);
      },
    );
    final index = await completer.future;
    subscription.cancel();
    return index;
  }
}

FirebaseApi fromAuth(
  http.Client httpClient,
  ClientId clientId,
  AccessCredentials credentials,
) {
  return FirebaseApi(
    AutoRefreshingClient(httpClient, clientId, credentials),
  );
}
