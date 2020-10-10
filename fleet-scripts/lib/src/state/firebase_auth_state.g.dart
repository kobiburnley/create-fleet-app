// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'firebase_auth_state.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$FirebaseAuthState on FirebaseAuthStateBase, Store {
  final _$credentialsAtom = Atom(name: 'FirebaseAuthStateBase.credentials');

  @override
  AccessCredentials get credentials {
    _$credentialsAtom.reportRead();
    return super.credentials;
  }

  @override
  set credentials(AccessCredentials value) {
    _$credentialsAtom.reportWrite(value, super.credentials, () {
      super.credentials = value;
    });
  }

  final _$clientIdAtom = Atom(name: 'FirebaseAuthStateBase.clientId');

  @override
  ClientId get clientId {
    _$clientIdAtom.reportRead();
    return super.clientId;
  }

  @override
  set clientId(ClientId value) {
    _$clientIdAtom.reportWrite(value, super.clientId, () {
      super.clientId = value;
    });
  }

  final _$scopesAtom = Atom(name: 'FirebaseAuthStateBase.scopes');

  @override
  List<String> get scopes {
    _$scopesAtom.reportRead();
    return super.scopes;
  }

  @override
  set scopes(List<String> value) {
    _$scopesAtom.reportWrite(value, super.scopes, () {
      super.scopes = value;
    });
  }

  @override
  String toString() {
    return '''
credentials: ${credentials},
clientId: ${clientId},
scopes: ${scopes}
    ''';
  }
}
