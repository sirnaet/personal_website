import 'package:web/web.dart' as web;

Future<void> downloadFile(String url, {String? filename}) async {
  final anchor = web.document.createElement('a') as web.HTMLAnchorElement
    ..href = url
    ..style.display = 'none'
    ..download = filename ?? '';

  web.document.body?.appendChild(anchor);
  anchor.click();
  anchor.remove();
}
