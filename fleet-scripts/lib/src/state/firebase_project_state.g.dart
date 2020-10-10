// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'firebase_project_state.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$FirebaseProjectState on FirebaseProjectStateBase, Store {
  final _$appAtom = Atom(name: 'FirebaseProjectStateBase.app');

  @override
  FirebaseAppInfo get app {
    _$appAtom.reportRead();
    return super.app;
  }

  @override
  set app(FirebaseAppInfo value) {
    _$appAtom.reportWrite(value, super.app, () {
      super.app = value;
    });
  }

  @override
  String toString() {
    return '''
app: ${app}
    ''';
  }
}
