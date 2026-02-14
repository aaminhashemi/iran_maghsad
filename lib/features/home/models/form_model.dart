class MultiStepFormModel {
  // مرحله ۱: اطلاعات شخصی
  String fullName;
  String email;
  String phone;

  // مرحله ۲: آدرس
  String address;
  String city;
  String postalCode;

  // مرحله ۳: اطلاعات شغلی
  String jobTitle;
  String company;
  int experience; // سال سابقه

  // مرحله ۴: تنظیمات
  bool newsletter;
  bool termsAccepted;

  MultiStepFormModel({
    this.fullName = '',
    this.email = '',
    this.phone = '',
    this.address = '',
    this.city = '',
    this.postalCode = '',
    this.jobTitle = '',
    this.company = '',
    this.experience = 0,
    this.newsletter = false,
    this.termsAccepted = false,
  });

  // کپی کردن با تغییرات
  MultiStepFormModel copyWith({
    String? fullName,
    String? email,
    String? phone,
    String? address,
    String? city,
    String? postalCode,
    String? jobTitle,
    String? company,
    int? experience,
    bool? newsletter,
    bool? termsAccepted,
  }) {
    return MultiStepFormModel(
      fullName: fullName ?? this.fullName,
      email: email ?? this.email,
      phone: phone ?? this.phone,
      address: address ?? this.address,
      city: city ?? this.city,
      postalCode: postalCode ?? this.postalCode,
      jobTitle: jobTitle ?? this.jobTitle,
      company: company ?? this.company,
      experience: experience ?? this.experience,
      newsletter: newsletter ?? this.newsletter,
      termsAccepted: termsAccepted ?? this.termsAccepted,
    );
  }

  // تبدیل به JSON برای ارسال به سرور
  Map<String, dynamic> toJson() {
    return {
      'fullName': fullName,
      'email': email,
      'phone': phone,
      'address': address,
      'city': city,
      'postalCode': postalCode,
      'jobTitle': jobTitle,
      'company': company,
      'experience': experience,
      'newsletter': newsletter,
      'termsAccepted': termsAccepted,
    };
  }
}