class StoryProgress {
  final int currentIndex;
  final int totalScenes;

  const StoryProgress({
    required this.currentIndex,
    required this.totalScenes,
  });

  double get progressRatio =>
      totalScenes > 0 ? (currentIndex + 1) / totalScenes : 0.0;
}
