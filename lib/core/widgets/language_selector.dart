import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../localization/locale_provider.dart';

class LanguageSelector extends StatelessWidget {
  const LanguageSelector({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<LocaleProvider>(
      builder: (context, localeProvider, child) {
        final currentLang = localeProvider.currentLanguage;

        return PopupMenuButton<AppLanguage>(
          tooltip: 'تغییر زبان',
          icon: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                currentLang.flag,
                style: const TextStyle(fontSize: 20),
              ),
              const SizedBox(width: 4),
              Icon(Icons.arrow_drop_down, color: Colors.white.withOpacity(0.8)),
            ],
          ),
          onSelected: (AppLanguage language) {
            localeProvider.setLocale(language);
            // نمایش پیام کوتاه
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text('زبان به ${language.name} تغییر یافت'),
                duration: const Duration(seconds: 1),
              ),
            );
          },
          itemBuilder: (BuildContext context) {
            return AppLanguage.values.map((AppLanguage language) {
              return PopupMenuItem<AppLanguage>(
                value: language,
                child: Row(
                  children: [
                    Text(language.flag, style: const TextStyle(fontSize: 20)),
                    const SizedBox(width: 12),
                    Text(language.name),
                    if (language == currentLang) ...[
                      const Spacer(),
                      const Icon(Icons.check, color: Colors.blue, size: 18),
                    ]
                  ],
                ),
              );
            }).toList();
          },
        );
      },
    );
  }
}