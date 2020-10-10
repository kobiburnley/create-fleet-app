import 'dart:io';

import 'package:meta/meta.dart';
import 'package:path/path.dart' as path;
import 'package:xml/xml.dart' as xml;

import '../model/android_project.dart';

class AndroidProjectRepo {
  String get defaultManifestFilePath =>
      'android/app/src/main/AndroidManifest.xml';

  Future<AndroidProject> getAndroidProject({
    @required String manifestFilePath,
  }) async {
    final file = File(
      path.join(Directory.current.path, manifestFilePath),
    );
    final contents = await await file.readAsString();
    final document = xml.parse(contents);

    final packageName = document.firstChild.attributes
        .firstWhere(
          (attr) => attr.name.local == 'package',
        )
        .value;

    return AndroidProject(packageName: packageName);
  }
}
