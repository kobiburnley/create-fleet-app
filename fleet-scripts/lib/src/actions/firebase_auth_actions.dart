import 'package:meta/meta.dart';
import 'package:mobx/mobx.dart';

import '../repo/firebase_auth_repo.dart';
import '../state/firebase_auth_state.dart';

class FirebaseAuthActions {
  final FirebaseAuthState state;
  final FirebaseAuthRepo repo;

  FirebaseAuthActions({
    @required this.state,
    @required this.repo,
  });

  void _initStateDefaults() {
    runInAction(() {
      state.clientId ??= repo.defaultClientId;
      state.scopes ??= repo.defaultScopes;
    });
  }

  Future<void> init() async {
    _initStateDefaults();
  }

  Future<void> login() async {
    state.credentials = await repo.getCredentials(
      clientId: state.clientId,
      scopes: state.scopes,
    );
  }
}
