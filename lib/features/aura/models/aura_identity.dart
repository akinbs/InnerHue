import 'package:flutter/material.dart';

class AuraIdentity {
  final String auraName;
  final String auraSubtitle;
  final String dominantColorFamily;
  final String dominantChannel;
  final String? secondaryChannel;
  final String intensityLevel;
  final List<String> visualKeywords;
  final List<Color> gradientColors;

  const AuraIdentity({
    required this.auraName,
    required this.auraSubtitle,
    required this.dominantColorFamily,
    required this.dominantChannel,
    this.secondaryChannel,
    required this.intensityLevel,
    required this.visualKeywords,
    required this.gradientColors,
  });
}
