import 'dart:convert';

import 'package:http/http.dart' as http;

class ContactFormService {
  static const _defaultEndpoint =
      'https://script.google.com/macros/s/AKfycbx1OqZD-29bsy0nI3KqzK9ScOgoctTSsIl1oXZkY3wDPZccVAxjhgUuXgicbKbBx7N2/exec';
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

    final response = await http.post(
      uri,
      headers: const {
        'Content-Type': 'application/json',
      },
      body: jsonEncode({
        'name': name,
        'email': email,
        'message': message,
        'timestamp': DateTime.now().toUtc().toIso8601String(),
      }),
    );

    if (response.statusCode < 200 || response.statusCode >= 300) {
      throw ContactFormException(
        'Request failed with status ${response.statusCode}.',
      );
    }
  }
}

class ContactFormException implements Exception {
  final String message;

  const ContactFormException(this.message);

  @override
  String toString() => message;
}
