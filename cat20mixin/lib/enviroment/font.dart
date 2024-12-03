String translate(String text, {required int language}) {
  switch (language) {
    case 1:
      return _englishTranslations[text] ?? text;
    case 2:
      return _sinhalaTranslations[text] ?? text;
    case 3:
      return _tamilTranslations[text] ?? text;
    default:
      return text;
  }
}

const Map<String, String> _englishTranslations = {
  'programList': 'Program List',
  'Choose by Date': 'Choose By Date',
  'Choose by Program': 'Choose By Program',
  'settings': 'Settings',
  'language': 'Change Language',
  'aboutUs': 'About Us',
  'programName': 'Program Name',
  'listen': 'Listen',
  'episode': 'Episode',
  'live': 'On Air',
  'recordings': 'Automate',
};

const Map<String, String> _sinhalaTranslations = {
  'programList': 'වැඩසටහන් ලැයිස්තුව',
  'Choose by Date': 'දිනය අනුව වර්ග කරන්න',
  'Choose by Program': 'වැඩසටහන් අනුව වර්ග කරන්න',
  'settings': 'සැකසුම්',
  'language': 'භාෂාව වෙනස් කරන්න',
  'aboutUs': 'අපි ගැන',
  'programName': 'වැඩසටහනේ නම',
  'listen': 'සවන් කරන්න',
  'episode': 'කථාංගයේ නම',
  'live': 'සජීවි',
  'recordings': 'පටිගත කිරීම්',
};

const Map<String, String> _tamilTranslations = {
  'programList': 'திட்டங்கள் பட்டியல்',
  'Choose by Date': 'தேதி வாரியாக வரிசைப்படுத்தவும்',
  'Choose by Program': 'திட்டங்கள் வரிசைப்படுத்தவும்',
  'settings': 'அமைப்புகள்',
  'language': 'மொழியை மாற்றவும்',
  'aboutUs': 'எங்களை பற்றி',
  'programName': 'நிரல் பெயர்',
  'listen': 'கேளுங்கள்',
  'episode': 'அத்தியாயம்',
  'live': 'வாழ்க',
  'recordings': 'பதிவுகள்',
};

int language = 1; // Default to English

// Example usage:
// void main() {
//   print(translate('programList', language: language)); // Output: Program List
//   print(translate('Choose by Date',
//       language: language)); // Output: Choose by Date
//   print(translate('settings', language: language)); // Output: Settings
//   print(translate('language', language: language)); // Output: Language
//   print(translate('aboutUs', language: language)); // Output: About Us
//   print(translate('programName', language: language)); // Output: Program Name
//   print(translate('listen', language: language)); // Output: Listen
//   print(translate('episode', language: language)); // Output: Episode
// }
