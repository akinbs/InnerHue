import 'flag_color_weight.dart';

class CountryAuraProfile {
  final String countryCode;
  final String countryName;
  final List<FlagColorWeight> flagColors;
  final String? regionTag;

  const CountryAuraProfile({
    required this.countryCode,
    required this.countryName,
    required this.flagColors,
    this.regionTag,
  });
}
