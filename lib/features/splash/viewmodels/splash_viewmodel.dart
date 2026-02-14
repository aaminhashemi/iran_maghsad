import 'package:flutter_riverpod/flutter_riverpod.dart';

// تعریف Provider
final splashViewModelProvider = Provider<SplashViewModel>((ref) {
  return SplashViewModel();
});

// کلاس ViewModel
class SplashViewModel {
  // متد شبیه‌سازی کارهای اولیه
  Future<String> initializeApp() async {
    // اینجا می‌تونی کارهای زیر رو انجام بدی:
    // 1. چک کردن توکن کاربر
    // 2. لود کردن تنظیمات اولیه
    // 3. اتصال به دیتابیس محلی
    // 4. دریافت کانفیگ از سرور
    // 5. و ...

    await Future.delayed(const Duration(seconds: 3));

    // بعد از ۳ ثانیه تصمیم می‌گیریم کاربر کجا بره
    // برای مثال: اگه توکن داشت بره خانه، وگرنه بره لاگین
    final hasToken = await _checkAuthToken();

    if (hasToken) {
      return '/home';
    } else {
      return '/login';
    }
  }

  Future<bool> _checkAuthToken() async {
    // اینجا می‌تونی از SharedPreferences یا هر جای دیگه توکن رو چک کنی
    // الان برای مثال false برمی‌گردونیم (یعنی کاربر لاگین نیست)
    return false;
  }
}