import 'package:flutter/material.dart';
import '../../../core/theme/app_colors.dart';

class NameInputCard extends StatefulWidget {
  final TextEditingController controller;
  final String? errorText;
  final VoidCallback onSubmit;

  const NameInputCard({
    super.key,
    required this.controller,
    required this.onSubmit,
    this.errorText,
  });

  @override
  State<NameInputCard> createState() => _NameInputCardState();
}

class _NameInputCardState extends State<NameInputCard> {
  final _focusNode = FocusNode();
  bool _focused = false;

  @override
  void initState() {
    super.initState();
    _focusNode.addListener(() {
      setState(() => _focused = _focusNode.hasFocus);
    });
  }

  @override
  void dispose() {
    _focusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        AnimatedContainer(
          duration: const Duration(milliseconds: 250),
          padding: const EdgeInsets.fromLTRB(20, 8, 20, 8),
          decoration: BoxDecoration(
            color: AppColors.surface,
            borderRadius: BorderRadius.circular(22),
            border: Border.all(
              color: _focused
                  ? AppColors.primaryNeon.withAlpha(180)
                  : AppColors.borderSubtle,
              width: _focused ? 1.5 : 1.0,
            ),
            boxShadow: _focused
                ? [
                    BoxShadow(
                      color: AppColors.primaryNeon.withAlpha(30),
                      blurRadius: 28,
                      spreadRadius: 0,
                    ),
                  ]
                : const [
                    BoxShadow(
                      color: Color(0x1C000000),
                      blurRadius: 20,
                      offset: Offset(0, 4),
                    ),
                  ],
          ),
          child: TextField(
            controller: widget.controller,
            focusNode: _focusNode,
            style: const TextStyle(
              color: AppColors.textPrimary,
              fontSize: 18,
              fontWeight: FontWeight.w500,
              height: 1.4,
            ),
            decoration: InputDecoration(
              labelText: 'İsmin',
              hintText: 'Örn. Akın',
              labelStyle: TextStyle(
                color: _focused
                    ? AppColors.primaryNeon
                    : AppColors.textSecondary,
                fontSize: 14,
                fontWeight: FontWeight.w400,
              ),
              hintStyle: const TextStyle(
                color: AppColors.textMuted,
                fontSize: 16,
              ),
              border: InputBorder.none,
              errorBorder: InputBorder.none,
              enabledBorder: InputBorder.none,
              focusedBorder: InputBorder.none,
              contentPadding: const EdgeInsets.symmetric(vertical: 14),
            ),
            textCapitalization: TextCapitalization.words,
            onSubmitted: (_) => widget.onSubmit(),
          ),
        ),
        if (widget.errorText != null)
          Padding(
            padding: const EdgeInsets.only(top: 8, left: 6),
            child: Text(
              widget.errorText!,
              style: const TextStyle(
                color: AppColors.error,
                fontSize: 12,
                height: 1.4,
              ),
            ),
          ),
      ],
    );
  }
}
