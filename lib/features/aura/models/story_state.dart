import 'axis_delta.dart';

class StoryState {
  final List<String> selectedOptionIds;
  final AxisDelta accumulatedAxisDelta;
  final Map<String, bool> worldTags;

  const StoryState({
    required this.selectedOptionIds,
    required this.accumulatedAxisDelta,
    required this.worldTags,
  });

  factory StoryState.initial() {
    return const StoryState(
      selectedOptionIds: <String>[],
      accumulatedAxisDelta: AxisDelta.zero(),
      worldTags: <String, bool>{},
    );
  }

  StoryState addSelection({
    required String optionId,
    required AxisDelta axisDelta,
    List<String>? tagsToWrite,
  }) {
    final updatedIds = [...selectedOptionIds, optionId];
    final updatedAxis = accumulatedAxisDelta + axisDelta;
    final updatedTags = Map<String, bool>.from(worldTags);
    for (final tag in tagsToWrite ?? const <String>[]) {
      updatedTags[tag] = true;
    }
    return StoryState(
      selectedOptionIds: updatedIds,
      accumulatedAxisDelta: updatedAxis,
      worldTags: updatedTags,
    );
  }
}
