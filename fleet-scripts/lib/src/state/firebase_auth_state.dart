import 'package:googleapis_auth/auth.dart';
import 'package:mobx/mobx.dart';

part 'firebase_auth_state.g.dart';

class FirebaseAuthState extends FirebaseAuthStateBase with _$FirebaseAuthState {
  FirebaseAuthState() : super();
}

abstract class FirebaseAuthStateBase with Store {
  @observable
  AccessCredentials credentials;
  @observable
  ClientId clientId;
  @observable
  List<String> scopes;

  FirebaseAuthStateBase({
    this.credentials,
    this.clientId,
    this.scopes,
  });
}
