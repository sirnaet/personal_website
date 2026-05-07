import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:personal_website/services/contact_form_service.dart';
import 'package:personal_website/theme/app_theme.dart';
import 'package:personal_website/widgets/cyber_button.dart';
import 'package:personal_website/widgets/magnetic_hover.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:url_launcher/url_launcher.dart';

class ContactSection extends StatefulWidget {
  const ContactSection({super.key});

  @override
  State<ContactSection> createState() => _ContactSectionState();
}

class _ContactSectionState extends State<ContactSection> {
  static const _contactEmail = 'brian.smemusi@gmail.com';
  static final _emailPattern = RegExp(r'^[^@\s]+@[^@\s]+\.[^@\s]+$');
  final _contactFormService = ContactFormService();
  final _formKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  final _emailController = TextEditingController();
  final _messageController = TextEditingController();
  bool _emailCopied = false;
  bool _isSubmitting = false;

  @override
  void dispose() {
    _nameController.dispose();
    _emailController.dispose();
    _messageController.dispose();
    super.dispose();
  }

  Future<void> _copyEmail() async {
    await Clipboard.setData(const ClipboardData(text: _contactEmail));
    setState(() {
      _emailCopied = true;
    });
    Future.delayed(const Duration(seconds: 2), () {
      if (mounted) {
        setState(() {
          _emailCopied = false;
        });
      }
    });
  }

  void _showSnackBar(String message, {Color backgroundColor = AppTheme.accentColor}) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
        backgroundColor: backgroundColor,
      ),
    );
  }

  Future<void> _handleSubmit() async {
    final formState = _formKey.currentState;
    if (formState == null || !formState.validate() || _isSubmitting) {
      return;
    }

    setState(() {
      _isSubmitting = true;
    });

    final name = _nameController.text.trim();
    final email = _emailController.text.trim();
    final message = _messageController.text.trim();

    try {
      await _contactFormService.submit(
        name: name,
        email: email,
        message: message,
      );

      if (!mounted) {
        return;
      }

      _showSnackBar('Message sent successfully.');
      _nameController.clear();
      _emailController.clear();
      _messageController.clear();
      formState.reset();
    } on ContactFormException catch (error) {
      if (mounted) {
        _showSnackBar(
          error.message == 'Contact form endpoint is not configured.'
              ? 'CONTACT_FORM_ENDPOINT is missing. Add your Google Apps Script URL before using the form.'
              : 'Unable to send your message. ${error.message}',
          backgroundColor: Colors.red,
        );
      }
    } catch (_) {
      if (mounted) {
        _showSnackBar(
          'Unable to send your message right now. Please try again later or email $_contactEmail directly.',
          backgroundColor: Colors.red,
        );
      }
    } finally {
      if (mounted) {
        setState(() {
          _isSubmitting = false;
        });
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final isMobile = size.width < 768;

    return Container(
      width: double.infinity,
      padding: EdgeInsets.symmetric(
        horizontal: isMobile ? 24 : 80,
        vertical: 100,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Let\'s work together',
                style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                      color: AppTheme.textPrimary,
                    ),
              ),
              const SizedBox(height: 16),
              Text(
                'I\'m open to internships, part-time roles, freelance work, and interesting side projects. The fastest way to reach me is by email, but you can also find me across the platforms below.',
                style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                      color: AppTheme.textSecondary,
                    ),
              ),
            ],
          )
              .animate()
              .fadeIn(duration: 600.ms)
              .slideY(begin: -0.2, end: 0),
          const SizedBox(height: 60),
          // Contact content
          LayoutBuilder(
            builder: (context, constraints) {
              if (isMobile) {
                return Column(
                  children: [
                    _ContactInfo(
                      onEmailTap: _copyEmail,
                      emailCopied: _emailCopied,
                    ),
                    const SizedBox(height: 40),
                    _ContactForm(
                      formKey: _formKey,
                      nameController: _nameController,
                      emailController: _emailController,
                      messageController: _messageController,
                      onSubmit: _handleSubmit,
                      isSubmitting: _isSubmitting,
                    ),
                  ],
                );
              } else {
                return Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                      flex: 1,
                      child: _ContactInfo(
                        onEmailTap: _copyEmail,
                        emailCopied: _emailCopied,
                      ),
                    ),
                    const SizedBox(width: 60),
                    Expanded(
                      flex: 1,
                      child: _ContactForm(
                        formKey: _formKey,
                        nameController: _nameController,
                        emailController: _emailController,
                        messageController: _messageController,
                        onSubmit: _handleSubmit,
                        isSubmitting: _isSubmitting,
                      ),
                    ),
                  ],
                );
              }
            },
          )
              .animate()
              .fadeIn(delay: 200.ms, duration: 600.ms)
              .slideY(begin: 0.2, end: 0),
        ],
      ),
    );
  }
}

class _ContactInfo extends StatelessWidget {
  final VoidCallback? onEmailTap;
  final bool emailCopied;

  const _ContactInfo({
    this.onEmailTap,
    this.emailCopied = false,
  });

  @override
  Widget build(BuildContext context) {
    return MagneticHover(
      strength: 12,
      scale: 1.01,
      child: Container(
        padding: const EdgeInsets.all(24),
        decoration: BoxDecoration(
          color: AppTheme.cardColor.withValues(alpha: 0.45),
          border: Border.all(
            color: AppTheme.borderColor,
            width: 1.5,
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Get in touch',
              style: Theme.of(context).textTheme.titleLarge,
            ),
            const SizedBox(height: 24),
            _ContactItem(
              icon: const FaIcon(
                FontAwesomeIcons.envelope,
                color: AppTheme.accentColor,
                size: 24,
              ),
              label: 'Email',
              value: emailCopied ? 'Copied!' : _ContactSectionState._contactEmail,
              onTap: onEmailTap,
            ),
            const SizedBox(height: 20),
            _ContactItem(
              icon: const FaIcon(
                FontAwesomeIcons.github,
                color: AppTheme.accentColor,
                size: 24,
              ),
              label: 'GitHub',
              value: 'github.com/sirnaet',
              onTap: () async {
                const url = 'https://github.com/sirnaet';
                final uri = Uri.parse(url);
                if (await canLaunchUrl(uri)) {
                  await launchUrl(uri, mode: LaunchMode.externalApplication);
                }
              },
            ),
            const SizedBox(height: 20),
            _ContactItem(
              icon: const FaIcon(
                FontAwesomeIcons.linkedin,
                color: AppTheme.accentColor,
                size: 24,
              ),
              label: 'LinkedIn',
              value: 'linkedin.com/in/sanaet-memusi-a491692ab',
              onTap: () async {
                const url = 'https://linkedin.com/in/sanaet-memusi-a491692ab';
                final uri = Uri.parse(url);
                if (await canLaunchUrl(uri)) {
                  await launchUrl(uri, mode: LaunchMode.externalApplication);
                }
              },
            ),
            const SizedBox(height: 20),
            _ContactItem(
              icon: const FaIcon(
                FontAwesomeIcons.instagram,
                color: AppTheme.accentColor,
                size: 24,
              ),
              label: 'Instagram',
              value: 'instagram.com/sirnaet',
              onTap: () async {
                const url = 'https://instagram.com/sirnaet';
                final uri = Uri.parse(url);
                if (await canLaunchUrl(uri)) {
                  await launchUrl(uri, mode: LaunchMode.externalApplication);
                }
              },
            ),
            const SizedBox(height: 20),
            _ContactItem(
              icon: const FaIcon(
                FontAwesomeIcons.xTwitter,
                color: AppTheme.accentColor,
                size: 24,
              ),
              label: 'X (formerly Twitter)',
              value: 'x.com/Sir__naet',
              onTap: () async {
                const url = 'https://x.com/Sir__naet';
                final uri = Uri.parse(url);
                if (await canLaunchUrl(uri)) {
                  await launchUrl(uri, mode: LaunchMode.externalApplication);
                }
              },
            ),
            const SizedBox(height: 20),
            _ContactItem(
              icon: const FaIcon(
                FontAwesomeIcons.whatsapp,
                color: AppTheme.accentColor,
                size: 24,
              ),
              label: 'WhatsApp',
              value: 'wa.me/254798131855',
              onTap: () async {
                const url = 'https://wa.me/254798131855';
                final uri = Uri.parse(url);
                if (await canLaunchUrl(uri)) {
                  await launchUrl(uri, mode: LaunchMode.externalApplication);
                }
              },
            ),
            const SizedBox(height: 20),
            _ContactItem(
              icon: const FaIcon(
                FontAwesomeIcons.tiktok,
                color: AppTheme.accentColor,
                size: 24,
              ),
              label: 'TikTok',
              value: 'tiktok.com/sirnaet',
              onTap: () async {
                const url = 'https://tiktok.com/@sirnaet';
                final uri = Uri.parse(url);
                if (await canLaunchUrl(uri)) {
                  await launchUrl(uri, mode: LaunchMode.externalApplication);
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}

class _ContactItem extends StatelessWidget {
  final Widget icon;
  final String label;
  final String value;
  final VoidCallback? onTap;

  const _ContactItem({
    required this.icon,
    required this.label,
    required this.value,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      cursor: onTap != null ? SystemMouseCursors.click : SystemMouseCursors.basic,
      child: GestureDetector(
        onTap: onTap,
        child: MagneticHover(
          strength: 10,
          scale: 1.02,
          child: Container(
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: AppTheme.cardColor,
              border: Border.all(
                color: AppTheme.borderColor,
                width: 1.5,
              ),
            ),
            child: Row(
              children: [
                icon,
                const SizedBox(width: 16),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        label,
                        style: Theme.of(context).textTheme.bodySmall?.copyWith(
                              color: AppTheme.textSecondary,
                            ),
                      ),
                      const SizedBox(height: 4),
                      Text(
                        value,
                        style: Theme.of(context).textTheme.bodyMedium,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class _ContactForm extends StatelessWidget {
  final GlobalKey<FormState> formKey;
  final TextEditingController nameController;
  final TextEditingController emailController;
  final TextEditingController messageController;
  final Future<void> Function() onSubmit;
  final bool isSubmitting;

  const _ContactForm({
    required this.formKey,
    required this.nameController,
    required this.emailController,
    required this.messageController,
    required this.onSubmit,
    required this.isSubmitting,
  });

  @override
  Widget build(BuildContext context) {
    return MagneticHover(
      strength: 12,
      scale: 1.01,
      child: Container(
        padding: const EdgeInsets.all(24),
        decoration: BoxDecoration(
          color: AppTheme.cardColor.withValues(alpha: 0.45),
          border: Border.all(
            color: AppTheme.borderColor,
            width: 1.5,
          ),
        ),
        child: Form(
          key: formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Send a Message',
                style: Theme.of(context).textTheme.headlineMedium,
              ),
              const SizedBox(height: 24),
              _FormField(
                controller: nameController,
                label: 'Name',
                icon: Icons.person,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter your name';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 20),
              _FormField(
                controller: emailController,
                label: 'Email',
                icon: Icons.email,
                keyboardType: TextInputType.emailAddress,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter your email';
                  }
                  if (!_ContactSectionState._emailPattern.hasMatch(
                    value.trim(),
                  )) {
                    return 'Please enter a valid email';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 20),
              _FormField(
                controller: messageController,
                label: 'Message',
                icon: Icons.message,
                maxLines: 6,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter a message';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 24),
              CyberButton(
                text: isSubmitting ? 'Opening Email...' : 'Send Message',
                isPrimary: true,
                icon: isSubmitting ? Icons.hourglass_top : Icons.send,
                onPressed: isSubmitting ? null : () => onSubmit(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _FormField extends StatefulWidget {
  final TextEditingController controller;
  final String label;
  final IconData icon;
  final TextInputType? keyboardType;
  final int? maxLines;
  final String? Function(String?)? validator;

  const _FormField({
    required this.controller,
    required this.label,
    required this.icon,
    this.keyboardType,
    this.maxLines,
    this.validator,
  });

  @override
  State<_FormField> createState() => _FormFieldState();
}

class _FormFieldState extends State<_FormField> {
  bool _isFocused = false;

  @override
  Widget build(BuildContext context) {
    return MagneticHover(
      strength: 8,
      scale: 1.01,
      child: Focus(
        onFocusChange: (hasFocus) {
          setState(() => _isFocused = hasFocus);
        },
        child: TextFormField(
          controller: widget.controller,
          keyboardType: widget.keyboardType,
          maxLines: widget.maxLines ?? 1,
          validator: widget.validator,
          style: Theme.of(context).textTheme.bodyLarge,
          decoration: InputDecoration(
            labelText: widget.label,
            prefixIcon: Icon(
              widget.icon,
              color: _isFocused
                  ? AppTheme.accentColor
                  : AppTheme.textSecondary,
            ),
            labelStyle: TextStyle(
              color: _isFocused
                  ? AppTheme.accentColor
                  : AppTheme.textSecondary,
            ),
            enabledBorder: const OutlineInputBorder(
              borderSide: BorderSide(
                color: AppTheme.borderColor,
                width: 1.5,
              ),
            ),
            focusedBorder: const OutlineInputBorder(
              borderSide: BorderSide(
                color: AppTheme.accentColor,
                width: 2,
              ),
            ),
            errorBorder: const OutlineInputBorder(
              borderSide: BorderSide(
                color: Colors.red,
                width: 1.5,
              ),
            ),
            focusedErrorBorder: const OutlineInputBorder(
              borderSide: BorderSide(
                color: Colors.red,
                width: 2,
              ),
            ),
            filled: true,
            fillColor: AppTheme.cardColor,
          ),
        ),
      ),
    );
  }
}
