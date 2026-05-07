# InnerHue

**InnerHue** is a Flutter mobile application that generates a symbolic RGB aura spectrum from a user's name, zodiac sign, nationality, and interactive story choices.

**InnerHue**, kullanıcının ismi, burcu, uyruğu ve hikaye içerisindeki seçimleri üzerinden sembolik bir RGB aura spektrumu oluşturan Flutter tabanlı mobil bir uygulamadır.

> InnerHue is not a clinical, psychological, or astrological diagnosis tool.  
> InnerHue klinik, psikolojik veya astrolojik bir değerlendirme aracı değildir.

---

## 🇹🇷 Türkçe

## Proje Hakkında

InnerHue, klasik soru-cevap testlerinden farklı olarak kullanıcıyı kısa ve etkileşimli bir hikaye yolculuğuna çıkarır. Kullanıcı önce bazı başlangıç katmanlarını oluşturur:

- İsim katmanı
- Burç katmanı
- Uyruk katmanı

Daha sonra kullanıcı 15 sahnelik interaktif bir hikayede seçimler yapar. Bu seçimler doğrudan sonuç üretmez. Önce sembolik eksenlerde puanlanır, ardından RGB değerlerine dönüştürülür.

Uygulamanın amacı kişilik analizi yapmak değildir. Amaç, kullanıcının seçimlerinden görsel, yaratıcı ve portföylük bir mobil deneyim üretmektir.

---

## Ana Fikir

InnerHue’da her kullanıcı için bir renk spektrumu oluşur.

Başlangıç değeri:

```txt
R: 128
G: 128
B: 128
```

Bu değerler şu katmanlarla değişir:

```txt
Final Aura =
Base RGB
+ Name Seed
+ Zodiac Modifier
+ Nationality Color Signature
+ Story Aura Delta
```

Sonuçta kullanıcıya özel bir RGB ve HEX rengi, aura adı, kısa açıklama ve katman kırılımı oluşturulur.

---

## Özellikler

### Mevcut Özellikler

- Flutter ile geliştirilmiş modern mobil uygulama mimarisi
- Dark/neon premium UI tasarım yaklaşımı
- İsimden sembolik RGB başlangıç tohumu üretme
- Doğum tarihinden burç hesaplama
- Burç elementi, modalitesi, polaritesi ve arketipi ile RGB delta üretme
- Uyruk seçimine göre bayrak renklerinden RGB imzası oluşturma
- 15 sahnelik interaktif hikaye akışı
- Hikaye seçimlerinden sembolik eksen skorları üretme
- Eksen skorlarını RGB story delta değerine dönüştürme
- Final aura sonucu oluşturma
- Aura adı üretme
- Aura açıklaması oluşturma
- RGB ve HEX değerlerini gösterme
- Teknik detayları aç/kapat bölümü
- Yeniden başlatma akışı

---

## Kullanılan Teknolojiler

- Flutter
- Dart
- Material 3
- Custom UI components
- Feature-based folder structure
- Local calculation engines
- No backend
- No authentication
- No database

---

## Proje Mimarisi

Proje feature-based yapıya göre düzenlenmiştir.

```txt
lib/
 ├── main.dart
 ├── app.dart
 ├── core/
 │    ├── constants/
 │    ├── theme/
 │    └── utils/
 └── features/
      └── aura/
           ├── data/
           ├── models/
           ├── logic/
           ├── screens/
           └── widgets/
```

---

## Ekran Akışı

```txt
SplashScreen
→ OnboardingScreen
→ NameInputScreen
→ BirthDateInputScreen
→ NationalityInputScreen
→ StoryIntroScreen
→ StorySceneScreen
→ FinalResultScreen
```

---

## Aura Katmanları

### 1. Name Aura Seed

Kullanıcının ismi analiz edilir.

Analizde kullanılan bazı kriterler:

- Harflerin RGB etkileri
- Türkçe karakterler
- Ünlü/sessiz oranı
- İsim uzunluğu
- Türkçe ünlü özellikleri
- Anlam etiketi sistemi

Örnek:

```txt
Akın
R +25
G +18
B +20
```

Bu değer, kullanıcının başlangıç spektrumuna küçük bir isim tohumu olarak eklenir.

---

### 2. Zodiac Aura Modifier

Kullanıcının doğum tarihinden burcu hesaplanır.

Burç katmanı şu bileşenlerle puanlanır:

- Element
- Modalite
- Polarite
- Arketip
- Geçiş günü karışımı

Örnek:

```txt
Koç
Element: Ateş
Modalite: Öncü
Polarite: Active
Aura etiketi: Kıvılcım
```

Bu modül astrolojik gerçeklik iddiası taşımaz. Yalnızca sembolik bir renk filtresi üretir.

---

### 3. Nationality Aura Seed

Kullanıcının seçtiği ülke üzerinden bir renk imzası oluşturulur.

Bu sistem kişilik veya kültür yorumu yapmaz. Sadece ülkenin bayrak renklerini kullanır.

Kullanılan bileşenler:

- Bayrak renk paleti
- Renk ağırlıkları
- Bayrak kontrastı
- Ülke kodu mikro varyasyonu

Örnek:

```txt
Türkiye
Red: 85%
White: 15%

Nationality Delta:
R +20
G -9
B -1
```

---

### 4. Story Aura Engine

Kullanıcı 15 sahnelik interaktif bir hikayede seçim yapar.

Hikaye örnekleri:

- Boş bir odada uyanmak
- Kapıya yürümek
- Kapının nasıl açıldığını seçmek
- Dışarıdaki zemini seçmek
- Yolculukta karşılaşılan nesneleri seçmek
- Final yönünü belirlemek

Seçimler doğrudan RGB’ye çevrilmez. Önce 5 sembolik eksende toplanır.

```txt
activation
grounding
reflection
openness
threshold
```

Bu eksenler klinik psikolojik boyutlar değildir. Yalnızca uygulama içi sembolik aura hesaplama eksenleridir.

---

## Story RGB Formülü

Hikaye sonunda eksen skorları normalize edilir.

```txt
a = activation
g = grounding
r = reflection
o = openness
t = threshold
```

Story RGB delta formülü:

```txt
R_story = round(38a + 14t - 12r + 6o)
G_story = round(36g + 12o + 10t - 10a)
B_story = round(40r + 14o - 12t + 4g)
```

Her kanal belirli sınırlar içinde tutulur.

```txt
R, G, B = clamp(-72, +72)
```

---

## Final RGB Hesaplama

Başlangıç RGB değeri:

```txt
R: 128
G: 128
B: 128
```

Seed merge formülü:

```txt
seed_norm_channel =
  0.50 * (name_delta_channel / 35)
+ 0.30 * (zodiac_delta_channel / 30)
+ 0.20 * (nationality_delta_channel / 20)

seed_delta_channel = round(24 * clamp(seed_norm_channel, -1, 1))
```

Final hesaplama:

```txt
finalR = clamp(128 + seedDelta.red + storyDelta.red, 0, 255)
finalG = clamp(128 + seedDelta.green + storyDelta.green, 0, 255)
finalB = clamp(128 + seedDelta.blue + storyDelta.blue, 0, 255)
```

---

## UI / UX Yaklaşımı

InnerHue’un arayüzü klasik bir quiz uygulaması gibi değil, kısa bir renk yolculuğu gibi tasarlanmıştır.

Tasarım ilkeleri:

- Dark premium UI
- Kontrollü neon vurgu
- Okunabilir metin hiyerarşisi
- Büyük dokunma alanları
- Minimal animasyon
- Mobil ergonomiye uygun akış
- Tek ekranda tek ana aksiyon
- Teknik detayların varsayılan olarak gizlenmesi
- Hikaye ekranlarında atmosferik ama sade anlatım

Ana renk paleti:

```txt
Background: #090A12
Surface: #151827
Primary: #8F5CFF
Secondary: #00D4FF
Text Primary: #F5F7FF
Text Secondary: #A7ADC6
```

---

## Kurulum

Projeyi klonla:

```bash
git clone https://github.com/akinbs/InnerHue.git
```

Proje dizinine gir:

```bash
cd InnerHue
```

Flutter bağımlılıklarını yükle:

```bash
flutter pub get
```

Uygulamayı çalıştır:

```bash
flutter run
```

---

## Gereksinimler

- Flutter SDK
- Dart SDK
- Android Studio veya VS Code
- Android Emulator veya fiziksel cihaz

Flutter kurulumunu kontrol etmek için:

```bash
flutter doctor
```

---

## Geliştirme Komutları

Kod analizini çalıştır:

```bash
flutter analyze
```

Formatlama:

```bash
dart format .
```

Android debug çalıştırma:

```bash
flutter run
```

Release APK oluşturma:

```bash
flutter build apk --release
```

---

## Proje Durumu

Bu proje portföy amacıyla geliştirilmektedir.

Ticari amaç taşımaz. Amaç, Flutter ile modern UI, temiz mimari, algoritmik düşünme ve interaktif deneyim tasarımı becerilerini göstermektir.

---

## Planlanan Geliştirmeler

- Aura geçmişi
- Local storage desteği
- Paylaşılabilir görsel kart üretimi
- Daha gelişmiş aura animasyonları
- Daha geniş isim anlam etiketi veritabanı
- Daha fazla ülke desteği
- Çoklu dil desteği
- Tema varyasyonları
- Onboarding iyileştirmeleri
- Unit testler
- Widget testler
- README görselleri ve demo videosu

---

## Etik Not

InnerHue; klinik, psikolojik, tıbbi veya astrolojik kesinlik iddiası taşımaz.

Uygulama sonuçları yalnızca sembolik ve yaratıcı bir renk kompozisyonudur. Kullanıcının kimliği, kişiliği, ruh hali veya psikolojik durumu hakkında gerçek bir değerlendirme sunmaz.

---

## Lisans

Bu proje portföy amacıyla geliştirilmiştir.

Lisans bilgisi daha sonra eklenecektir.

---

## Geliştirici

**Akın Baş**

GitHub: [akinbs](https://github.com/akinbs)

---

# English

## About The Project

InnerHue is a Flutter mobile application that creates a symbolic RGB aura spectrum based on a user's name, zodiac sign, nationality, and choices made inside an interactive story.

Unlike a traditional quiz app, InnerHue guides the user through a short narrative experience. The user first creates several symbolic starting layers:

- Name layer
- Zodiac layer
- Nationality layer

Then the user continues through a 15-scene interactive story. Each choice affects hidden symbolic axes, which are later transformed into RGB values.

The goal of the app is not to perform personality analysis. The goal is to create a visual, creative, and portfolio-ready mobile experience from user interaction.

---

## Core Idea

Every user receives a unique color spectrum.

Base value:

```txt
R: 128
G: 128
B: 128
```

This value is modified by different symbolic layers:

```txt
Final Aura =
Base RGB
+ Name Seed
+ Zodiac Modifier
+ Nationality Color Signature
+ Story Aura Delta
```

The final result includes a unique RGB color, HEX code, aura name, short interpretation, and layer breakdown.

---

## Features

### Current Features

- Flutter-based mobile app
- Modern dark/neon UI direction
- Symbolic RGB seed generation from name
- Zodiac calculation from birth date
- Zodiac RGB modifier based on element, modality, polarity, and archetype
- Nationality-based RGB signature from flag colors
- 15-scene interactive story flow
- Hidden symbolic axis scoring
- Story axis to RGB conversion
- Final aura result generation
- Aura name generation
- Short symbolic interpretation
- RGB and HEX display
- Collapsible technical details
- Restart flow

---

## Tech Stack

- Flutter
- Dart
- Material 3
- Custom UI components
- Feature-based architecture
- Local calculation engines
- No backend
- No authentication
- No database

---

## Project Architecture

The project follows a feature-based structure.

```txt
lib/
 ├── main.dart
 ├── app.dart
 ├── core/
 │    ├── constants/
 │    ├── theme/
 │    └── utils/
 └── features/
      └── aura/
           ├── data/
           ├── models/
           ├── logic/
           ├── screens/
           └── widgets/
```

---

## App Flow

```txt
SplashScreen
→ OnboardingScreen
→ NameInputScreen
→ BirthDateInputScreen
→ NationalityInputScreen
→ StoryIntroScreen
→ StorySceneScreen
→ FinalResultScreen
```

---

## Aura Layers

### 1. Name Aura Seed

The user's name is analyzed through several symbolic rules.

The analysis includes:

- Letter-based RGB effects
- Turkish character support
- Vowel/consonant ratio
- Name length
- Turkish vowel features
- Meaning tag system

Example:

```txt
Akın
R +25
G +18
B +20
```

This value is added as a symbolic name seed to the user's starting spectrum.

---

### 2. Zodiac Aura Modifier

The user's zodiac sign is calculated from their birth date.

The zodiac layer is scored using:

- Element
- Modality
- Polarity
- Archetype
- Cusp blending

Example:

```txt
Aries
Element: Fire
Modality: Cardinal
Polarity: Active
Aura label: Spark
```

This module does not claim astrological accuracy. It only creates a symbolic color filter.

---

### 3. Nationality Aura Seed

The selected country creates a color signature based on flag colors.

This system does not make personality, culture, or nationality-based judgments. It only uses visual flag data.

Components:

- Flag color palette
- Color weights
- Flag contrast
- Country code micro variation

Example:

```txt
Türkiye
Red: 85%
White: 15%

Nationality Delta:
R +20
G -9
B -1
```

---

### 4. Story Aura Engine

The user makes choices inside a 15-scene interactive story.

Story examples:

- Waking up in an empty room
- Walking toward a door
- Choosing how the door opens
- Stepping onto the ground outside
- Choosing objects along the way
- Selecting a final direction

Choices are not directly converted into RGB. They first affect 5 symbolic axes:

```txt
activation
grounding
reflection
openness
threshold
```

These are not clinical psychological dimensions. They are only symbolic scoring axes used by the app's aura engine.

---

## Story RGB Formula

At the end of the story, axis scores are normalized.

```txt
a = activation
g = grounding
r = reflection
o = openness
t = threshold
```

Story RGB delta formula:

```txt
R_story = round(38a + 14t - 12r + 6o)
G_story = round(36g + 12o + 10t - 10a)
B_story = round(40r + 14o - 12t + 4g)
```

Each channel is clamped within a controlled range.

```txt
R, G, B = clamp(-72, +72)
```

---

## Final RGB Calculation

Base RGB value:

```txt
R: 128
G: 128
B: 128
```

Seed merge formula:

```txt
seed_norm_channel =
  0.50 * (name_delta_channel / 35)
+ 0.30 * (zodiac_delta_channel / 30)
+ 0.20 * (nationality_delta_channel / 20)

seed_delta_channel = round(24 * clamp(seed_norm_channel, -1, 1))
```

Final calculation:

```txt
finalR = clamp(128 + seedDelta.red + storyDelta.red, 0, 255)
finalG = clamp(128 + seedDelta.green + storyDelta.green, 0, 255)
finalB = clamp(128 + seedDelta.blue + storyDelta.blue, 0, 255)
```

---

## UI / UX Direction

InnerHue is designed to feel less like a quiz and more like a short symbolic color journey.

Design principles:

- Premium dark UI
- Controlled neon accents
- Strong readability
- Clear hierarchy
- Large touch targets
- Minimal animation
- Mobile-first layout
- One main action per screen
- Technical details hidden by default
- Atmospheric but readable story screens

Main color palette:

```txt
Background: #090A12
Surface: #151827
Primary: #8F5CFF
Secondary: #00D4FF
Text Primary: #F5F7FF
Text Secondary: #A7ADC6
```

---

## Installation

Clone the repository:

```bash
git clone https://github.com/akinbs/InnerHue.git
```

Go to the project directory:

```bash
cd InnerHue
```

Install Flutter dependencies:

```bash
flutter pub get
```

Run the app:

```bash
flutter run
```

---

## Requirements

- Flutter SDK
- Dart SDK
- Android Studio or VS Code
- Android Emulator or physical device

Check your Flutter setup:

```bash
flutter doctor
```

---

## Development Commands

Run static analysis:

```bash
flutter analyze
```

Format code:

```bash
dart format .
```

Run in debug mode:

```bash
flutter run
```

Build release APK:

```bash
flutter build apk --release
```

---

## Project Status

This project is being developed as a portfolio project.

It has no commercial purpose. The goal is to demonstrate Flutter UI development, clean architecture, algorithmic thinking, symbolic scoring systems, and interactive mobile experience design.

---

## Planned Improvements

- Aura history
- Local storage support
- Shareable visual result card
- Improved aura animations
- Larger name meaning tag database
- More country support
- Multi-language support
- Theme variations
- Improved onboarding
- Unit tests
- Widget tests
- README screenshots and demo video

---

## Ethical Note

InnerHue does not provide clinical, psychological, medical, or astrological certainty.

The result is only a symbolic and creative color composition. It does not evaluate the user's identity, personality, mood, or psychological state.

---

## License

This project is currently developed for portfolio purposes.

License information will be added later.

---

## Developer

**Akın Baş**

GitHub: [akinbs](https://github.com/akinbs)
