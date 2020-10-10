import 'package:medjool/medjool.dart';
import 'package:mobx/mobx.dart';

import '../actions/firebase_project_actions.dart';
import '../modules/app.dart';
import '../state/firebase_project_state.dart';

class FirebaseProjectApp {
  final FirebaseProjectActions actions;

  FirebaseProjectApp(this.actions);

  factory FirebaseProjectApp.main() {
    final appModule = AppModule();
    final actions = FirebaseProjectActions(
      state: FirebaseProjectState(),
      repo: appModule.firebaseProjectRepo,
      androidProjectRepo: appModule.androidProjectRepo,
      firebaseAuthRepo: appModule.firebaseAuthRepo,
    );

    return FirebaseProjectApp(actions);
  }

  void init() {
    actions.init();
  }

  void render() {
    final state = actions.state;
    autorun((_) {
      final android = state.androidProject;
      final manifestFilePath = android.manifestFilePath;
      final packageName = android.project.packageName;
      if (manifestFilePath != null && packageName.isNotEmpty) {
        print('Starting from manifest file ${android.manifestFilePath}');
        print('Detected package name: ${android.project.packageName}');

        actions.firebaseAuth.init();
      }
    });

    reaction((_) => state.firebaseAuth.clientId, (value) {
      actions.loadProjects();
    });

    reaction((_) => state.projects.browse.queryResult.records, (_) {
      final browse = state.projects.browse;
      final fetchState = browse.fetchState;
      final queryResult = browse.queryResult;

      if (fetchState == FetchState.loading) {
        print('Loading projects...');
      } else if (fetchState == FetchState.resolved) {
        print('');
        for (var i = 0; i < queryResult.records.length; i++) {
          final project = queryResult.records[i];
          print('$i) ${project.name}');
        }

        print('=> Type the number of the desired Firebase project...');
        actions.promptSelectProject();
      }
    });

    autorun((reaction) {
      final browse = state.projects.browse;
      final fetchState = browse.fetchState;
      final selected = state.projects.select.selected;

      if (fetchState != FetchState.resolved) {
        return;
      }
      if (selected.isEmpty) {
        print('Error: no project selected');
        return;
      }
      final project = selected.values.first;
      print('Creating app in project "${project.name}"');
      actions.createApp(project);
    });

    reaction((_) => state.app, (_) {
      final app = state.app;
      print('App "${app.name}" was created successfully');
    });
  }
}
