import '../models/country_aura_profile.dart';
import '../models/flag_color_weight.dart';

class CountryAuraProfilesData {
  const CountryAuraProfilesData._();

  static const List<CountryAuraProfile> _profiles = [
    // Europe
    CountryAuraProfile(
      countryCode: 'TR', countryName: 'Türkiye', regionTag: 'europe',
      flagColors: [
        FlagColorWeight(colorName: 'Red',   red: 227, green: 10,  blue: 23,  weight: 0.85),
        FlagColorWeight(colorName: 'White', red: 255, green: 255, blue: 255, weight: 0.15),
      ],
    ),
    CountryAuraProfile(
      countryCode: 'DE', countryName: 'Almanya', regionTag: 'europe',
      flagColors: [
        FlagColorWeight(colorName: 'Black', red: 0,   green: 0,   blue: 0,   weight: 0.33),
        FlagColorWeight(colorName: 'Red',   red: 221, green: 0,   blue: 0,   weight: 0.33),
        FlagColorWeight(colorName: 'Gold',  red: 255, green: 206, blue: 0,   weight: 0.34),
      ],
    ),
    CountryAuraProfile(
      countryCode: 'FR', countryName: 'Fransa', regionTag: 'europe',
      flagColors: [
        FlagColorWeight(colorName: 'Blue',  red: 0,   green: 85,  blue: 164, weight: 0.33),
        FlagColorWeight(colorName: 'White', red: 255, green: 255, blue: 255, weight: 0.34),
        FlagColorWeight(colorName: 'Red',   red: 239, green: 65,  blue: 53,  weight: 0.33),
      ],
    ),
    CountryAuraProfile(
      countryCode: 'IT', countryName: 'İtalya', regionTag: 'europe',
      flagColors: [
        FlagColorWeight(colorName: 'Green', red: 0,   green: 146, blue: 70,  weight: 0.33),
        FlagColorWeight(colorName: 'White', red: 255, green: 255, blue: 255, weight: 0.34),
        FlagColorWeight(colorName: 'Red',   red: 206, green: 43,  blue: 55,  weight: 0.33),
      ],
    ),
    CountryAuraProfile(
      countryCode: 'ES', countryName: 'İspanya', regionTag: 'europe',
      flagColors: [
        FlagColorWeight(colorName: 'Red',    red: 198, green: 11,  blue: 30,  weight: 0.50),
        FlagColorWeight(colorName: 'Yellow', red: 255, green: 196, blue: 0,   weight: 0.50),
      ],
    ),
    CountryAuraProfile(
      countryCode: 'PT', countryName: 'Portekiz', regionTag: 'europe',
      flagColors: [
        FlagColorWeight(colorName: 'Green', red: 0,   green: 102, blue: 0,   weight: 0.45),
        FlagColorWeight(colorName: 'Red',   red: 255, green: 0,   blue: 0,   weight: 0.55),
      ],
    ),
    CountryAuraProfile(
      countryCode: 'GB', countryName: 'Birleşik Krallık', regionTag: 'europe',
      flagColors: [
        FlagColorWeight(colorName: 'Blue',  red: 1,   green: 33,  blue: 105, weight: 0.45),
        FlagColorWeight(colorName: 'Red',   red: 200, green: 16,  blue: 46,  weight: 0.30),
        FlagColorWeight(colorName: 'White', red: 255, green: 255, blue: 255, weight: 0.25),
      ],
    ),
    CountryAuraProfile(
      countryCode: 'NL', countryName: 'Hollanda', regionTag: 'europe',
      flagColors: [
        FlagColorWeight(colorName: 'Red',   red: 174, green: 28,  blue: 40,  weight: 0.33),
        FlagColorWeight(colorName: 'White', red: 255, green: 255, blue: 255, weight: 0.34),
        FlagColorWeight(colorName: 'Blue',  red: 33,  green: 70,  blue: 139, weight: 0.33),
      ],
    ),
    CountryAuraProfile(
      countryCode: 'RU', countryName: 'Rusya', regionTag: 'europe',
      flagColors: [
        FlagColorWeight(colorName: 'White', red: 255, green: 255, blue: 255, weight: 0.34),
        FlagColorWeight(colorName: 'Blue',  red: 0,   green: 57,  blue: 166, weight: 0.33),
        FlagColorWeight(colorName: 'Red',   red: 213, green: 43,  blue: 30,  weight: 0.33),
      ],
    ),
    CountryAuraProfile(
      countryCode: 'GR', countryName: 'Yunanistan', regionTag: 'europe',
      flagColors: [
        FlagColorWeight(colorName: 'Blue',  red: 13,  green: 94,  blue: 175, weight: 0.60),
        FlagColorWeight(colorName: 'White', red: 255, green: 255, blue: 255, weight: 0.40),
      ],
    ),
    CountryAuraProfile(
      countryCode: 'SE', countryName: 'İsveç', regionTag: 'europe',
      flagColors: [
        FlagColorWeight(colorName: 'Blue',   red: 0,   green: 106, blue: 167, weight: 0.70),
        FlagColorWeight(colorName: 'Yellow', red: 254, green: 204, blue: 0,   weight: 0.30),
      ],
    ),
    CountryAuraProfile(
      countryCode: 'NO', countryName: 'Norveç', regionTag: 'europe',
      flagColors: [
        FlagColorWeight(colorName: 'Red',   red: 186, green: 12,  blue: 47,  weight: 0.55),
        FlagColorWeight(colorName: 'White', red: 255, green: 255, blue: 255, weight: 0.25),
        FlagColorWeight(colorName: 'Blue',  red: 0,   green: 32,  blue: 91,  weight: 0.20),
      ],
    ),
    CountryAuraProfile(
      countryCode: 'UA', countryName: 'Ukrayna', regionTag: 'europe',
      flagColors: [
        FlagColorWeight(colorName: 'Blue',   red: 0,   green: 87,  blue: 183, weight: 0.50),
        FlagColorWeight(colorName: 'Yellow', red: 255, green: 215, blue: 0,   weight: 0.50),
      ],
    ),
    CountryAuraProfile(
      countryCode: 'PL', countryName: 'Polonya', regionTag: 'europe',
      flagColors: [
        FlagColorWeight(colorName: 'White', red: 255, green: 255, blue: 255, weight: 0.50),
        FlagColorWeight(colorName: 'Red',   red: 220, green: 20,  blue: 60,  weight: 0.50),
      ],
    ),
    CountryAuraProfile(
      countryCode: 'CH', countryName: 'İsviçre', regionTag: 'europe',
      flagColors: [
        FlagColorWeight(colorName: 'Red',   red: 255, green: 0,   blue: 0,   weight: 0.80),
        FlagColorWeight(colorName: 'White', red: 255, green: 255, blue: 255, weight: 0.20),
      ],
    ),
    // Americas
    CountryAuraProfile(
      countryCode: 'US', countryName: 'Amerika Birleşik Devletleri', regionTag: 'americas',
      flagColors: [
        FlagColorWeight(colorName: 'Red',   red: 178, green: 34,  blue: 52,  weight: 0.40),
        FlagColorWeight(colorName: 'White', red: 255, green: 255, blue: 255, weight: 0.35),
        FlagColorWeight(colorName: 'Blue',  red: 60,  green: 59,  blue: 110, weight: 0.25),
      ],
    ),
    CountryAuraProfile(
      countryCode: 'CA', countryName: 'Kanada', regionTag: 'americas',
      flagColors: [
        FlagColorWeight(colorName: 'Red',   red: 255, green: 0,   blue: 0,   weight: 0.50),
        FlagColorWeight(colorName: 'White', red: 255, green: 255, blue: 255, weight: 0.50),
      ],
    ),
    CountryAuraProfile(
      countryCode: 'BR', countryName: 'Brezilya', regionTag: 'americas',
      flagColors: [
        FlagColorWeight(colorName: 'Green',  red: 0,   green: 156, blue: 59,  weight: 0.65),
        FlagColorWeight(colorName: 'Yellow', red: 255, green: 223, blue: 0,   weight: 0.25),
        FlagColorWeight(colorName: 'Blue',   red: 0,   green: 39,  blue: 118, weight: 0.10),
      ],
    ),
    CountryAuraProfile(
      countryCode: 'AR', countryName: 'Arjantin', regionTag: 'americas',
      flagColors: [
        FlagColorWeight(colorName: 'LightBlue', red: 116, green: 172, blue: 223, weight: 0.66),
        FlagColorWeight(colorName: 'White',     red: 255, green: 255, blue: 255, weight: 0.30),
        FlagColorWeight(colorName: 'Gold',      red: 246, green: 180, blue: 14,  weight: 0.04),
      ],
    ),
    CountryAuraProfile(
      countryCode: 'MX', countryName: 'Meksika', regionTag: 'americas',
      flagColors: [
        FlagColorWeight(colorName: 'Green', red: 0,   green: 104, blue: 71,  weight: 0.33),
        FlagColorWeight(colorName: 'White', red: 255, green: 255, blue: 255, weight: 0.34),
        FlagColorWeight(colorName: 'Red',   red: 206, green: 17,  blue: 38,  weight: 0.33),
      ],
    ),
    // Asia
    CountryAuraProfile(
      countryCode: 'JP', countryName: 'Japonya', regionTag: 'asia',
      flagColors: [
        FlagColorWeight(colorName: 'White', red: 255, green: 255, blue: 255, weight: 0.75),
        FlagColorWeight(colorName: 'Red',   red: 188, green: 0,   blue: 45,  weight: 0.25),
      ],
    ),
    CountryAuraProfile(
      countryCode: 'CN', countryName: 'Çin', regionTag: 'asia',
      flagColors: [
        FlagColorWeight(colorName: 'Red',    red: 222, green: 41,  blue: 16,  weight: 0.90),
        FlagColorWeight(colorName: 'Yellow', red: 255, green: 222, blue: 0,   weight: 0.10),
      ],
    ),
    CountryAuraProfile(
      countryCode: 'KR', countryName: 'Güney Kore', regionTag: 'asia',
      flagColors: [
        FlagColorWeight(colorName: 'White', red: 255, green: 255, blue: 255, weight: 0.60),
        FlagColorWeight(colorName: 'Red',   red: 205, green: 46,  blue: 58,  weight: 0.20),
        FlagColorWeight(colorName: 'Blue',  red: 0,   green: 71,  blue: 160, weight: 0.20),
      ],
    ),
    CountryAuraProfile(
      countryCode: 'IN', countryName: 'Hindistan', regionTag: 'asia',
      flagColors: [
        FlagColorWeight(colorName: 'Saffron', red: 255, green: 153, blue: 51,  weight: 0.33),
        FlagColorWeight(colorName: 'White',   red: 255, green: 255, blue: 255, weight: 0.34),
        FlagColorWeight(colorName: 'Green',   red: 19,  green: 136, blue: 8,   weight: 0.28),
        FlagColorWeight(colorName: 'Navy',    red: 0,   green: 0,   blue: 128, weight: 0.05),
      ],
    ),
    CountryAuraProfile(
      countryCode: 'AZ', countryName: 'Azerbaycan', regionTag: 'asia',
      flagColors: [
        FlagColorWeight(colorName: 'Blue',  red: 0,   green: 181, blue: 226, weight: 0.33),
        FlagColorWeight(colorName: 'Red',   red: 239, green: 51,  blue: 64,  weight: 0.34),
        FlagColorWeight(colorName: 'Green', red: 80,  green: 158, blue: 47,  weight: 0.33),
      ],
    ),
    CountryAuraProfile(
      countryCode: 'PK', countryName: 'Pakistan', regionTag: 'asia',
      flagColors: [
        FlagColorWeight(colorName: 'Green', red: 1,   green: 65,  blue: 28,  weight: 0.75),
        FlagColorWeight(colorName: 'White', red: 255, green: 255, blue: 255, weight: 0.25),
      ],
    ),
    // Africa & Middle East
    CountryAuraProfile(
      countryCode: 'EG', countryName: 'Mısır', regionTag: 'africa',
      flagColors: [
        FlagColorWeight(colorName: 'Red',   red: 206, green: 17,  blue: 38,  weight: 0.33),
        FlagColorWeight(colorName: 'White', red: 255, green: 255, blue: 255, weight: 0.34),
        FlagColorWeight(colorName: 'Black', red: 0,   green: 0,   blue: 0,   weight: 0.33),
      ],
    ),
    CountryAuraProfile(
      countryCode: 'ZA', countryName: 'Güney Afrika', regionTag: 'africa',
      flagColors: [
        FlagColorWeight(colorName: 'Green', red: 0,   green: 119, blue: 73,  weight: 0.30),
        FlagColorWeight(colorName: 'Yellow',red: 255, green: 184, blue: 28,  weight: 0.15),
        FlagColorWeight(colorName: 'Black', red: 0,   green: 0,   blue: 0,   weight: 0.15),
        FlagColorWeight(colorName: 'White', red: 255, green: 255, blue: 255, weight: 0.15),
        FlagColorWeight(colorName: 'Red',   red: 222, green: 56,  blue: 49,  weight: 0.15),
        FlagColorWeight(colorName: 'Blue',  red: 0,   green: 35,  blue: 149, weight: 0.10),
      ],
    ),
    // Oceania
    CountryAuraProfile(
      countryCode: 'AU', countryName: 'Avustralya', regionTag: 'oceania',
      flagColors: [
        FlagColorWeight(colorName: 'Blue',  red: 0,   green: 32,  blue: 91,  weight: 0.70),
        FlagColorWeight(colorName: 'Red',   red: 255, green: 0,   blue: 0,   weight: 0.15),
        FlagColorWeight(colorName: 'White', red: 255, green: 255, blue: 255, weight: 0.15),
      ],
    ),
  ];

  static List<CountryAuraProfile> get sortedByName {
    final sorted = List<CountryAuraProfile>.from(_profiles);
    sorted.sort((a, b) => a.countryName.compareTo(b.countryName));
    return sorted;
  }

  static CountryAuraProfile? findByCode(String code) {
    for (final p in _profiles) {
      if (p.countryCode == code) return p;
    }
    return null;
  }
}
