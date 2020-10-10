import 'dart:cli';
import 'dart:io';

import 'package:mustache/mustache.dart';
import 'package:path/path.dart' as p;

import 'utils.dart';

/// A cache of parsed templates.
final _cache = p.PathMap<Template>();

/// Loads the template from [path] (relative to `lib/src/templates`, without the
/// trailing `.mustache`) and renders it using [variables].
String renderTemplate(String path, [Map<String, String> variables = const {}]) {
  path = p.join(waitFor(cliPkgSrc), 'templates', path);
  return _cache
      .putIfAbsent(
        path,
        () => Template(
          File(path).readAsStringSync(),
          name: path,
          htmlEscapeValues: false,
        ),
      )
      .renderString(variables);
}
