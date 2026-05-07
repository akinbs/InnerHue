import '../models/aura_identity.dart';
import '../models/story_aura_result.dart';

class AuraInterpretationEngine {
  const AuraInterpretationEngine._();

  static const String _disclaimer =
      'Bu sonuç psikolojik tanı değil, seçimlerinden üretilmiş sembolik bir '
      'renk kompozisyonudur.';

  static String build({
    required AuraIdentity identity,
    required StoryAuraResult storyResult,
  }) {
    final colorSentence = _colorSentence(identity.dominantChannel);
    final axisSentence = _axisSentence(storyResult.dominantAxis);
    return '$colorSentence $axisSentence $_disclaimer';
  }

  static String _colorSentence(String dominantChannel) {
    switch (dominantChannel) {
      case 'red':
        return 'Kırmızı kanal, spektrumda sıcaklık ve hareket hissini taşır.';
      case 'green':
        return 'Yeşil kanal, spektrumda denge ve temas hissini taşır.';
      case 'blue':
        return 'Mavi kanal, spektrumda derinlik ve yansıma hissini taşır.';
      case 'balanced':
        return 'Kanalların birbirine yakın ilerlemesi, daha yumuşak ve dengeli bir görsel karışım oluşturur.';
      default:
        return 'Spektrum, sembolik bir renk dengesi oluşturdu.';
    }
  }

  static String _axisSentence(String dominantAxis) {
    switch (dominantAxis) {
      case 'activation':
        return 'Hikayedeki seçimlerin daha çok hareket, hız ve ilk adım enerjisini öne çıkardı.';
      case 'grounding':
        return 'Hikayedeki seçimlerin temas, zemin ve güvenli ritim hissini güçlendirdi.';
      case 'reflection':
        return 'Hikayedeki seçimlerin gözlem, sessizlik ve iç derinlik tonlarını belirginleştirdi.';
      case 'openness':
        return 'Hikayedeki seçimlerin açıklık, merak ve dış dünyaya yönelme hissini yükseltti.';
      case 'threshold':
        return 'Hikayedeki seçimlerin eşik, geçiş ve karar anı temasını öne çıkardı.';
      case 'balanced':
        return 'Hikayedeki seçimlerin tek bir yöne keskin biçimde yüklenmeden dengeli bir spektrum oluşturdu.';
      default:
        return 'Hikayedeki seçimlerin sembolik bir renk hareketi oluşturdu.';
    }
  }
}
