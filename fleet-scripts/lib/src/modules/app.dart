import 'package:http/http.dart' as http;

import '../repo/android_project_repo.dart';
import '../repo/firebase_auth_repo.dart';
import '../repo/firebase_project_repo.dart';
import '../repo/flutter_version_repo.dart';
import '../repo/github_actions_repo.dart';

class AppModule {
  http.Client _httpClient;

  http.Client get httpClient {
    return _httpClient ??= http.Client();
  }

  AndroidProjectRepo _androidProjectRepo;

  AndroidProjectRepo get androidProjectRepo {
    return _androidProjectRepo ??= AndroidProjectRepo();
  }

  FirebaseAuthRepo _firebaseAuthRepo;

  FirebaseAuthRepo get firebaseAuthRepo {
    return _firebaseAuthRepo ??= FirebaseAuthRepo(httpClient: httpClient);
  }

  FirebaseProjectRepo _firebaseProjectRepo;

  FirebaseProjectRepo get firebaseProjectRepo {
    return _firebaseProjectRepo ??= FirebaseProjectRepo(httpClient: httpClient);
  }

  FlutterVersionRepo _flutterVersionRepo;

  FlutterVersionRepo get flutterVersionRepo {
    return _flutterVersionRepo ??= FlutterVersionRepo();
  }

  GithubActionsRepo _githubActionsRepo;

  GithubActionsRepo get githubActionsRepo {
    return _githubActionsRepo ??= GithubActionsRepo();
  }
}
