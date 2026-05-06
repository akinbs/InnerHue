enum ZodiacElement {
  fire,
  earth,
  air,
  water;

  String get turkishLabel => switch (this) {
        ZodiacElement.fire => 'Ateş',
        ZodiacElement.earth => 'Toprak',
        ZodiacElement.air => 'Hava',
        ZodiacElement.water => 'Su',
      };
}

enum ZodiacModality {
  cardinal,
  fixed,
  mutable;

  String get turkishLabel => switch (this) {
        ZodiacModality.cardinal => 'Öncü',
        ZodiacModality.fixed => 'Sabit',
        ZodiacModality.mutable => 'Değişken',
      };
}

enum ZodiacPolarity {
  active,
  reflective;

  String get turkishLabel => switch (this) {
        ZodiacPolarity.active => 'Aktif',
        ZodiacPolarity.reflective => 'Derin',
      };
}
