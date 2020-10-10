import 'package:meta/meta.dart';
import 'package:mobx/mobx.dart';

import '../repo/android_project_repo.dart';
import '../state/android_project_state.dart';

class AndroidProjectActions {
  final AndroidProjectState state;
  final AndroidProjectRepo repo;

  AndroidProjectActions({@required this.state, @required this.repo});


  Future<void> init() async {
    runInAction(() {
      state.manifestFilePath ??= repo.defaultManifestFilePath;
    });
    final project = await repo.getAndroidProject(
      manifestFilePath: state.manifestFilePath,
    );
    runInAction(() {
      state.project = project;
    });
  }
}
