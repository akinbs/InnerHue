import 'rgb_delta.dart';
import 'zodiac_enums.dart';

class ZodiacSign {
  final String id;
  final String name;
  final String symbol;
  final int startMonth;
  final int startDay;
  final int endMonth;
  final int endDay;
  final ZodiacElement element;
  final ZodiacModality modality;
  final ZodiacPolarity polarity;
  final RgbDelta archetypeDelta;
  final String auraLabel;
  final String shortDescription;

  const ZodiacSign({
    required this.id,
    required this.name,
    required this.symbol,
    required this.startMonth,
    required this.startDay,
    required this.endMonth,
    required this.endDay,
    required this.element,
    required this.modality,
    required this.polarity,
    required this.archetypeDelta,
    required this.auraLabel,
    required this.shortDescription,
  });
}
