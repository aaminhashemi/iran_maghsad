class Strings {
  static String getWelcome(String langCode) {
    switch (langCode) {
      case 'fa':
        return 'خوش آمدید!';
      case 'ar':
        return 'أهلاً وسهلاً!';
      default:
        return 'Welcome!';
    }
  }

  static String getWelcomeMessage(String langCode) {
    switch (langCode) {
      case 'fa':
        return 'به اپلیکیشن ما خوش آمدید. امروز چه کمکی می‌تونیم بکنیم؟';
      case 'ar':
        return 'مرحباً بك في تطبيقنا. كيف يمكننا مساعدتك اليوم؟';
      default:
        return 'Welcome to our app. How can we help you today?';
    }
  }

  static String getVisits(String langCode) {
    switch (langCode) {
      case 'fa':
        return 'بازدیدها';
      case 'ar':
        return 'الزيارات';
      default:
        return 'Visits';
    }
  }

  static String getUsers(String langCode) {
    switch (langCode) {
      case 'fa':
        return 'کاربران';
      case 'ar':
        return 'المستخدمون';
      default:
        return 'Users';
    }
  }

  static String getSearch(String langCode) {
    switch (langCode) {
      case 'fa':
        return 'جستجو';
      case 'ar':
        return 'بحث';
      default:
        return 'Search';
    }
  }

  static String getProfile(String langCode) {
    switch (langCode) {
      case 'fa':
        return 'پروفایل';
      case 'ar':
        return 'الملف الشخصي';
      default:
        return 'Profile';
    }
  }

  static String getGuestUser(String langCode) {  // اینجا اسم متد رو درست کن
    switch (langCode) {
      case 'fa':
        return 'کاربر مهمان';
      case 'ar':
        return 'مستخدم ضيف';
      default:
        return 'Guest User';
    }
  }

  static String getLogin(String langCode) {  // اینجا هم
    switch (langCode) {
      case 'fa':
        return 'ورود به حساب';
      case 'ar':
        return 'تسجيل الدخول';
      default:
        return 'Login';
    }
  }

  static String getSpecialOffer(String langCode) {
    switch (langCode) {
      case 'fa':
        return 'تخفیف ویژه';
      case 'ar':
        return 'خصم خاص';
      default:
        return 'Special Offer';
    }
  }

  static String getOfferText(String langCode) {
    switch (langCode) {
      case 'fa':
        return 'تا ۵۰٪ تخفیف روی محصولات منتخب';
      case 'ar':
        return 'خصم يصل إلى ٥٠٪ على المنتجات المختارة';
      default:
        return 'Up to 50% off on selected items';
    }
  }

  static String getOfferEnd(String langCode) {
    switch (langCode) {
      case 'fa':
        return 'فقط تا پایان هفته';
      case 'ar':
        return 'فقط حتى نهاية الأسبوع';
      default:
        return 'Only until end of week';
    }
  }

  static String getViewProducts(String langCode) {
    switch (langCode) {
      case 'fa':
        return 'مشاهده محصولات';
      case 'ar':
        return 'عرض المنتجات';
      default:
        return 'View Products';
    }
  }
}