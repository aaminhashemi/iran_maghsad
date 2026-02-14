class Strings {
  // متن welcome بر اساس زبان
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

  static String getGuestUser(String langCode) {
    switch (langCode) {
      case 'fa':
        return 'کاربر مهمان';
      case 'ar':
        return 'مستخدم ضيف';
      default:
        return 'Guest User';
    }
  }

  static String getLogin(String langCode) {
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

  // متن‌های فرم چندمرحله‌ای
  static String getFormTitle(String langCode) {
    switch (langCode) {
      case 'fa':
        return 'فرم ثبت‌نام چند مرحله‌ای';
      case 'ar':
        return 'نموذج التسجيل متعدد الخطوات';
      default:
        return 'Multi-step Registration Form';
    }
  }

  static String getPersonalInfo(String langCode) {
    switch (langCode) {
      case 'fa':
        return 'اطلاعات شخصی';
      case 'ar':
        return 'المعلومات الشخصية';
      default:
        return 'Personal Information';
    }
  }

  static String getAddress(String langCode) {
    switch (langCode) {
      case 'fa':
        return 'آدرس';
      case 'ar':
        return 'العنوان';
      default:
        return 'Address';
    }
  }

  static String getJobInfo(String langCode) {
    switch (langCode) {
      case 'fa':
        return 'اطلاعات شغلی';
      case 'ar':
        return 'المعلومات الوظيفية';
      default:
        return 'Job Information';
    }
  }

  static String getSettings(String langCode) {
    switch (langCode) {
      case 'fa':
        return 'تنظیمات';
      case 'ar':
        return 'الإعدادات';
      default:
        return 'Settings';
    }
  }

  static String getFullName(String langCode) {
    switch (langCode) {
      case 'fa':
        return 'نام و نام خانوادگی';
      case 'ar':
        return 'الاسم الكامل';
      default:
        return 'Full Name';
    }
  }

  static String getEmail(String langCode) {
    switch (langCode) {
      case 'fa':
        return 'ایمیل';
      case 'ar':
        return 'البريد الإلكتروني';
      default:
        return 'Email';
    }
  }

  static String getPhone(String langCode) {
    switch (langCode) {
      case 'fa':
        return 'شماره موبایل';
      case 'ar':
        return 'رقم الهاتف';
      default:
        return 'Phone Number';
    }
  }

  static String getCity(String langCode) {
    switch (langCode) {
      case 'fa':
        return 'شهر';
      case 'ar':
        return 'المدينة';
      default:
        return 'City';
    }
  }

  static String getPostalCode(String langCode) {
    switch (langCode) {
      case 'fa':
        return 'کد پستی';
      case 'ar':
        return 'الرمز البريدي';
      default:
        return 'Postal Code';
    }
  }

  static String getJobTitle(String langCode) {
    switch (langCode) {
      case 'fa':
        return 'عنوان شغلی';
      case 'ar':
        return 'المسمى الوظيفي';
      default:
        return 'Job Title';
    }
  }

  static String getCompany(String langCode) {
    switch (langCode) {
      case 'fa':
        return 'نام شرکت';
      case 'ar':
        return 'اسم الشركة';
      default:
        return 'Company Name';
    }
  }

  static String getExperience(String langCode) {
    switch (langCode) {
      case 'fa':
        return 'سابقه کار';
      case 'ar':
        return 'الخبرة العملية';
      default:
        return 'Work Experience';
    }
  }

  static String getYears(String langCode) {
    switch (langCode) {
      case 'fa':
        return 'سال';
      case 'ar':
        return 'سنوات';
      default:
        return 'years';
    }
  }

  static String getNewsletter(String langCode) {
    switch (langCode) {
      case 'fa':
        return 'عضویت در خبرنامه';
      case 'ar':
        return 'الاشتراك في النشرة البريدية';
      default:
        return 'Subscribe to Newsletter';
    }
  }

  static String getTerms(String langCode) {
    switch (langCode) {
      case 'fa':
        return 'قوانین و مقررات را می‌پذیرم';
      case 'ar':
        return 'أوافق على الشروط والأحكام';
      default:
        return 'I accept the Terms and Conditions';
    }
  }

  static String getSummary(String langCode) {
    switch (langCode) {
      case 'fa':
        return 'خلاصه اطلاعات';
      case 'ar':
        return 'ملخص المعلومات';
      default:
        return 'Summary';
    }
  }

  static String getPrevious(String langCode) {
    switch (langCode) {
      case 'fa':
        return 'مرحله قبل';
      case 'ar':
        return 'الخطوة السابقة';
      default:
        return 'Previous';
    }
  }

  static String getNext(String langCode) {
    switch (langCode) {
      case 'fa':
        return 'مرحله بعد';
      case 'ar':
        return 'الخطوة التالية';
      default:
        return 'Next';
    }
  }

  static String getSubmit(String langCode) {
    switch (langCode) {
      case 'fa':
        return 'ارسال';
      case 'ar':
        return 'إرسال';
      default:
        return 'Submit';
    }
  }

  static String getSuccessTitle(String langCode) {
    switch (langCode) {
      case 'fa':
        return 'ارسال با موفقیت انجام شد!';
      case 'ar':
        return 'تم الإرسال بنجاح!';
      default:
        return 'Submitted Successfully!';
    }
  }

  static String getSuccessMessage(String langCode) {
    switch (langCode) {
      case 'fa':
        return 'اطلاعات شما با موفقیت ثبت شد.';
      case 'ar':
        return 'تم تسجيل معلوماتك بنجاح.';
      default:
        return 'Your information has been successfully registered.';
    }
  }

  static String getOk(String langCode) {
    switch (langCode) {
      case 'fa':
        return 'باشه';
      case 'ar':
        return 'حسناً';
      default:
        return 'OK';
    }
  }

  // پیام‌های خطا
  static String getFieldRequired(String langCode, String fieldName) {
    switch (langCode) {
      case 'fa':
        return '$fieldName اجباری است';
      case 'ar':
        return '$fieldName مطلوب';
      default:
        return '$fieldName is required';
    }
  }

  static String getMinLength(String langCode, String fieldName, int length) {
    switch (langCode) {
      case 'fa':
        return '$fieldName باید حداقل $length کاراکتر باشد';
      case 'ar':
        return '$fieldName يجب أن يكون على الأقل $length أحرف';
      default:
        return '$fieldName must be at least $length characters';
    }
  }

  static String getInvalidEmail(String langCode) {
    switch (langCode) {
      case 'fa':
        return 'ایمیل معتبر نیست';
      case 'ar':
        return 'البريد الإلكتروني غير صالح';
      default:
        return 'Invalid email address';
    }
  }

  static String getInvalidPhone(String langCode) {
    switch (langCode) {
      case 'fa':
        return 'شماره موبایل معتبر نیست (مثال: 09123456789)';
      case 'ar':
        return 'رقم الهاتف غير صالح (مثال: 09123456789)';
      default:
        return 'Invalid phone number (e.g., 09123456789)';
    }
  }

  static String getPhoneLength(String langCode) {
    switch (langCode) {
      case 'fa':
        return 'شماره موبایل باید ۱۱ رقم باشد';
      case 'ar':
        return 'رقم الهاتف يجب أن يكون ۱۱ أرقام';
      default:
        return 'Phone number must be 11 digits';
    }
  }

  static String getPostalCodeLength(String langCode) {
    switch (langCode) {
      case 'fa':
        return 'کد پستی باید ۱۰ رقم باشد';
      case 'ar':
        return 'الرمز البريدي يجب أن يكون ۱۰ أرقام';
      default:
        return 'Postal code must be 10 digits';
    }
  }

  static String getPostalCodeDigits(String langCode) {
    switch (langCode) {
      case 'fa':
        return 'کد پستی باید فقط عدد باشد';
      case 'ar':
        return 'الرمز البريدي يجب أن يكون أرقام فقط';
      default:
        return 'Postal code must contain only digits';
    }
  }

  static String getExperienceRange(String langCode) {
    switch (langCode) {
      case 'fa':
        return 'سابقه کار باید بین ۰ تا ۵۰ سال باشد';
      case 'ar':
        return 'الخبرة يجب أن تكون بين ۰ و ٥۰ سنة';
      default:
        return 'Experience must be between 0 and 50 years';
    }
  }

  static String getTermsRequired(String langCode) {
    switch (langCode) {
      case 'fa':
        return 'برای ادامه باید قوانین را بپذیرید';
      case 'ar':
        return 'للمتابعة يجب عليك قبول الشروط';
      default:
        return 'You must accept the terms to continue';
    }
  }
}