import 'package:googleapis_beta/firebase/v1beta1.dart';
import 'package:meta/meta.dart';
import 'package:path/path.dart' as path;

import '../template.dart';
import '../utils.dart';

class GithubActionsRepo {
  Future<Map<String, String>> writeWorkflowFile({
    @required String flutterAppDirectory,
    @required String flutterVersion,
    @required String firebaseVersion,
    @required String apkPath,
    @required FirebaseAppInfo app,
    @required String outputPath,
    @required List<String> testers,
  }) async {
    final variables = {
      'flutterAppDirectory': flutterAppDirectory,
      'flutterVersion': flutterVersion,
      'firebaseVersion': firebaseVersion,
      'apkPath': apkPath,
      'appId': '"${app.appId}"',
      'testers': '"${testers.join(', ')}"',
      'refreshToken': '\${{ secrets.FIREBASE_TOKEN }}'
    };
    final text = renderTemplate('.github/workflows/ci.yml', variables);
    writeString(outputPath, text);
    return variables;
  }

  String get firebaseVersion => '8.12.0';
  String get defaultApkPath => 'build/app/outputs/apk/release/app-arm64-v8a-release.apk';
  String get defaultOutputPath => path.join('.github', 'workflows', 'ci.yml');
}
