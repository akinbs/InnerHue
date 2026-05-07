import 'package:flutter/material.dart';
import '../../../core/theme/app_colors.dart';
import '../data/aura_story_scenes_data.dart';
import '../logic/story_aura_engine.dart';
import '../models/aura_option.dart';
import '../models/aura_scene.dart';
import '../models/name_aura_result.dart';
import '../models/nationality_aura_result.dart';
import '../models/story_progress.dart';
import '../models/story_state.dart';
import '../models/zodiac_aura_result.dart';
import '../widgets/app_gradient_background.dart';
import '../widgets/app_primary_button.dart';
import '../widgets/story_option_card.dart';
import '../widgets/story_progress_header.dart';
import '../widgets/story_scene_card.dart';
import 'final_result_screen.dart';

class StorySceneScreen extends StatefulWidget {
  final NameAuraResult nameResult;
  final ZodiacAuraResult zodiacResult;
  final NationalityAuraResult nationalityResult;

  const StorySceneScreen({
    super.key,
    required this.nameResult,
    required this.zodiacResult,
    required this.nationalityResult,
  });

  @override
  State<StorySceneScreen> createState() => _StorySceneScreenState();
}

class _StorySceneScreenState extends State<StorySceneScreen> {
  static final List<AuraScene> _scenes = AuraStoryScenesData.scenes;

  StoryState _storyState = StoryState.initial();
  int _currentIndex = 0;
  AuraOption? _selectedOption;

  bool get _isLastScene => _currentIndex == _scenes.length - 1;

  void _selectOption(AuraOption option) {
    setState(() => _selectedOption = option);
  }

  void _advance() {
    final selected = _selectedOption;
    if (selected == null) return;

    final scene = _scenes[_currentIndex];
    final updatedState = _storyState.addSelection(scene, selected);

    if (_isLastScene) {
      final storyResult = StoryAuraEngine.analyze(updatedState);
      Navigator.of(context).pushReplacement(
        PageRouteBuilder(
          pageBuilder: (_, _, _) => FinalResultScreen(
            nameResult: widget.nameResult,
            zodiacResult: widget.zodiacResult,
            nationalityResult: widget.nationalityResult,
            storyResult: storyResult,
          ),
          transitionsBuilder: (_, animation, _, child) =>
              FadeTransition(opacity: animation, child: child),
          transitionDuration: const Duration(milliseconds: 500),
        ),
      );
      return;
    }

    setState(() {
      _storyState = updatedState;
      _currentIndex++;
      _selectedOption = null;
    });
  }

  @override
  Widget build(BuildContext context) {
    final scene = _scenes[_currentIndex];
    final progress = StoryProgress(
      currentIndex: _currentIndex,
      totalScenes: _scenes.length,
    );

    return PopScope(
      canPop: false,
      child: Scaffold(
        backgroundColor: AppColors.background,
        body: AppGradientBackground(
          child: SafeArea(
            child: Column(
              children: [
                // Progress header (static, no animation)
                Padding(
                  padding: const EdgeInsets.fromLTRB(24, 20, 24, 0),
                  child: StoryProgressHeader(
                    progress: progress,
                    sceneTitle: scene.sceneTitle,
                  ),
                ),
                // Scene content with fade+slide transition
                Expanded(
                  child: SingleChildScrollView(
                    padding: const EdgeInsets.fromLTRB(24, 20, 24, 0),
                    child: AnimatedSwitcher(
                      duration: const Duration(milliseconds: 260),
                      transitionBuilder: (child, animation) {
                        return FadeTransition(
                          opacity: animation,
                          child: SlideTransition(
                            position: Tween<Offset>(
                              begin: const Offset(0, 0.04),
                              end: Offset.zero,
                            ).animate(
                              CurvedAnimation(
                                parent: animation,
                                curve: Curves.easeOut,
                              ),
                            ),
                            child: child,
                          ),
                        );
                      },
                      child: Column(
                        key: ValueKey(_currentIndex),
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          StorySceneCard(scene: scene),
                          const SizedBox(height: 16),
                          ...scene.options.map(
                            (option) => Padding(
                              padding: const EdgeInsets.only(bottom: 10),
                              child: StoryOptionCard(
                                option: option,
                                isSelected: _selectedOption?.id == option.id,
                                onTap: () => _selectOption(option),
                              ),
                            ),
                          ),
                          const SizedBox(height: 12),
                        ],
                      ),
                    ),
                  ),
                ),
                // Advance button — pinned at bottom
                Padding(
                  padding: const EdgeInsets.fromLTRB(24, 10, 24, 28),
                  child: AppPrimaryButton(
                    label: _isLastScene ? 'Spektrumu Tamamla' : 'Devam Et',
                    onPressed: _selectedOption != null ? _advance : null,
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
