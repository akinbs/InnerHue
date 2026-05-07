import 'package:flutter/material.dart';
import '../../../core/theme/app_colors.dart';
import '../models/aura_scene.dart';

class StorySceneCard extends StatelessWidget {
  final AuraScene scene;

  const StorySceneCard({super.key, required this.scene});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(22),
      decoration: BoxDecoration(
        color: AppColors.surface,
        borderRadius: BorderRadius.circular(24),
        border: Border.all(color: AppColors.borderSubtle),
        boxShadow: const [
          BoxShadow(
            color: Color(0x20000000),
            blurRadius: 20,
            offset: Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            scene.narrativeText,
            style: const TextStyle(
              color: AppColors.textSecondary,
              fontSize: 15,
              height: 1.75,
              fontWeight: FontWeight.w400,
            ),
          ),
          const SizedBox(height: 18),
          Container(
            height: 1,
            color: AppColors.borderSubtle,
          ),
          const SizedBox(height: 16),
          Text(
            scene.questionText,
            style: const TextStyle(
              color: AppColors.textPrimary,
              fontSize: 17,
              fontWeight: FontWeight.w600,
              height: 1.4,
            ),
          ),
        ],
      ),
    );
  }
}
