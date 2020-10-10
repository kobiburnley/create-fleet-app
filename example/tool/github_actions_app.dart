import 'package:fleet_scripts/fleet_scripts.dart';
import 'package:path/path.dart' as path;

void main() {
  GithubActionsApp.main(
    flutterAppDirectory: 'example',
    outputPath: path.normalize(
      path.absolute('../', '.github', 'workflows', 'ci.yml'),
    ),
    testers: ['qobyyy@gmail.com']
  )
    ..render()
    ..init();
}
