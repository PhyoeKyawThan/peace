import 'package:mind_peace/models/lesson_model.dart';

List<Map<String, dynamic>> examples = [
  {
    "title": "The Four Noble Truths",
    "sayawtaw": "Venerable Sayadaw U Pandita",
    "description":
        "An introductory discourse on the foundational principles of Buddhism.",
    "audioPath": "assets/audio/four_noble_truths.mp3",
    "srtPath": "assets/srt/fnt_transcript.srt",
    "imagePath": "assets/images/u_pandita.jpg",
    "isFav": false,
  },
  {
    "title": "Metta Sutta (Loving-Kindness)",
    "sayawtaw": "Ajahn Sumedho",
    "description":
        "A short, powerful teaching on the development of universal loving-kindness.",
    "audioPath": "https://storage.example.com/metta_sutta.mp3",
    "srtPath": "https://storage.example.com/metta_sutta_subs.srt",
    "imagePath": "assets/images/ajahn_sumedho.jpg",
    "isFav": true,
  },
  {
    "title": "The Noble Eightfold Path",
    "sayawtaw": "Bhikkhu Bodhi",
    "description":
        "A comprehensive guide to ethical and mental development leading to enlightenment.",
    "audioPath": "assets/audio/noble_eightfold_path.mp3",
    "srtPath": "assets/srt/eightfold_path.srt",
    "imagePath": "assets/images/bhikkhu_bodhi.jpg",
    "isFav": true,
  },
  {
    "title": "Meditation for Mindfulness",
    "sayawtaw": "Sayadaw U Tejaniya",
    "description": "Practical instructions on mindfulness meditation.",
    "audioPath": "assets/audio/mindfulness_meditation.mp3",
    "srtPath": "assets/srt/mindfulness.srt",
    "imagePath": "assets/images/u_tejaniya.jpg",
    "isFav": true,
  },
  {
    "title": "Karma and Its Consequences",
    "sayawtaw": "Ajahn Chah",
    "description":
        "Understanding the law of cause and effect in Buddhist teachings.",
    "audioPath": "assets/audio/karma_consequences.mp3",
    "srtPath": "assets/srt/karma.srt",
    "imagePath": "assets/images/ajahn_chah.jpg",
    "isFav": true,
  },
  {
    "title": "Impermanence (Anicca)",
    "sayawtaw": "Venerable Mahasi Sayadaw",
    "description": "Reflection on the transient nature of all phenomena.",
    "audioPath": "assets/audio/impermanence.mp3",
    "srtPath": "assets/srt/impermanence.srt",
    "imagePath": "assets/images/mahasi_sayadaw.jpg",
    "isFav": true,
  },
  {
    "title": "Mindfulness of Breathing",
    "sayawtaw": "Ajahn Brahm",
    "description":
        "Instructions on focusing on the breath to cultivate concentration.",
    "audioPath": "assets/audio/mindfulness_breathing.mp3",
    "srtPath": "assets/srt/breathing.srt",
    "imagePath": "assets/images/ajahn_brahm.jpg",
    "isFav": true,
  },
  {
    "title": "The Five Precepts",
    "sayawtaw": "Sayadaw U Jotika",
    "description": "A discourse on moral conduct for lay Buddhists.",
    "audioPath": "assets/audio/five_precepts.mp3",
    "srtPath": "assets/srt/five_precepts.srt",
    "imagePath": "assets/images/u_jotika.jpg",
    "isFav": true,
  },
  {
    "title": "Loving-Kindness Meditation",
    "sayawtaw": "Bhante Gunaratana",
    "description":
        "Practice cultivating compassion and loving-kindness towards all beings.",
    "audioPath": "assets/audio/loving_kindness.mp3",
    "srtPath": "assets/srt/loving_kindness.srt",
    "imagePath": "assets/images/bhante_gunaratana.jpg",
    "isFav": true,
  },
  {
    "title": "The Middle Way",
    "sayawtaw": "Venerable Narada",
    "description": "Understanding balance between indulgence and asceticism.",
    "audioPath": "assets/audio/middle_way.mp3",
    "srtPath": "assets/srt/middle_way.srt",
    "imagePath": "assets/images/u_narada.jpg",
    "isFav": true,
  },
  {
    "title": "Compassion in Daily Life",
    "sayawtaw": "Ajahn Pasanno",
    "description": "Applying compassion in everyday situations.",
    "audioPath": "assets/audio/compassion_daily.mp3",
    "srtPath": "assets/srt/compassion_daily.srt",
    "imagePath": "assets/images/ajahn_pasanno.jpg",
    "isFav": true,
  },
  {
    "title": "Right Speech",
    "sayawtaw": "Sayadaw U Kheminda",
    "description":
        "The importance of ethical speech and mindful communication.",
    "audioPath": "assets/audio/right_speech.mp3",
    "srtPath": "assets/srt/right_speech.srt",
    "imagePath": "assets/images/u_kheminda.jpg",
    "isFav": true,
  },
  {
    "title": "The Dhammapada Verses",
    "sayawtaw": "Bhikkhu Analayo",
    "description": "Selected verses from the Dhammapada with explanations.",
    "audioPath": "assets/audio/dhammapada_verses.mp3",
    "srtPath": "assets/srt/dhammapada.srt",
    "imagePath": "assets/images/bhikkhu_analayo.jpg",
    "isFav": true,
  },
  {
    "title": "Equanimity (Upekkha)",
    "sayawtaw": "Ajahn Sumano",
    "description": "Developing mental balance and serenity in life.",
    "audioPath": "assets/audio/equanimity.mp3",
    "srtPath": "assets/srt/equanimity.srt",
    "imagePath": "assets/images/ajahn_sumano.jpg",
    "isFav": true,
  },
  {
    "title": "Joyful Meditation",
    "sayawtaw": "Venerable Hsuan Hua",
    "description":
        "Cultivating joy and positivity through meditation practice.",
    "audioPath": "assets/audio/joyful_meditation.mp3",
    "srtPath": "assets/srt/joyful_meditation.srt",
    "imagePath": "assets/images/venerable_hsuan_hua.jpg",
    "isFav": true,
  },
];

List<Lesson> lessonList = examples.map((e) => Lesson.fromJson(e)).toList();
