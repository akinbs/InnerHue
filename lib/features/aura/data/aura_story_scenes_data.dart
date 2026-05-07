import '../models/aura_option.dart';
import '../models/aura_scene.dart';
import '../models/axis_delta.dart';

class AuraStoryScenesData {
  const AuraStoryScenesData._();

  static const List<AuraScene> scenes = [
    // ── Sahne 1 ──────────────────────────────────────────────────────────────
    AuraScene(
      id: 'room_walls',
      order: 1,
      sceneTitle: 'Uyanış',
      narrativeText:
          'Gözlerini açıyorsun. Sessiz, boş bir odadasın. Odada yalnızca '
          'sade bir yatak ve uzak duvarda tek bir kapı var. Duvarlar sana '
          'ilk anda bir his veriyor.',
      questionText: 'Duvarların tonu nasıl?',
      options: [
        AuraOption(
          id: 'room_walls_1',
          label: 'Soluk ve açık',
          axisDelta: AxisDelta(
              activation: 0,
              grounding: 0,
              reflection: 1,
              openness: 2,
              threshold: 0),
          tags: ['pale_room', 'open_tone'],
        ),
        AuraOption(
          id: 'room_walls_2',
          label: 'Nemli, yosunumsu',
          axisDelta: AxisDelta(
              activation: -1,
              grounding: 2,
              reflection: 1,
              openness: 0,
              threshold: 0),
          tags: ['moss_room', 'organic_tone'],
        ),
        AuraOption(
          id: 'room_walls_3',
          label: 'Koyu ve derin',
          axisDelta: AxisDelta(
              activation: -1,
              grounding: 0,
              reflection: 3,
              openness: -1,
              threshold: 1),
          tags: ['dark_room', 'deep_tone'],
        ),
        AuraOption(
          id: 'room_walls_4',
          label: 'Sıcak, toprak gibi',
          axisDelta: AxisDelta(
              activation: 1,
              grounding: 3,
              reflection: 0,
              openness: 0,
              threshold: 0),
          tags: ['warm_room', 'earth_tone'],
        ),
      ],
    ),

    // ── Sahne 2 ──────────────────────────────────────────────────────────────
    AuraScene(
      id: 'first_light',
      order: 2,
      sceneTitle: 'İlk Işık',
      narrativeText:
          'Odada pencere yok ama bir yerden ince bir ışık sızıyor. Işık '
          'odayı tamamen aydınlatmıyor; sadece sana yön duygusu veriyor.',
      questionText: 'Işık nasıl görünüyor?',
      options: [
        AuraOption(
          id: 'first_light_1',
          label: 'Tavana yakın ince beyaz bir çizgi',
          axisDelta: AxisDelta(
              activation: 0,
              grounding: 0,
              reflection: 2,
              openness: 2,
              threshold: 1),
          tags: ['white_line_light'],
        ),
        AuraOption(
          id: 'first_light_2',
          label: 'Kapının altından gelen sıcak bir sızıntı',
          axisDelta: AxisDelta(
              activation: 2,
              grounding: 1,
              reflection: 0,
              openness: 1,
              threshold: 2),
          tags: ['door_warm_light'],
        ),
        AuraOption(
          id: 'first_light_3',
          label: 'Duvarlarda yavaşça gezinen mavi bir parıltı',
          axisDelta: AxisDelta(
              activation: -1,
              grounding: 0,
              reflection: 3,
              openness: 1,
              threshold: 0),
          tags: ['blue_glow'],
        ),
        AuraOption(
          id: 'first_light_4',
          label: 'Neredeyse ışık yok, sadece şekilleri seçiyorsun',
          axisDelta: AxisDelta(
              activation: -1,
              grounding: 0,
              reflection: 3,
              openness: -1,
              threshold: 1),
          tags: ['low_light'],
        ),
      ],
    ),

    // ── Sahne 3 ──────────────────────────────────────────────────────────────
    AuraScene(
      id: 'bed_texture',
      order: 3,
      sceneTitle: 'İlk Temas',
      narrativeText:
          'Yataktan doğruluyorsun. Avuçların yatağın kenarına değiyor. '
          'Bu ilk temas, odanın gerçekliğini biraz daha belirginleştiriyor.',
      questionText: 'Yatağın dokusu nasıl?',
      options: [
        AuraOption(
          id: 'bed_texture_1',
          label: 'Serin ve pürüzsüz',
          axisDelta: AxisDelta(
              activation: 0,
              grounding: 1,
              reflection: 2,
              openness: 0,
              threshold: 0),
          tags: ['smooth_bed'],
        ),
        AuraOption(
          id: 'bed_texture_2',
          label: 'Kalın ve güvenli',
          axisDelta: AxisDelta(
              activation: -1,
              grounding: 3,
              reflection: 0,
              openness: -1,
              threshold: 0),
          tags: ['safe_bed'],
        ),
        AuraOption(
          id: 'bed_texture_3',
          label: 'Sert ve rahatsız',
          axisDelta: AxisDelta(
              activation: 2,
              grounding: -1,
              reflection: 0,
              openness: 0,
              threshold: 2),
          tags: ['hard_bed'],
        ),
        AuraOption(
          id: 'bed_texture_4',
          label: 'Hafif, neredeyse yok gibi',
          axisDelta: AxisDelta(
              activation: 1,
              grounding: -1,
              reflection: 2,
              openness: 2,
              threshold: 0),
          tags: ['weightless_bed'],
        ),
      ],
    ),

    // ── Sahne 4 ──────────────────────────────────────────────────────────────
    AuraScene(
      id: 'feet',
      order: 4,
      sceneTitle: 'Beden',
      narrativeText:
          'Ayağa kalkıyorsun. Kapıya yürümeden önce aşağı bakıyorsun. '
          'Ayakların dünyaya nasıl temas edeceğini belirleyecek.',
      questionText: 'Ayağında ne var?',
      options: [
        AuraOption(
          id: 'feet_1',
          label: 'Çıplak ayak',
          axisDelta: AxisDelta(
              activation: 1,
              grounding: 3,
              reflection: 1,
              openness: 2,
              threshold: 0),
          tags: ['bare_feet'],
        ),
        AuraOption(
          id: 'feet_2',
          label: 'İnce çorap',
          axisDelta: AxisDelta(
              activation: 0,
              grounding: 1,
              reflection: 1,
              openness: 1,
              threshold: 0),
          tags: ['socks'],
        ),
        AuraOption(
          id: 'feet_3',
          label: 'Ev terliği',
          axisDelta: AxisDelta(
              activation: 0,
              grounding: 2,
              reflection: 0,
              openness: -1,
              threshold: 0),
          tags: ['slippers'],
        ),
        AuraOption(
          id: 'feet_4',
          label: 'Bot',
          axisDelta: AxisDelta(
              activation: 3,
              grounding: 1,
              reflection: -1,
              openness: -1,
              threshold: 2),
          tags: ['boots'],
        ),
      ],
    ),

    // ── Sahne 5 ──────────────────────────────────────────────────────────────
    AuraScene(
      id: 'door_shape',
      order: 5,
      sceneTitle: 'Eşik',
      narrativeText:
          'Kapının önüne geliyorsun. Kapı eski değil, yeni de değil. '
          'Sanki sadece sen dokunduğunda neye dönüşeceğini bekliyor.',
      questionText: 'Kapı nasıl açılıyor?',
      options: [
        AuraOption(
          id: 'door_shape_1',
          label: 'İçeri doğru açılıyor',
          axisDelta: AxisDelta(
              activation: 0,
              grounding: 1,
              reflection: 1,
              openness: -1,
              threshold: 2),
          tags: ['door_inward'],
        ),
        AuraOption(
          id: 'door_shape_2',
          label: 'Dışarı doğru açılıyor',
          axisDelta: AxisDelta(
              activation: 2,
              grounding: 0,
              reflection: 0,
              openness: 2,
              threshold: 2),
          tags: ['door_outward'],
        ),
        AuraOption(
          id: 'door_shape_3',
          label: 'Yarı aralık bekliyor',
          axisDelta: AxisDelta(
              activation: 1,
              grounding: 0,
              reflection: 2,
              openness: 1,
              threshold: 1),
          tags: ['door_ajar'],
        ),
        AuraOption(
          id: 'door_shape_4',
          label: 'Sürgülü, yana doğru kayıyor',
          axisDelta: AxisDelta(
              activation: 1,
              grounding: 0,
              reflection: 1,
              openness: 2,
              threshold: 3),
          tags: ['sliding_door'],
        ),
      ],
    ),

    // ── Sahne 6 ──────────────────────────────────────────────────────────────
    AuraScene(
      id: 'before_opening_sound',
      order: 6,
      sceneTitle: 'Ses',
      narrativeText:
          'Elini kapıya götürmeden önce duruyorsun. Dışarıdan çok hafif '
          'bir ses geliyor. Ses, dış dünyanın ilk işareti gibi.',
      questionText: 'Ne duyuyorsun?',
      options: [
        AuraOption(
          id: 'before_opening_sound_1',
          label: 'Neredeyse tam sessizlik',
          axisDelta: AxisDelta(
              activation: -1,
              grounding: 0,
              reflection: 3,
              openness: -1,
              threshold: 0),
          tags: ['silence'],
        ),
        AuraOption(
          id: 'before_opening_sound_2',
          label: 'Uzakta su sesi',
          axisDelta: AxisDelta(
              activation: 0,
              grounding: 1,
              reflection: 3,
              openness: 1,
              threshold: 0),
          tags: ['water_sound'],
        ),
        AuraOption(
          id: 'before_opening_sound_3',
          label: 'Rüzgar uğultusu',
          axisDelta: AxisDelta(
              activation: 1,
              grounding: -1,
              reflection: 1,
              openness: 3,
              threshold: 1),
          tags: ['wind_sound'],
        ),
        AuraOption(
          id: 'before_opening_sound_4',
          label: 'Belirsiz bir tıkırtı',
          axisDelta: AxisDelta(
              activation: 2,
              grounding: -1,
              reflection: 1,
              openness: 0,
              threshold: 2),
          tags: ['unknown_click'],
        ),
      ],
    ),

    // ── Sahne 7 ──────────────────────────────────────────────────────────────
    AuraScene(
      id: 'first_air',
      order: 7,
      sceneTitle: 'Dış Hava',
      narrativeText:
          'Kapıdan dışarı çıktığında hava yüzüne dokunuyor. Oda geride '
          'kalıyor ama etkisi hâlâ omuzlarında.',
      questionText: 'Hava nasıl hissettiriyor?',
      options: [
        AuraOption(
          id: 'first_air_1',
          label: 'Serin ama açık',
          axisDelta: AxisDelta(
              activation: 1,
              grounding: 0,
              reflection: 1,
              openness: 3,
              threshold: 0),
          tags: ['cool_clear_air'],
        ),
        AuraOption(
          id: 'first_air_2',
          label: 'Ağır ve nemli',
          axisDelta: AxisDelta(
              activation: -1,
              grounding: 2,
              reflection: 2,
              openness: -1,
              threshold: 0),
          tags: ['humid_air'],
        ),
        AuraOption(
          id: 'first_air_3',
          label: 'Sisli ve yutucu',
          axisDelta: AxisDelta(
              activation: -1,
              grounding: 0,
              reflection: 3,
              openness: 0,
              threshold: 1),
          tags: ['fog_air'],
        ),
        AuraOption(
          id: 'first_air_4',
          label: 'Kuru ve keskin',
          axisDelta: AxisDelta(
              activation: 3,
              grounding: 0,
              reflection: -1,
              openness: 1,
              threshold: 1),
          tags: ['dry_sharp_air'],
        ),
      ],
    ),

    // ── Sahne 8 ──────────────────────────────────────────────────────────────
    AuraScene(
      id: 'first_ground',
      order: 8,
      sceneTitle: 'Zemin',
      narrativeText:
          'İlk adımını atıyorsun. Zemin artık hikayenin gerçek yüzü. '
          'Ayağının altındaki şey, gideceğin yolu da değiştiriyor.',
      questionText: 'İlk adımını nereye basıyorsun?',
      options: [
        AuraOption(
          id: 'first_ground_1',
          label: 'Nemli toprağa',
          axisDelta: AxisDelta(
              activation: 0,
              grounding: 4,
              reflection: 1,
              openness: 0,
              threshold: 0),
          tags: ['wet_soil'],
        ),
        AuraOption(
          id: 'first_ground_2',
          label: 'Çime',
          axisDelta: AxisDelta(
              activation: 1,
              grounding: 3,
              reflection: 0,
              openness: 2,
              threshold: 0),
          tags: ['grass'],
        ),
        AuraOption(
          id: 'first_ground_3',
          label: 'Soğuk betona',
          axisDelta: AxisDelta(
              activation: 2,
              grounding: 0,
              reflection: 0,
              openness: -1,
              threshold: 1),
          tags: ['concrete'],
        ),
        AuraOption(
          id: 'first_ground_4',
          label: 'Sığ suya',
          axisDelta: AxisDelta(
              activation: 0,
              grounding: 0,
              reflection: 3,
              openness: 2,
              threshold: 1),
          tags: ['shallow_water'],
        ),
      ],
    ),

    // ── Sahne 9 ──────────────────────────────────────────────────────────────
    AuraScene(
      id: 'path_tempo',
      order: 9,
      sceneTitle: 'Ritim',
      narrativeText:
          'Önünde net bir yol yok. Sadece ilerleyebileceğin birkaç ritim '
          'var. Bedenin karar vermeden önce hareket etmeye başlıyor.',
      questionText: 'Nasıl ilerliyorsun?',
      options: [
        AuraOption(
          id: 'path_tempo_1',
          label: 'Hızlı ve kararlı',
          axisDelta: AxisDelta(
              activation: 4,
              grounding: 0,
              reflection: -1,
              openness: 0,
              threshold: 2),
          tags: ['fast_walk'],
        ),
        AuraOption(
          id: 'path_tempo_2',
          label: 'Yavaş ama dikkatli',
          axisDelta: AxisDelta(
              activation: -1,
              grounding: 1,
              reflection: 3,
              openness: 0,
              threshold: 1),
          tags: ['careful_walk'],
        ),
        AuraOption(
          id: 'path_tempo_3',
          label: 'Durup etrafa bakarak',
          axisDelta: AxisDelta(
              activation: -1,
              grounding: 0,
              reflection: 3,
              openness: 2,
              threshold: 0),
          tags: ['observing_walk'],
        ),
        AuraOption(
          id: 'path_tempo_4',
          label: 'Yolu hislerime göre değiştirerek',
          axisDelta: AxisDelta(
              activation: 1,
              grounding: 0,
              reflection: 2,
              openness: 3,
              threshold: 1),
          tags: ['intuitive_walk'],
        ),
      ],
    ),

    // ── Sahne 10 ─────────────────────────────────────────────────────────────
    AuraScene(
      id: 'horizon_place',
      order: 10,
      sceneTitle: 'Ufuk',
      narrativeText:
          'Bir süre yürüdükten sonra uzaklarda bir yer beliriyor. Net değil '
          'ama seni çağıran ilk büyük şekil o.',
      questionText: 'İleride ilk neyi fark ediyorsun?',
      options: [
        AuraOption(
          id: 'horizon_place_1',
          label: 'Ağaçlık bir alan',
          axisDelta: AxisDelta(
              activation: 0,
              grounding: 4,
              reflection: 1,
              openness: 1,
              threshold: 0),
          tags: ['forest'],
        ),
        AuraOption(
          id: 'horizon_place_2',
          label: 'Tek başına bir kulübe',
          axisDelta: AxisDelta(
              activation: 0,
              grounding: 2,
              reflection: 1,
              openness: -1,
              threshold: 2),
          tags: ['cabin'],
        ),
        AuraOption(
          id: 'horizon_place_3',
          label: 'Ufukta su çizgisi',
          axisDelta: AxisDelta(
              activation: 0,
              grounding: 0,
              reflection: 4,
              openness: 2,
              threshold: 0),
          tags: ['shoreline'],
        ),
        AuraOption(
          id: 'horizon_place_4',
          label: 'Uzakta dağınık ışıklar',
          axisDelta: AxisDelta(
              activation: 2,
              grounding: -1,
              reflection: 1,
              openness: 3,
              threshold: 1),
          tags: ['distant_lights'],
        ),
      ],
    ),

    // ── Sahne 11 ─────────────────────────────────────────────────────────────
    AuraScene(
      id: 'object_on_path',
      order: 11,
      sceneTitle: 'Nesne',
      narrativeText:
          'Yolun üzerinde küçük bir nesne duruyor. Sana ait değil ama '
          'sanki yolculuk için bırakılmış.',
      questionText: 'Hangisini alırsın?',
      options: [
        AuraOption(
          id: 'object_on_path_1',
          label: 'Küçük bir anahtar',
          axisDelta: AxisDelta(
              activation: 1,
              grounding: 0,
              reflection: 1,
              openness: 0,
              threshold: 4),
          tags: ['key'],
        ),
        AuraOption(
          id: 'object_on_path_2',
          label: 'Eski bir fener',
          axisDelta: AxisDelta(
              activation: 1,
              grounding: 0,
              reflection: 2,
              openness: 2,
              threshold: 1),
          tags: ['lantern'],
        ),
        AuraOption(
          id: 'object_on_path_3',
          label: 'İnce bir ip',
          axisDelta: AxisDelta(
              activation: 0,
              grounding: 2,
              reflection: 0,
              openness: 0,
              threshold: 2),
          tags: ['rope'],
        ),
        AuraOption(
          id: 'object_on_path_4',
          label: 'Düz, pürüzsüz bir taş',
          axisDelta: AxisDelta(
              activation: -1,
              grounding: 4,
              reflection: 1,
              openness: -1,
              threshold: 0),
          tags: ['smooth_stone'],
        ),
      ],
    ),

    // ── Sahne 12 ─────────────────────────────────────────────────────────────
    AuraScene(
      id: 'obstacle',
      order: 12,
      sceneTitle: 'Engel',
      narrativeText:
          'Yol bir noktada kesiliyor. Önünde küçük bir engel var. '
          'Aşılması imkansız değil, ama nasıl geçtiğin önemli.',
      questionText: 'Engeli nasıl geçiyorsun?',
      options: [
        AuraOption(
          id: 'obstacle_1',
          label: 'Üzerinden atlıyorum',
          axisDelta: AxisDelta(
              activation: 4,
              grounding: -1,
              reflection: -1,
              openness: 0,
              threshold: 3),
          tags: ['jump_obstacle'],
        ),
        AuraOption(
          id: 'obstacle_2',
          label: 'Etrafından dolaşıyorum',
          axisDelta: AxisDelta(
              activation: 1,
              grounding: 1,
              reflection: 1,
              openness: 2,
              threshold: 1),
          tags: ['walk_around'],
        ),
        AuraOption(
          id: 'obstacle_3',
          label: 'Önce dokunup sağlam mı diye bakıyorum',
          axisDelta: AxisDelta(
              activation: 0,
              grounding: 2,
              reflection: 2,
              openness: 0,
              threshold: 2),
          tags: ['inspect_obstacle'],
        ),
        AuraOption(
          id: 'obstacle_4',
          label: 'Bir süre bekleyip yolun değişmesini izliyorum',
          axisDelta: AxisDelta(
              activation: -2,
              grounding: 0,
              reflection: 4,
              openness: 1,
              threshold: -1),
          tags: ['wait_obstacle'],
        ),
      ],
    ),

    // ── Sahne 13 ─────────────────────────────────────────────────────────────
    AuraScene(
      id: 'encounter',
      order: 13,
      sceneTitle: 'Karşılaşma',
      narrativeText:
          'Engeli geçtikten sonra yol sessizleşiyor. Bir varlık, bir iz ya '
          'da bir açıklık sana kendini gösteriyor.',
      questionText: 'Neyle karşılaşıyorsun?',
      options: [
        AuraOption(
          id: 'encounter_1',
          label: 'Seni izleyen sakin bir hayvan',
          axisDelta: AxisDelta(
              activation: 0,
              grounding: 2,
              reflection: 2,
              openness: 1,
              threshold: 0),
          tags: ['animal'],
        ),
        AuraOption(
          id: 'encounter_2',
          label: 'Arkasını dönmüş bir siluet',
          axisDelta: AxisDelta(
              activation: 1,
              grounding: -1,
              reflection: 3,
              openness: 0,
              threshold: 2),
          tags: ['silhouette'],
        ),
        AuraOption(
          id: 'encounter_3',
          label: 'Hiç kimse yok, sadece izler',
          axisDelta: AxisDelta(
              activation: -1,
              grounding: 1,
              reflection: 4,
              openness: 0,
              threshold: 0),
          tags: ['traces'],
        ),
        AuraOption(
          id: 'encounter_4',
          label: 'Seni çağırıyor gibi duran açık bir alan',
          axisDelta: AxisDelta(
              activation: 2,
              grounding: 0,
              reflection: 1,
              openness: 4,
              threshold: 1),
          tags: ['open_field'],
        ),
      ],
    ),

    // ── Sahne 14 ─────────────────────────────────────────────────────────────
    AuraScene(
      id: 'shelter_choice',
      order: 14,
      sceneTitle: 'Durak',
      narrativeText:
          'Yol seni bir durak noktasına getiriyor. Burada kısa süreliğine '
          'durabilir, içeri girebilir ya da devam edebilirsin.',
      questionText: 'Ne yapıyorsun?',
      options: [
        AuraOption(
          id: 'shelter_choice_1',
          label: 'Kulübeye giriyorum',
          axisDelta: AxisDelta(
              activation: 0,
              grounding: 3,
              reflection: 1,
              openness: -1,
              threshold: 2),
          tags: ['enter_cabin'],
        ),
        AuraOption(
          id: 'shelter_choice_2',
          label: 'Pencereden içeri bakıyorum',
          axisDelta: AxisDelta(
              activation: 0,
              grounding: 0,
              reflection: 3,
              openness: 1,
              threshold: 1),
          tags: ['look_window'],
        ),
        AuraOption(
          id: 'shelter_choice_3',
          label: 'Kapıya dokunup devam ediyorum',
          axisDelta: AxisDelta(
              activation: 2,
              grounding: 1,
              reflection: 0,
              openness: 2,
              threshold: 2),
          tags: ['touch_and_go'],
        ),
        AuraOption(
          id: 'shelter_choice_4',
          label: 'Hiç durmadan yürümeye devam ediyorum',
          axisDelta: AxisDelta(
              activation: 4,
              grounding: -1,
              reflection: -1,
              openness: 2,
              threshold: 1),
          tags: ['keep_walking'],
        ),
      ],
    ),

    // ── Sahne 15 ─────────────────────────────────────────────────────────────
    AuraScene(
      id: 'final_direction',
      order: 15,
      sceneTitle: 'Son Yön',
      narrativeText:
          'Sonunda üç farklı yön beliriyor. Yolculuğun bitmiyor; sadece '
          'bu bölümde hangi renge doğru aktığını seçiyorsun.',
      questionText: 'Şimdi nereye yöneliyorsun?',
      options: [
        AuraOption(
          id: 'final_direction_1',
          label: 'Işığa doğru',
          axisDelta: AxisDelta(
              activation: 3,
              grounding: 0,
              reflection: 0,
              openness: 3,
              threshold: 2),
          tags: ['final_light'],
        ),
        AuraOption(
          id: 'final_direction_2',
          label: 'Suya doğru',
          axisDelta: AxisDelta(
              activation: 0,
              grounding: 0,
              reflection: 4,
              openness: 2,
              threshold: 1),
          tags: ['final_water'],
        ),
        AuraOption(
          id: 'final_direction_3',
          label: 'Ağaçların arasına doğru',
          axisDelta: AxisDelta(
              activation: 0,
              grounding: 4,
              reflection: 1,
              openness: 1,
              threshold: 1),
          tags: ['final_forest'],
        ),
        AuraOption(
          id: 'final_direction_4',
          label: 'Gölgeye doğru',
          axisDelta: AxisDelta(
              activation: -1,
              grounding: 0,
              reflection: 4,
              openness: -1,
              threshold: 2),
          tags: ['final_shadow'],
        ),
      ],
    ),
  ];
}
