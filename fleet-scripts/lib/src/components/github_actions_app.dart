import 'package:mobx/mobx.dart';

import '../../fleet_scripts.dart';
import '../actions/github_actions_actions.dart';
import '../modules/app.dart';
import '../state/github_actions_state.dart';

class GithubActionsApp {
  final FirebaseProjectApp firebaseProject;
  final GithubActionsActions actions;

  GithubActionsApp(this.actions)
      : firebaseProject = FirebaseProjectApp(actions.firebaseProject);

  factory GithubActionsApp.main({
    String flutterVersion,
    String flutterAppDirectory,
    String apkPath,
    String outputPath,
    List<String> testers,
  }) {
    final appModule = AppModule();
    final actions = GithubActionsActions(
      repo: appModule.githubActionsRepo,
      state: GithubActionsState(
        flutterVersion: flutterVersion,
        flutterAppDirectory: flutterAppDirectory,
        apkPath: apkPath,
        outputPath: outputPath,
        testers: testers,
      ),
      flutterVersionRepo: appModule.flutterVersionRepo,
      androidProjectRepo: appModule.androidProjectRepo,
      firebaseAuthRepo: appModule.firebaseAuthRepo,
      firebaseProjectRepo: appModule.firebaseProjectRepo,
    );

    return GithubActionsApp(actions);
  }

  void init() {
    actions.init();
  }

  void render() {
    final state = actions.state;
    firebaseProject.render();

    reaction((_) => state.firebaseProject.app, (_) {
      actions.createWorkflow();
      print('Add a repository secret FIREBASE_TOKEN');
      print(state.firebaseProject.firebaseAuth.credentials.refreshToken);
    });
  }
}
