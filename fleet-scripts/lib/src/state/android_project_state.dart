import 'package:mobx/mobx.dart';

import '../model/android_project.dart';

part 'android_project_state.g.dart';

class AndroidProjectState extends AndroidProjectStateBase
    with _$AndroidProjectState {
  AndroidProjectState({String manifestFilePath, AndroidProject project})
      : super(
          manifestFilePath: manifestFilePath,
          project: project,
        );
}

abstract class AndroidProjectStateBase with Store {
  @observable
  String manifestFilePath;
  @observable
  AndroidProject project;

  AndroidProjectStateBase({String manifestFilePath, AndroidProject project})
      : manifestFilePath = manifestFilePath ?? null,
        project = project ?? AndroidProject();
}
