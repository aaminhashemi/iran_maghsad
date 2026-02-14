import 'package:flutter/material.dart';

// زبان‌های پشتیبانی شده
enum AppLanguage {
  english(Locale('en', 'US'), 'English', '🇺🇸'),
  persian(Locale('fa', 'IR'), 'فارسی', '🇮🇷'),
  arabic(Locale('ar', 'SA'), 'العربية', '🇸🇦');

  final Locale locale;
  final String name;
  final String flag;

  const AppLanguage(this.locale, this.name, this.flag);
}

// Provider مدیریت زبان
class LocaleProvider extends ChangeNotifier {
  // زبان پیش‌فرض: فارسی
  Locale _locale = const Locale('fa', 'IR');

  Locale get locale => _locale;

  // تغییر زبان
  void setLocale(AppLanguage language) {
    _locale = language.locale;
    notifyListeners(); // به همه ویجت‌ها خبر بده که زبان عوض شده
  }

  // گرفتن زبان فعلی
  AppLanguage get currentLanguage {
    return AppLanguage.values.firstWhere(
          (lang) => lang.locale.languageCode == _locale.languageCode,
      orElse: () => AppLanguage.persian,
    );
  }
}