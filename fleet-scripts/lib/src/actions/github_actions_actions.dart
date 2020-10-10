import 'package:meta/meta.dart';
import 'package:mobx/mobx.dart';

import '../repo/android_project_repo.dart';
import '../repo/firebase_auth_repo.dart';
import '../repo/firebase_project_repo.dart';
import '../repo/flutter_version_repo.dart';
import '../repo/github_actions_repo.dart';
import '../state/github_actions_state.dart';
import 'firebase_project_actions.dart';

class GithubActionsActions {
  final GithubActionsState state;
  final GithubActionsRepo repo;
  final FlutterVersionRepo flutterVersionRepo;

  FirebaseProjectActions firebaseProject;

  GithubActionsActions({
    @required this.state,
    @required this.repo,
    @required this.flutterVersionRepo,
    @required FirebaseProjectRepo firebaseProjectRepo,
    @required FirebaseAuthRepo firebaseAuthRepo,
    @required AndroidProjectRepo androidProjectRepo,
  }) {
    firebaseProject = FirebaseProjectActions(
      state: state.firebaseProject,
      repo: firebaseProjectRepo,
      firebaseAuthRepo: firebaseAuthRepo,
      androidProjectRepo: androidProjectRepo,
    );
  }

  Future<void> init() async {
    final flutterVersion = state.flutterVersion ??
        await flutterVersionRepo.localOrLatestFlutterVersion();
    runInAction(() {
      state.flutterVersion ??= flutterVersion;
      state.firebaseVersion ??= repo.firebaseVersion;
      state.apkPath ??= repo.defaultApkPath;
      state.outputPath ??= repo.defaultOutputPath;
      firebaseProject.init();
    });
  }

  Future<void> createWorkflow() async {
    await repo.writeWorkflowFile(
      flutterVersion: state.flutterVersion,
      flutterAppDirectory: state.flutterAppDirectory,
      firebaseVersion: state.firebaseVersion,
      apkPath: state.apkPath,
      app: state.firebaseProject.app,
      outputPath: state.outputPath,
      testers: state.testers,
    );
  }
}
