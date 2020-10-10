// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'android_project_state.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$AndroidProjectState on AndroidProjectStateBase, Store {
  final _$manifestFilePathAtom =
      Atom(name: 'AndroidProjectStateBase.manifestFilePath');

  @override
  String get manifestFilePath {
    _$manifestFilePathAtom.reportRead();
    return super.manifestFilePath;
  }

  @override
  set manifestFilePath(String value) {
    _$manifestFilePathAtom.reportWrite(value, super.manifestFilePath, () {
      super.manifestFilePath = value;
    });
  }

  final _$projectAtom = Atom(name: 'AndroidProjectStateBase.project');

  @override
  AndroidProject get project {
    _$projectAtom.reportRead();
    return super.project;
  }

  @override
  set project(AndroidProject value) {
    _$projectAtom.reportWrite(value, super.project, () {
      super.project = value;
    });
  }

  @override
  String toString() {
    return '''
manifestFilePath: ${manifestFilePath},
project: ${project}
    ''';
  }
}
