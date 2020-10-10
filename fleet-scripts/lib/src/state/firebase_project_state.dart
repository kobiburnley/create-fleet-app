import 'package:googleapis_beta/firebase/v1beta1.dart';
import 'package:medjool/medjool.dart';
import 'package:mobx/mobx.dart';

import 'android_project_state.dart';
import 'firebase_auth_state.dart';

part 'firebase_project_state.g.dart';

class FirebaseProjectState extends FirebaseProjectStateBase
    with _$FirebaseProjectState {
  FirebaseProjectState({
    SelectBrowseState<FirebaseProject> projects,
    FirebaseAuthState firebaseAuth,
    AndroidProjectState androidProject,
    FirebaseAppInfo app,
  }) : super(
          androidProject: androidProject,
          firebaseAuth: firebaseAuth,
          projects: projects,
          app: app,
        );
}

abstract class FirebaseProjectStateBase with Store {
  final SelectBrowseState<FirebaseProject> projects;
  final FirebaseAuthState firebaseAuth;
  final AndroidProjectState androidProject;
  @observable
  FirebaseAppInfo app;

  FirebaseProjectStateBase({
    SelectBrowseState<FirebaseProject> projects,
    FirebaseAuthState firebaseAuth,
    AndroidProjectState androidProject,
    FirebaseAppInfo app,
  })  : projects = projects ?? SelectBrowseState(),
        firebaseAuth = firebaseAuth ?? FirebaseAuthState(),
        androidProject = androidProject ?? AndroidProjectState(),
        app = app ?? FirebaseAppInfo();
}
