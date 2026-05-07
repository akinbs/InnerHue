import 'aura_option.dart';

class AuraScene {
  final String id;
  final String narrativeText;
  final String questionText;
  final List<AuraOption> options;
  final int order;
  final String? sceneTitle;

  const AuraScene({
    required this.id,
    required this.narrativeText,
    required this.questionText,
    required this.options,
    required this.order,
    this.sceneTitle,
  });
}
