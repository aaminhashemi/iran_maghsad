import 'package:flutter/material.dart';
import '../models/form_model.dart';

class FormProvider extends ChangeNotifier {
  // مدل داده
  MultiStepFormModel _formData = MultiStepFormModel();

  // کلیدهای فرم برای هر مرحله
  final GlobalKey<FormState> personalInfoFormKey = GlobalKey<FormState>();
  final GlobalKey<FormState> addressFormKey = GlobalKey<FormState>();
  final GlobalKey<FormState> jobInfoFormKey = GlobalKey<FormState>();
  final GlobalKey<FormState> settingsFormKey = GlobalKey<FormState>();

  // مرحله فعلی (شروع از ۰)
  int _currentStep = 0;

  // وضعیت ارسال
  bool _isSubmitting = false;
  String? _submitError;
  bool _submitSuccess = false;

  // Getters
  MultiStepFormModel get formData => _formData;
  int get currentStep => _currentStep;
  bool get isSubmitting => _isSubmitting;
  String? get submitError => _submitError;
  bool get submitSuccess => _submitSuccess;
  bool get isFirstStep => _currentStep == 0;
  bool get isLastStep => _currentStep == 3; // ۴ مرحله داریم (۰ تا ۳)

  // تعداد کل مراحل
  int get totalSteps => 4;

  // به‌روزرسانی داده‌ها
  void updateFormData(MultiStepFormModel newData) {
    _formData = newData;
    notifyListeners();
  }

  // به‌روزرسانی فیلد خاص
  void updateField(String field, dynamic value) {
    switch (field) {
      case 'fullName':
        _formData = _formData.copyWith(fullName: value as String);
        break;
      case 'email':
        _formData = _formData.copyWith(email: value as String);
        break;
      case 'phone':
        _formData = _formData.copyWith(phone: value as String);
        break;
      case 'address':
        _formData = _formData.copyWith(address: value as String);
        break;
      case 'city':
        _formData = _formData.copyWith(city: value as String);
        break;
      case 'postalCode':
        _formData = _formData.copyWith(postalCode: value as String);
        break;
      case 'jobTitle':
        _formData = _formData.copyWith(jobTitle: value as String);
        break;
      case 'company':
        _formData = _formData.copyWith(company: value as String);
        break;
      case 'experience':
        _formData = _formData.copyWith(experience: value as int);
        break;
      case 'newsletter':
        _formData = _formData.copyWith(newsletter: value as bool);
        break;
      case 'termsAccepted':
        _formData = _formData.copyWith(termsAccepted: value as bool);
        break;
    }
    notifyListeners();
  }

  // رفتن به مرحله بعد
  bool nextStep() {
    if (_currentStep < totalSteps - 1) {
      _currentStep++;
      notifyListeners();
      return true;
    }
    return false;
  }

  // رفتن به مرحله قبل
  bool previousStep() {
    if (_currentStep > 0) {
      _currentStep--;
      notifyListeners();
      return true;
    }
    return false;
  }

  // رفتن به مرحله خاص
  void goToStep(int step) {
    if (step >= 0 && step < totalSteps) {
      _currentStep = step;
      notifyListeners();
    }
  }

  // اعتبارسنجی مرحله فعلی
  bool validateCurrentStep() {
    switch (_currentStep) {
      case 0: // اطلاعات شخصی
        return personalInfoFormKey.currentState?.validate() ?? false;
      case 1: // آدرس
        return addressFormKey.currentState?.validate() ?? false;
      case 2: // اطلاعات شغلی
      // برای اسلایدر، اعتبارسنجی دستی
        bool jobValid = _formData.experience >= 0 && _formData.experience <= 50;
        return (jobInfoFormKey.currentState?.validate() ?? false) && jobValid;
      case 3: // تنظیمات
        bool termsValid = _formData.termsAccepted;
        return (settingsFormKey.currentState?.validate() ?? false) && termsValid;
      default:
        return false;
    }
  }

  // ذخیره داده‌های فرم فعلی
  void saveCurrentForm() {
    switch (_currentStep) {
      case 0:
        personalInfoFormKey.currentState?.save();
        break;
      case 1:
        addressFormKey.currentState?.save();
        break;
      case 2:
        jobInfoFormKey.currentState?.save();
        break;
      case 3:
        settingsFormKey.currentState?.save();
        break;
    }
  }

  // ارسال به سرور
  Future<bool> submitForm() async {
    _isSubmitting = true;
    _submitError = null;
    _submitSuccess = false;
    notifyListeners();

    try {
      // شبیه‌سازی درخواست به سرور
      await Future.delayed(const Duration(seconds: 2));

      // اینجا درخواست واقعی رو جایگزین کن
      // final response = await http.post(
      //   Uri.parse('https://your-api.com/submit'),
      //   body: _formData.toJson(),
      // );

      // if (response.statusCode == 200) {
      //   _submitSuccess = true;
      // } else {
      //   throw Exception('خطا در ارسال');
      // }

      // برای تست، موفقیت‌آمیز فرض می‌کنیم
      _submitSuccess = true;

      _isSubmitting = false;
      notifyListeners();
      return true;
    } catch (e) {
      _isSubmitting = false;
      _submitError = e.toString();
      notifyListeners();
      return false;
    }
  }

  // ریست کردن فرم
  void resetForm() {
    _formData = MultiStepFormModel();
    _currentStep = 0;
    _isSubmitting = false;
    _submitError = null;
    _submitSuccess = false;
    notifyListeners();
  }
}