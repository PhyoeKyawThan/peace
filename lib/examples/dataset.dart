import 'package:mind_peace/models/lesson_model.dart';

List<Map<String, dynamic>> examples = [
  {
    "title": "အကြောင်းအရာလေးခု သမ္မတသိသွင်",
    "sayartaw": "ဗုဒ္ဓိသိန်တော် ဆရာတော်ဦးပန္တိတ",
    "description":
        "ဗုဒ္ဓဘာသာ၏ အခြေခံသီရိဝင် အယူအဆများကို ဝင်ရိုးအဖြစ်ရှင်းလင်းပြောကြားထားသော အဆိုအထားပါသည်။",
    "audioPath":
        "assets/audios/Tayar Taw Myanmar - The Voice of Buddha (youtube).mp3",
    "srtPath": "assets/srt/fnt_transcript.srt",
    "imagePath": "assets/images/u_pandita.jpg",
    "isBookMark": false,
  },
  {
    "title": "မေတ္တာစုတ (သဘောထားကောင်းခြင်း)",
    "sayartaw": "အဇန်း ဆုမေဒေါ",
    "description":
        "ကမ္ဘာလုံးဆိုင်ရာ မေတ္တာကို တိုးတက်ဖွံ့ဖြိုးစေခြင်းအတွက် ချေးမြွှေသံဖြစ်သော တိုတိုကပြောကြားမှု။",
    "audioPath":
        "assets/audios/Tayar Taw Myanmar - The Voice of Buddha (youtube).mp3",
    "srtPath": "https://storage.example.com/metta_sutta_subs.srt",
    "imagePath": "assets/images/ajahn_sumedho.jpg",
    "isBookMark": true,
  },
  {
    "title": "အရှင်မြတ် အရှင်လမ်းရှစ်ပါး",
    "sayartaw": "ဘိက္ခု ဘောဓိ",
    "description":
        "မြင်ကွင်းကောင်းမွန်မှုနှင့် စိတ်တော်ကောင်းမွန်မှုတို့ကို သိမြင်အလင်းသို့ နည်းလမ်းညွှန်သည့် ကမ္မာဝါဒီလမ်းညွှန်။",
    "audioPath":
        "assets/audios/Tayar Taw Myanmar - The Voice of Buddha (youtube).mp3",
    "srtPath": "assets/srt/eightfold_path.srt",
    "imagePath": "assets/images/bhikkhu_bodhi.jpg",
    "isBookMark": true,
  },
  {
    "title": "သတိထားမှတ်သားခြင်း မေဒီတေးရှင်း",
    "sayartaw": "ဆရာတော်ဦးတေဇာညိန်း",
    "description":
        "အများပြည်သူအတွက် သဘာဝအလေးအနေအထားကို သတိပြုစေသည့် အကြံဉာဏ်များ။",
    "audioPath": "assets/audio/mindfulness_meditation.mp3",
    "srtPath": "assets/srt/mindfulness.srt",
    "imagePath": "assets/images/u_tejaniya.jpg",
    "isBookMark": true,
  },
  {
    "title": "ကမ္မသဘာဝနှင့် ၎င်း၏ အကျိုးအမြတ်များ",
    "sayartaw": "အဇန်းခါ",
    "description":
        "ကြောင်းတရားအရ ကမ္မအကျိုးအမြတ်ကို နားလည်သိမြင်စေသည့် သဘောတရား။",
    "audioPath": "assets/audio/karma_consequences.mp3",
    "srtPath": "assets/srt/karma.srt",
    "imagePath": "assets/images/ajahn_chah.jpg",
    "isBookMark": true,
  },
  {
    "title": "အနိစ္စ (အပြောင်းအလဲတရား)",
    "sayartaw": "မဟာဆရာတော် ဦးမဟာဆိ",
    "description":
        "အရာအားလုံးသည် မတည်မြဲကြောင်း သဘောတရားကို ရှင်းလင်းပြောကြားခြင်း။",
    "audioPath": "assets/audio/impermanence.mp3",
    "srtPath": "assets/srt/impermanence.srt",
    "imagePath": "assets/images/mahasi_sayadaw.jpg",
    "isBookMark": true,
  },
  {
    "title": "ရွှေလေပြေးသံသတ္တိ နှလုံးသွေး",
    "sayartaw": "အဇန်း ဘရာဟမ်",
    "description":
        "ဦးရှိုင်းရွှေလေပြေးသတ္တိဖြင့် ဗဟုသုတပေးသည့် အသက်ရှူသတ်မှတ်ခြင်း လေ့ကျင့်နည်း။",
    "audioPath": "assets/audio/mindfulness_breathing.mp3",
    "srtPath": "assets/srt/breathing.srt",
    "imagePath": "assets/images/ajahn_brahm.jpg",
    "isBookMark": true,
  },
  {
    "title": "သီလငါးပါး",
    "sayartaw": "ဆရာတော်ဦးဂျိုတိကာ",
    "description": "ဂါထာငါးပါးကို စောင့်ထိန်းရသည့် သီလတရားဆိုင်ရာ အကြောင်းအရာ။",
    "audioPath": "assets/audio/five_precepts.mp3",
    "srtPath": "assets/srt/five_precepts.srt",
    "imagePath": "assets/images/u_jotika.jpg",
    "isBookMark": true,
  },
  {
    "title": "မေတ္တသာမဏာ မေဒီတေးရှင်း",
    "sayartaw": "ဘန္တေ ဂုနရာဋနာ",
    "description":
        "တရားတော်အသက်ရှင်သမျှကို မေတ္တာစိတ်ဖြင့် ပူဇော်ကာ သနပ်ခါတရားတိုးချဲ့နည်း။",
    "audioPath": "assets/audio/loving_kindness.mp3",
    "srtPath": "assets/srt/loving_kindness.srt",
    "imagePath": "assets/images/bhante_gunaratana.jpg",
    "isBookMark": true,
  },
  {
    "title": "အလယ်လမ်း",
    "sayartaw": "ဗုဒ္ဓိသိန်တော် ဦးနာရဒ",
    "description":
        "ဝမခြိမ်းမယှား သာယာသိတျတည်ရှိသော လမ်းစဉ်ကို ရှင်းလင်းဖော်ပြခြင်း။",
    "audioPath": "assets/audio/middle_way.mp3",
    "srtPath": "assets/srt/middle_way.srt",
    "imagePath": "assets/images/u_narada.jpg",
    "isBookMark": true,
  },
  {
    "title": "နေ့စဉ်ဘဝရှိ ကရုပြုစိတ်",
    "sayartaw": "အဇန်း ပသန်နို",
    "description": "နေ့စဉ်ဘဝတွင် ကရုပြုစိတ်တရားကို ကျင့်သုံးပုံများ။",
    "audioPath": "assets/audio/compassion_daily.mp3",
    "srtPath": "assets/srt/compassion_daily.srt",
    "imagePath": "assets/images/ajahn_pasanno.jpg",
    "isBookMark": true,
  },
  {
    "title": "စကားပြောသွားတည့်ခြင်း (သမ္မာဝါစာ)",
    "sayartaw": "ဆရာတော်ဦးခေမင်ဒါ",
    "description": "စကားပြောသွားတည့်ခြင်းနှင့် သတိပြုစကားပြောခြင်းအရေးပါမှု။",
    "audioPath": "assets/audio/right_speech.mp3",
    "srtPath": "assets/srt/right_speech.srt",
    "imagePath": "assets/images/u_kheminda.jpg",
    "isBookMark": true,
  },
  {
    "title": "ဓမ္မပဒ ဂါထာများ",
    "sayartaw": "ဘိက္ခု အနလာယော",
    "description": "ဓမ္မပဒမှ ရွေးချယ်ထားသော ဂါထာများနှင့် ဖော်ပြချက်များ။",
    "audioPath": "assets/audio/dhammapada_verses.mp3",
    "srtPath": "assets/srt/dhammapada.srt",
    "imagePath": "assets/images/bhikkhu_analayo.jpg",
    "isBookMark": true,
  },
  {
    "title": "ဥပေက္ခာ (မတုန်မလှုပ် သဘော)",
    "sayartaw": "အဇန်း စုမာနို",
    "description": "စိတ်မြဲမြံ၍ မတုန်မလှုပ်တဲ့ ဥပေက္ခာအတတ်ပညာကို တည်ဆောက်နည်း။",
    "audioPath": "assets/audio/equanimity.mp3",
    "srtPath": "assets/srt/equanimity.srt",
    "imagePath": "assets/images/ajahn_sumano.jpg",
    "isBookMark": true,
  },
  {
    "title": "စိတ်ပျော်ရွှင်မှု မေဒီတေးရှင်း",
    "sayartaw": "ဗုဒ္ဓိသိန်တော် ဆွမ်ဟဝါ",
    "description":
        "မေဒီတေးရှင်းလေ့ကျင့်ခြင်းမှ တစ်ဆင့် ပျော်ရွှင်မှုကို တိုးတက်စေသော သဘောတရား။",
    "audioPath": "assets/audio/joyful_meditation.mp3",
    "srtPath": "assets/srt/joyful_meditation.srt",
    "imagePath": "assets/images/venerable_hsuan_hua.jpg",
    "isBookMark": true,
  },
];

List<Lesson> lessonList = examples.map((e) => Lesson.fromJson(e)).toList();
