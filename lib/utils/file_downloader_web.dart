import 'dart:html' as html;

Future<void> downloadFile(String url, {String? filename}) async {
  final anchor = html.AnchorElement(href: url)
    ..style.display = 'none'
    ..download = filename ?? '';

  html.document.body?.children.add(anchor);
  anchor.click();
  anchor.remove();
}
