import 'package:flutter/material.dart';
import '../../../core/theme/app_colors.dart';
import '../models/story_progress.dart';

class StoryProgressHeader extends StatelessWidget {
  final StoryProgress progress;
  final String? sceneTitle;

  const StoryProgressHeader({
    super.key,
    required this.progress,
    this.sceneTitle,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            if (sceneTitle != null && sceneTitle!.isNotEmpty)
              Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                decoration: BoxDecoration(
                  color: AppColors.primaryNeon.withAlpha(18),
                  borderRadius: BorderRadius.circular(999),
                  border: Border.all(
                    color: AppColors.primaryNeon.withAlpha(55),
                  ),
                ),
                child: Text(
                  sceneTitle!,
                  style: const TextStyle(
                    color: AppColors.softViolet,
                    fontSize: 11,
                    fontWeight: FontWeight.w500,
                    letterSpacing: 0.3,
                  ),
                ),
              )
            else
              const SizedBox.shrink(),
            Text(
              'Sahne ${progress.currentIndex + 1} / ${progress.totalScenes}',
              style: const TextStyle(
                color: AppColors.textMuted,
                fontSize: 12,
                fontWeight: FontWeight.w500,
              ),
            ),
          ],
        ),
        const SizedBox(height: 10),
        ClipRRect(
          borderRadius: BorderRadius.circular(4),
          child: LinearProgressIndicator(
            value: progress.progressRatio,
            minHeight: 3,
            backgroundColor: AppColors.borderSubtle,
            valueColor: const AlwaysStoppedAnimation<Color>(
              AppColors.softViolet,
            ),
          ),
        ),
      ],
    );
  }
}
