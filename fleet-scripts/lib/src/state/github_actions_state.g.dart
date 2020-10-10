// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'github_actions_state.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$GithubActionsState on GithubActionsStateBase, Store {
  final _$flutterVersionAtom =
      Atom(name: 'GithubActionsStateBase.flutterVersion');

  @override
  String get flutterVersion {
    _$flutterVersionAtom.reportRead();
    return super.flutterVersion;
  }

  @override
  set flutterVersion(String value) {
    _$flutterVersionAtom.reportWrite(value, super.flutterVersion, () {
      super.flutterVersion = value;
    });
  }

  final _$flutterAppDirectoryAtom =
      Atom(name: 'GithubActionsStateBase.flutterAppDirectory');

  @override
  String get flutterAppDirectory {
    _$flutterAppDirectoryAtom.reportRead();
    return super.flutterAppDirectory;
  }

  @override
  set flutterAppDirectory(String value) {
    _$flutterAppDirectoryAtom.reportWrite(value, super.flutterAppDirectory, () {
      super.flutterAppDirectory = value;
    });
  }

  final _$apkPathAtom = Atom(name: 'GithubActionsStateBase.apkPath');

  @override
  String get apkPath {
    _$apkPathAtom.reportRead();
    return super.apkPath;
  }

  @override
  set apkPath(String value) {
    _$apkPathAtom.reportWrite(value, super.apkPath, () {
      super.apkPath = value;
    });
  }

  final _$outputPathAtom = Atom(name: 'GithubActionsStateBase.outputPath');

  @override
  String get outputPath {
    _$outputPathAtom.reportRead();
    return super.outputPath;
  }

  @override
  set outputPath(String value) {
    _$outputPathAtom.reportWrite(value, super.outputPath, () {
      super.outputPath = value;
    });
  }

  final _$testersAtom = Atom(name: 'GithubActionsStateBase.testers');

  @override
  List<String> get testers {
    _$testersAtom.reportRead();
    return super.testers;
  }

  @override
  set testers(List<String> value) {
    _$testersAtom.reportWrite(value, super.testers, () {
      super.testers = value;
    });
  }

  @override
  String toString() {
    return '''
flutterVersion: ${flutterVersion},
flutterAppDirectory: ${flutterAppDirectory},
apkPath: ${apkPath},
outputPath: ${outputPath},
testers: ${testers}
    ''';
  }
}
