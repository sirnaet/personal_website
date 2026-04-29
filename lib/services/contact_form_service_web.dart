// ignore_for_file: avoid_web_libraries_in_flutter, deprecated_member_use

import 'dart:async';
import 'dart:html' as html;

class ContactFormService {
  static const _defaultEndpoint =
      'https://script.google.com/macros/s/AKfycbxc2ziUnXF0h31ExszdkU7NfuyoAJQwD2qhgeHUB_83rPwV4joxx1r-7QLn6SyMc6L-qA/exec';
  static const _endpoint = String.fromEnvironment(
    'CONTACT_FORM_ENDPOINT',
    defaultValue: _defaultEndpoint,
  );

  bool get isConfigured => _endpoint.trim().isNotEmpty;

  Future<void> submit({
    required String name,
    required String email,
    required String message,
  }) async {
    if (!isConfigured) {
      throw const ContactFormException(
        'Contact form endpoint is not configured.',
      );
    }

    final uri = Uri.tryParse(_endpoint.trim());
    if (uri == null) {
      throw const ContactFormException(
        'Contact form endpoint is invalid.',
      );
    }

    final targetName =
        'contact_form_target_${DateTime.now().microsecondsSinceEpoch}';
    final iframe = html.IFrameElement()
      ..name = targetName
      ..style.display = 'none';
    final form = html.FormElement()
      ..method = 'POST'
      ..action = uri.toString()
      ..target = targetName
      ..style.display = 'none';

    void addHiddenField(String fieldName, String value) {
      form.children.add(
        html.InputElement(type: 'hidden')
          ..name = fieldName
          ..value = value,
      );
    }

    addHiddenField('name', name);
    addHiddenField('email', email);
    addHiddenField('message', message);
    addHiddenField('timestamp', DateTime.now().toUtc().toIso8601String());

    final body = html.document.body;
    if (body == null) {
      throw const ContactFormException('Document body is unavailable.');
    }

    final completer = Completer<void>();
    late final StreamSubscription<html.Event> loadSubscription;
    Timer? timeout;

    loadSubscription = iframe.onLoad.listen((_) {
      if (!completer.isCompleted) {
        completer.complete();
      }
    });

    body.children.add(iframe);
    body.children.add(form);

    timeout = Timer(const Duration(seconds: 12), () {
      if (!completer.isCompleted) {
        completer.complete();
      }
    });

    try {
      form.submit();
      await completer.future;
    } finally {
      timeout.cancel();
      await loadSubscription.cancel();
      form.remove();
      iframe.remove();
    }
  }
}

class ContactFormException implements Exception {
  final String message;

  const ContactFormException(this.message);

  @override
  String toString() => message;
}
