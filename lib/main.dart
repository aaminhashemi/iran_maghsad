import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart'; // این رو اضافه کن
import 'package:provider/provider.dart';
import 'core/routes/app_router.dart';
import 'core/localization/locale_provider.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (_) => LocaleProvider(),
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final locale = context.watch<LocaleProvider>().locale;

    return MaterialApp.router(
      title: 'اپلیکیشن من',
      debugShowCheckedModeBanner: false,
      locale: locale,
      supportedLocales: const [
        Locale('en', 'US'), // انگلیسی
        Locale('fa', 'IR'), // فارسی
        Locale('ar', 'SA'), // عربی
      ],
      // این سه خط رو اضافه کن
      localizationsDelegates: const [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      theme: ThemeData(
        primarySwatch: Colors.blue,
        useMaterial3: true,
      ),
      routerConfig: appRouter,
    );
  }
}