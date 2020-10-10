import 'package:mobx/mobx.dart';

import 'firebase_project_state.dart';

part 'github_actions_state.g.dart';

class GithubActionsState extends GithubActionsStateBase
    with _$GithubActionsState {
  GithubActionsState({
    String flutterVersion,
    String flutterAppDirectory,
    String firebaseVersion,
    String apkPath,
    String outputPath,
    List<String> testers,
    FirebaseProjectState firebaseProject,
  }) : super(
          flutterVersion: flutterVersion,
          flutterAppDirectory: flutterAppDirectory,
          firebaseVersion: firebaseVersion,
          apkPath: apkPath,
          outputPath: outputPath,
          testers: testers,
          firebaseProject: firebaseProject,
        );
}

abstract class GithubActionsStateBase with Store {
  @observable
  String flutterVersion;
  @observable
  String flutterAppDirectory;
  @observable
  String firebaseVersion;
  @observable
  String apkPath;
  @observable
  String outputPath;
  @observable
  List<String> testers;
  FirebaseProjectState firebaseProject;

  GithubActionsStateBase({
    this.flutterVersion,
    this.flutterAppDirectory,
    this.firebaseVersion,
    this.apkPath,
    this.outputPath,
    List<String> testers,
    FirebaseProjectState firebaseProject,
  })  : testers = testers ?? [],
        firebaseProject = firebaseProject ?? FirebaseProjectState();
}
