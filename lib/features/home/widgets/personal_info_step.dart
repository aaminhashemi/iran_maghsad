import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/form_provider.dart';

class PersonalInfoStep extends StatelessWidget {
  final String langCode;

  const PersonalInfoStep({super.key, required this.langCode});

  @override
  Widget build(BuildContext context) {
    final formProvider = Provider.of<FormProvider>(context);
    final data = formProvider.formData;

    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Form(
          key: formProvider.personalInfoFormKey, // کلید فرم برای اعتبارسنجی
          autovalidateMode: AutovalidateMode.onUserInteraction, // اعتبارسنجی هنگام تایپ
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 20),
              Center(
                child: Container(
                  width: 80,
                  height: 80,
                  decoration: BoxDecoration(
                    color: Colors.blue.shade100,
                    shape: BoxShape.circle,
                  ),
                  child: const Icon(
                    Icons.person,
                    size: 40,
                    color: Colors.blue,
                  ),
                ),
              ),
              const SizedBox(height: 30),

              // نام و نام خانوادگی
              TextFormField(
                initialValue: data.fullName,
                decoration: InputDecoration(
                  labelText: 'نام و نام خانوادگی',
                  prefixIcon: const Icon(Icons.person_outline),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  filled: true,
                  fillColor: Colors.grey.shade50,
                  errorStyle: const TextStyle(
                    color: Colors.red,
                    fontSize: 12,
                  ),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'این فیلد اجباری است';
                  }
                  if (value.length < 3) {
                    return 'حداقل ۳ کاراکتر وارد کنید';
                  }
                  return null;
                },
                onChanged: (value) => formProvider.updateField('fullName', value),
              ),
              const SizedBox(height: 16),

              // ایمیل
              TextFormField(
                initialValue: data.email,
                decoration: InputDecoration(
                  labelText: 'ایمیل',
                  prefixIcon: const Icon(Icons.email_outlined),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  filled: true,
                  fillColor: Colors.grey.shade50,
                  errorStyle: const TextStyle(color: Colors.red, fontSize: 12),
                ),
                keyboardType: TextInputType.emailAddress,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'ایمیل اجباری است';
                  }
                  if (!RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$').hasMatch(value)) {
                    return 'ایمیل معتبر نیست';
                  }
                  return null;
                },
                onChanged: (value) => formProvider.updateField('email', value),
              ),
              const SizedBox(height: 16),

              // شماره موبایل
              TextFormField(
                initialValue: data.phone,
                decoration: InputDecoration(
                  labelText: 'شماره موبایل',
                  prefixIcon: const Icon(Icons.phone_outlined),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  filled: true,
                  fillColor: Colors.grey.shade50,
                  errorStyle: const TextStyle(color: Colors.red, fontSize: 12),
                ),
                keyboardType: TextInputType.phone,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'شماره موبایل اجباری است';
                  }
                  if (value.length != 11) {
                    return 'شماره موبایل باید ۱۱ رقم باشد';
                  }
                  if (!RegExp(r'^09[0-9]{9}$').hasMatch(value)) {
                    return 'شماره موبایل معتبر نیست (مثال: 09123456789)';
                  }
                  return null;
                },
                onChanged: (value) => formProvider.updateField('phone', value),
              ),
            ],
          ),
        ),
      ),
    );
  }
}