import 'package:flutter/material.dart';
import '../../../core/theme/app_colors.dart';
import '../logic/name_aura_engine.dart';
import '../widgets/app_primary_button.dart';
import '../widgets/name_input_card.dart';
import 'birth_date_input_screen.dart';

class NameInputScreen extends StatefulWidget {
  const NameInputScreen({super.key});

  @override
  State<NameInputScreen> createState() => _NameInputScreenState();
}

class _NameInputScreenState extends State<NameInputScreen> {
  final _controller = TextEditingController();
  String? _errorText;

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _onSubmit() {
    final input = _controller.text.trim();

    if (input.isEmpty) {
      setState(() => _errorText = 'Devam etmek için bir isim girmelisin.');
      return;
    }

    setState(() => _errorText = null);

    final result = NameAuraEngine.analyze(input);

    Navigator.of(context).push(
      PageRouteBuilder(
        pageBuilder: (_, _, _) => BirthDateInputScreen(nameResult: result),
        transitionsBuilder: (_, animation, _, child) {
          return FadeTransition(opacity: animation, child: child);
        },
        transitionDuration: const Duration(milliseconds: 400),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 28, vertical: 40),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Spacer(),
              Text(
                'İsminle başlayalım',
                style: Theme.of(context).textTheme.headlineLarge,
              ),
              const SizedBox(height: 16),
              Text(
                'İsmin, aura motoruna ilk sembolik renk tohumunu verir. '
                'Bu bir kişilik tanısı değil, yaratıcı bir spektrum başlangıcıdır.',
                style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                  height: 1.7,
                ),
              ),
              const SizedBox(height: 36),
              NameInputCard(
                controller: _controller,
                errorText: _errorText,
                onSubmit: _onSubmit,
              ),
              const Spacer(flex: 2),
              AppPrimaryButton(
                label: 'İsim Tohumunu Oluştur',
                onPressed: _onSubmit,
              ),
              const SizedBox(height: 16),
            ],
          ),
        ),
      ),
    );
  }
}
