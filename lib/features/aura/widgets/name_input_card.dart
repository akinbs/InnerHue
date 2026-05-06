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
    final borderColor =
        _focused ? AppColors.primaryNeon : AppColors.surface.withAlpha(200);

    return AnimatedContainer(
      duration: const Duration(milliseconds: 250),
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
      decoration: BoxDecoration(
        color: AppColors.surface,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(
          color: borderColor,
          width: _focused ? 1.5 : 1.0,
        ),
        boxShadow: _focused
            ? [
                BoxShadow(
                  color: AppColors.primaryNeon.withAlpha(40),
                  blurRadius: 20,
                  spreadRadius: 2,
                ),
              ]
            : [],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          TextField(
            controller: widget.controller,
            focusNode: _focusNode,
            style: const TextStyle(
              color: AppColors.textPrimary,
              fontSize: 18,
              fontWeight: FontWeight.w500,
            ),
            decoration: InputDecoration(
              labelText: 'İsmin',
              hintText: 'Örn. Akın',
              labelStyle: TextStyle(
                color: _focused ? AppColors.primaryNeon : AppColors.textSecondary,
                fontSize: 14,
              ),
              hintStyle: const TextStyle(color: AppColors.textSecondary),
              border: InputBorder.none,
              errorText: widget.errorText,
              errorStyle: const TextStyle(color: AppColors.error, fontSize: 12),
            ),
            textCapitalization: TextCapitalization.words,
            onSubmitted: (_) => widget.onSubmit(),
          ),
        ],
      ),
    );
  }
}
