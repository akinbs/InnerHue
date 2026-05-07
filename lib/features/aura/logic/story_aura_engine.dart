import '../../../core/constants/app_constants.dart';
import '../../../core/utils/clamp_utils.dart';
import '../models/axis_delta.dart';
import '../models/rgb_delta.dart';
import '../models/story_aura_result.dart';
import '../models/story_state.dart';
import 'story_score_engine.dart';

class StoryAuraEngine {
  const StoryAuraEngine._();

  static StoryAuraResult analyze(StoryState state) {
    final raw = state.accumulatedAxisDelta;
    final normalized = _normalizeAxisValues(raw);
    final storyDelta = StoryScoreEngine.compute(raw);
    final dominant = _findDominantAxis(normalized);
    final notes = _buildDebugNotes(raw, normalized, storyDelta);

    return StoryAuraResult(
      selectedOptionIds: List.unmodifiable(state.selectedOptionIds),
      accumulatedAxisDelta: raw,
      normalizedActivation: normalized.activation,
      normalizedGrounding: normalized.grounding,
      normalizedReflection: normalized.reflection,
      normalizedOpenness: normalized.openness,
      normalizedThreshold: normalized.threshold,
      storyDelta: storyDelta,
      dominantAxis: dominant,
      displayTitle: 'Hikaye Katmanı Oluştu',
      shortDescription:
          'Hikayedeki seçimlerin, spektrumunun ana renk hareketini oluşturdu.',
      debugNotes: notes,
    );
  }

  static AxisDelta _normalizeAxisValues(AxisDelta raw) {
    return AxisDelta(
      activation: ClampUtils.clampDouble(
          raw.activation / AppConstants.activationMax, -1.0, 1.0),
      grounding: ClampUtils.clampDouble(
          raw.grounding / AppConstants.groundingMax, -1.0, 1.0),
      reflection: ClampUtils.clampDouble(
          raw.reflection / AppConstants.reflectionMax, -1.0, 1.0),
      openness: ClampUtils.clampDouble(
          raw.openness / AppConstants.opennessMax, -1.0, 1.0),
      threshold: ClampUtils.clampDouble(
          raw.threshold / AppConstants.thresholdMax, -1.0, 1.0),
    );
  }

  static String _findDominantAxis(AxisDelta normalized) {
    final values = <String, double>{
      'activation': normalized.activation.abs(),
      'grounding': normalized.grounding.abs(),
      'reflection': normalized.reflection.abs(),
      'openness': normalized.openness.abs(),
      'threshold': normalized.threshold.abs(),
    };

    final sorted = values.entries.toList()
      ..sort((a, b) => b.value.compareTo(a.value));

    if (sorted.length >= 2 && sorted[0].value - sorted[1].value < 0.10) {
      return 'balanced';
    }
    return sorted[0].key;
  }

  static List<String> _buildDebugNotes(
    AxisDelta raw,
    AxisDelta normalized,
    RgbDelta delta,
  ) {
    String s(int v) => v >= 0 ? '+$v' : '$v';
    String n(double v) => v.toStringAsFixed(2);
    return [
      'Ham: A=${raw.activation.toStringAsFixed(0)} G=${raw.grounding.toStringAsFixed(0)} R=${raw.reflection.toStringAsFixed(0)} O=${raw.openness.toStringAsFixed(0)} T=${raw.threshold.toStringAsFixed(0)}',
      'Norm: A=${n(normalized.activation)} G=${n(normalized.grounding)} R=${n(normalized.reflection)} O=${n(normalized.openness)} T=${n(normalized.threshold)}',
      'Story delta: R${s(delta.red)} G${s(delta.green)} B${s(delta.blue)}',
    ];
  }
}
