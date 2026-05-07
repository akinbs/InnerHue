import 'aura_option.dart';
import 'aura_scene.dart';
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

  StoryState addSelection(AuraScene scene, AuraOption option) {
    final updatedIds = [...selectedOptionIds, option.id];
    final updatedAxis = accumulatedAxisDelta + option.axisDelta;
    final updatedTags = Map<String, bool>.from(worldTags);
    for (final tag in option.tags ?? const <String>[]) {
      updatedTags[tag] = true;
    }
    return StoryState(
      selectedOptionIds: updatedIds,
      accumulatedAxisDelta: updatedAxis,
      worldTags: updatedTags,
    );
  }
}
