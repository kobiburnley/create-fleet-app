import 'package:googleapis_beta/firebase/v1beta1.dart';
import 'package:medjool/medjool.dart';
import 'package:meta/meta.dart';

import '../repo/android_project_repo.dart';
import '../repo/firebase_auth_repo.dart';
import '../repo/firebase_project_repo.dart';
import '../state/firebase_project_state.dart';
import 'android_project_actions.dart';
import 'firebase_auth_actions.dart';

class FirebaseProjectActions {
  final FirebaseProjectState state;
  final FirebaseProjectRepo repo;

  AndroidProjectActions androidProject;
  SelectBrowseActions<FirebaseProject> projects;
  FirebaseAuthActions firebaseAuth;

  FirebaseProjectActions({
    @required this.state,
    @required this.repo,
    @required FirebaseAuthRepo firebaseAuthRepo,
    @required AndroidProjectRepo androidProjectRepo,
  }) {
    projects = SelectBrowseActions(
      state: state.projects,
      fetchData: () async {
        final clientId = state.firebaseAuth.clientId;
        final credentials = state.firebaseAuth.credentials;
        return QueryResult.fromList(
          await repo.findAllProjects(
            clientId: clientId,
            credentials: credentials,
          ),
        );
      },
      idGetter: (project) => project.projectId,
    );
    firebaseAuth = FirebaseAuthActions(
      state: state.firebaseAuth,
      repo: firebaseAuthRepo,
    );

    androidProject = AndroidProjectActions(
      state: state.androidProject,
      repo: androidProjectRepo,
    );
  }

  Future<void> init() async {
    await androidProject.init();
  }

  Future<void> loadProjects() async {
    if (state.firebaseAuth.credentials == null) {
      await firebaseAuth.login();
    }

    await projects.browse.refresh();
  }

  Future<void> createApp(FirebaseProject project) async {
    final app = await repo.findOrCreateApp(
      clientId: state.firebaseAuth.clientId,
      credentials: state.firebaseAuth.credentials,
      packageName: state.androidProject.project.packageName,
      project: project,
    );

    state.app = app;
  }

  Future<void> promptSelectProject() async {
    final queryResult = state.projects.browse.queryResult;
    final index = await repo.readProjectIndex();
    projects.select.selectOne(queryResult.records[index]);
  }
}
