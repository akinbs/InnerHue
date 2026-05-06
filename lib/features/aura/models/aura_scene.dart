import 'aura_option.dart';

class AuraScene {
  final String id;
  final String narrativeText;
  final String questionText;
  final List<AuraOption> options;
  final List<String>? stateTagsRead;
  final List<String>? stateTagsWrite;

  const AuraScene({
    required this.id,
    required this.narrativeText,
    required this.questionText,
    required this.options,
    this.stateTagsRead,
    this.stateTagsWrite,
  });
}
