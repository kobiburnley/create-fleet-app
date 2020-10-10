import 'dart:io';
import 'dart:isolate';

import 'package:grinder/grinder.dart';
import 'package:path/path.dart' as p;

void writeString(String path, String text) {
  log("writing $path");
  final file = File(path);
  file.createSync(recursive: true);
  file.writeAsStringSync(text);
}

final Future<String> cliPkgSrc = () async {
  final pkgSrcUri = await Isolate.resolvePackageUri(
    Uri.parse('package:fleet_scripts/src'),
  );

  if (pkgSrcUri != null) {
    return p.fromUri(pkgSrcUri);
  }
  return p.join(Directory.current.path, 'lib', 'src');
}();
