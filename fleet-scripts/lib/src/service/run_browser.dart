import 'dart:io';

void runBrowser(String url) {
  try {
    print(
        'Opening URL... if the browser isn\'t opening please go to the following URL:');
    print('  => $url');
    print('');
    switch (Platform.operatingSystem) {
      case 'linux':
        Process.run('x-www-browser', [url]);
        break;
      case 'macos':
        Process.run('open', [url]);
        break;
      case 'windows':
        Process.run('explorer', [url]);
        break;
      default:
        break;
    }
  } catch (_) {}
}
